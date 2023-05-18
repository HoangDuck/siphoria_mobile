import UIKit
import Flutter
import MomoiOSSwiftSdk

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
//    var window: UIWindow?
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller = window.rootViewController as? FlutterViewController
            let nativeChannel = FlutterMethodChannel(name: "flutter.native/helper", binaryMessenger: controller as! FlutterBinaryMessenger)
            nativeChannel.setMethodCallHandler { (FlutterMethodCall, FlutterResult) in
                self.result = FlutterResult
                if("createPaymentMomo" == FlutterMethodCall.method) {
                let paymentInfo = NSMutableDictionary()
                        paymentInfo["merchantcode"] = "CGV01"
                        paymentInfo["merchantname"] = "CGV Cinemas"
                        paymentInfo["merchantnamelabel"] = "Service"

                        paymentInfo["amount"] = 20000
                        paymentInfo["fee"] = 20000
                        paymentInfo["description"] = "Thanh toán vé xem phim"
                        paymentInfo["extra"] = "{\"key1\":\"value1\",\"key2\":\"value2\"}"
                        paymentInfo["username"] = payment_userId
                        paymentInfo["appScheme"] = "momoqdd420220927"
                    self.createPaymentMomo(paymentInfoParam: paymentInfo)
                } else {
                    FlutterResult(FlutterMethodNotImplemented)
                }
            }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func createPaymentMomo(paymentInfoParam: NSMutableDictionary) -> NSString?{ //<partnerSchemeId>: app uniqueueId provided by MoMo , get from business.momo.vn. PLEASE MAKE SURE TO ADD <partnerSchemeId> TO PLIST file ( URL types > URL Schemes ). View more detail on https://github.com/momo-wallet/mobile-sdk/tree/master/ios
      MoMoPayment.createPaymentInformation(info: paymentInfoParam)
      openAppMoMo()
      return nil
  }

    override func applicationWillResignActive(_ application: UIApplication) {
          // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
          // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
      }

    override func applicationDidEnterBackground(_ application: UIApplication) {
          // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
          // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
      }

    override func applicationWillEnterForeground(_ application: UIApplication) {
          // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
      }

    override func applicationDidBecomeActive(_ application: UIApplication) {
          // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
      }

    override func applicationWillTerminate(_ application: UIApplication) {
          // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
      }
    override func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
          MoMoPayment.handleOpenUrl(url: url, sourceApp: sourceApplication!)

          return true
      }

    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
          MoMoPayment.handleOpenUrl(url: url, sourceApp: "")
          return true
      }

   @objc func openAppMoMo() {
           MoMoPayment.requestToken()
       }
   @objc func NoficationCenterTokenReceived(notif: NSNotification) {
               //Token Replied - Call Payment to MoMo Server
               print("::MoMoPay Log::Received Token Replied::\(notif.object!)")
               //lblMessage.text = "RequestToken response:\n  \(notif.object as Any)"

               let response:NSMutableDictionary = notif.object! as! NSMutableDictionary
               let _reference_orderId = response["orderId"] as! String
               let _statusStr = "\(response["status"] as! String)"
               let _messageStr = "\(response["message"] as! String)"
       }
}
