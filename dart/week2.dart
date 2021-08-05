void main() {
  //callGen(1991);
  
  var x = callColor("white");
  print(x);

  callweb("Google",protocal: "https", port : 443);
}

//การคำนวณ generation แบบ Arrow
String callGen(int year) => (year >= 1996) ? "Gen Z" : "Gen Y";

//เพิ่มสี โดยใช ้ list , for in มีการ return ค่า และมี Position Parameter
int callColor([String newColor = "pink"]) {
  List<dynamic> color = ["red", "blue", "green"];
  color.add(newColor);
  for (var item in color) {
    print(item);
  }
  return color.length; //return ค่าและนับจำนวน
}

//port แบบ Arrow และมี Named Parameter
void callweb(String web, {int port = 80, String protocal = "http"}) =>
  print("$protocal : $web : $port");

/*
void callColor() {
  List<dynamic> color = ["red","blue","green"];
  for(var item in color) {
    print(item);
  }
  print(color.length);
}
*/

/*
String callGen(int year) {
  var x = (year >= 1996) ? "Gen Z" : "Gen Y";
  return x;
}
*/

/*
void callGen(int year) {
  (year >= 1996) ? print("Gen Z") : print("Gen Y");
}
*/

/*
void callGen(int year) {
  var year = 2000;

  if (year >= 1996){
    print("Gen Z");
  } else {
    print("Gen Y");
  }
}
*/

