import 'city.dart';
//import 'country.dart';

void main() {
    print("Hello World");

  /* Country item = new Country.Sing("สิงคโปร์", "สิงโตทะเล");
    print("Welcome to " + item.country);
    item.callHello();
    print("เมืองหลวง : " + item.city);
    print("สัตว์ประจำชาติ : " + item.callAnimal());
    print("สีประจำชาติ : " + Country.color);*/

  var order = City();
  print("Welcome to " + order.country);
  order.callSuper();

  print(order.callAnimal());
  order.callProblem();
}