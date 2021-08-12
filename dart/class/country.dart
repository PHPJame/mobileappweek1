class Country {
  var country = "Singapore";
  var city;
  var _animal = "เสือ";
  static var color = "สีแดง";

  Country(this.city, this._animal);

  Country.Sing(String city, String animal) : this(city, animal);

  void callHello(){
    print("สวัสดีครับ");
  }

  String callAnimal() {
    return this._animal;
  } 
}