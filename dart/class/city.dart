
import 'country.dart';
import 'problem.dart';

class City extends Country with Problems {
  City() : super("สิงคโปร์", "สิงโตทะเล");

  void callSuper() {
    print("เมืองหลวง :" + super.city);
    super.callHello();
  }

  @override
  String callAnimal() {
    return "สิงโตทะเล";
  }
}
