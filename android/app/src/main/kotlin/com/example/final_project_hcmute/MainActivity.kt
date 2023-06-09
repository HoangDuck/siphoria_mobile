package com.example.final_project_hcmute

import android.content.Intent;
import io.flutter.embedding.android.FlutterActivity
import vn.momo.momo_partner.AppMoMoLib;
import vn.momo.momo_partner.MoMoParameterNameMap;
import org.json.JSONException;
import org.json.JSONObject;
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.annotation.NonNull
class MainActivity: FlutterFragmentActivity() {
    private var amount = "10000"
    private val fee = "0"
    var environment = 0 //developer default

    private val merchantName = "SIPHORIA"
    private val merchantCode = "MOMOQDD420220927"
    private val merchantNameLabel = "Nhà cung cấp"
    private val description = "Fast & Furious 8"
    private lateinit var resultMethod: MethodChannel.Result
    private val CHANNEL = "flutter.native/helper"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            resultMethod = result
            when (call.method) {
                "openMomo" -> {
                    AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT);
                    var value = call.argument<String>("value")
                    requestPayment(value!!)

                }

            }
        }
    }

    //Get token through MoMo app
    private fun requestPayment(payment: String) {
//        if(environment == 0){
//            AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT);
//        }
//        if(payment == null){
////            payment = "";
//        }
        val paymentArrays = payment.split(";").toTypedArray()
        AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT);
//        else if(environment == 1){
//            AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT);
//        }else if(environment == 2){
//            AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.PRODUCTION);
//        }
        AppMoMoLib.getInstance().setAction(AppMoMoLib.ACTION.PAYMENT)
        AppMoMoLib.getInstance().setActionType(AppMoMoLib.ACTION_TYPE.GET_TOKEN)
//        if (edAmount.getText().toString() != null && edAmount.getText().toString().trim().length() !== 0) amount = edAmount.getText().toString().trim()
//        val eventValue: Map<String, Object> = HashMap()
        val eventValue = mutableMapOf<String?, Any?>()
//        //client Required
        eventValue.put("merchantname", merchantName) //Tên đối tác. được đăng ký tại https://business.momo.vn. VD: Google, Apple, Tiki , CGV Cinemas
        eventValue.put("merchantcode", merchantCode) //Mã đối tác, được cung cấp bởi MoMo tại https://business.momo.vn
        eventValue.put("amount", paymentArrays[0]) //Kiểu integer
        eventValue.put("orderId", paymentArrays[1]) //uniqueue id cho Bill order, giá trị duy nhất cho mỗi đơn hàng
        eventValue.put("orderLabel", "Mã đơn hàng") //gán nhãn

        //client Optional - bill info
        eventValue.put("merchantnamelabel", "Thanh toán booking của Siphoria") //gán nhãn
        eventValue.put("fee",  "0") //Kiểu integer
        eventValue.put("description", paymentArrays[2]) //mô tả đơn hàng - short description

        //client extra data
        eventValue.put("requestId", merchantCode + "merchant_billId_" + System.currentTimeMillis())
        eventValue.put("partnerCode", merchantCode)
        //Example extra data
        val objExtraData = JSONObject()
        try {
            objExtraData.put("site_code", "008")
            objExtraData.put("site_name", "Siphoria Booking Hotel")
            objExtraData.put("screen_code", 0)
            objExtraData.put("screen_name", "Special")
            objExtraData.put("movie_name", "Kẻ Trộm Mặt Trăng 3")
            objExtraData.put("movie_format", "2D")
        } catch (e: JSONException) {
            e.printStackTrace()
        }
        eventValue.put("extraData", objExtraData.toString())
        eventValue.put("requestType", "payment");
        eventValue.put("language", "vi");
        eventValue.put("extra", "")
        AppMoMoLib.getInstance().requestMoMoCallBack(this, eventValue)
//        return "";
    }

    //Get token callback from MoMo app an submit to server side
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == AppMoMoLib.getInstance().REQUEST_CODE_MOMO && resultCode == -1) {
            println((data==null).toString())
            if (data != null) {
                println((data.getIntExtra("status", -1)).toString())
                if (data.getIntExtra("status", -1) === 0) {
                    //TOKEN IS AVAILABLE
//                    tvMessage.setText("message: " + "Get token " + data.getStringExtra("message"))
                    val token = data.getStringExtra("data") //Token response
                    val phoneNumber = data.getStringExtra("phonenumber")
                    val message = data.getStringExtra("message")
//                    val env = data.getStringExtra("env")
//                    if (env == null) {
//                        env = "app"
//                    }
                    val env = "app"
                    println("Token: "+(token).toString())
                    if (token != null && !token.equals("")) {
                        // TODO: send phoneNumber & token to your server side to process payment with MoMo server
                        // IF Momo topup success, continue to process your order
                        resultMethod.success(message)
                    } else {
                    }

                } else if (data.getIntExtra("status", -1) === 1) {
                    //TOKEN FAIL
                    val message = if (data.getStringExtra("message") != null) data.getStringExtra("message") else "Thất bại"
//                    tvMessage.setText("message: $message")
                } else if (data.getIntExtra("status", -1) === 2) {
                    //TOKEN FAIL
                } else {
                    //TOKEN FAIL
                }
            } else {
            }
        } else {
        }

//        resultMethod.success("requestPayment(value)")
    }
}

object MoMoConstants {
    var KEY_ENVIRONMENT = "key_environment"
}
