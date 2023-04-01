class CountryModel {
  late final String name;
  late final String posName;
  late final String hcomLocale;
  late final String accuWeatherLocale;

  CountryModel(
      {required this.name, required this.posName, required this.hcomLocale, required this.accuWeatherLocale});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name']??'';
    posName = json['posName']??'';
    hcomLocale = json['hcomLocale']??'';
    accuWeatherLocale = json['accuWeatherLocale']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['posName'] = posName;
    data['hcomLocale'] = hcomLocale;
    data['accuWeatherLocale'] = accuWeatherLocale;
    return data;
  }
  static List<CountryModel> listFromJson(list){
    List<CountryModel> tempList=[];
    try{
      list.forEach((key, val) {
        tempList.add(CountryModel.fromJson(val));
      });
      return tempList;
    }catch(e){
      return tempList;
    }
  }

}