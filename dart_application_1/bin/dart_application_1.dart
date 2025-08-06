import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1.calculate()}!');
  String userName = "Báo Fultter";
  bool isLoginRecently = true;
  const String  API_KEY = "ahsagdjkcv";//ko thể thay đổi đc
  final int AGE = 30;//có thể thay đổi đc
  int number = 20;
  //print("gia tri cua number: " + number.toString());
  //print("gia tri cua number: $number ");
  number = AGE + 10;
  print("gia tri cua number: $number ");
  
  double point =8.5;
  bool isSignedUp = false;
  if (isSignedUp) print("Đã đăng kí");
  else print("$userName chưa đăng kí");
  
  //Null safety
  //Dart SDK < 2.12: Chưa sử dụng Null safety
  //Dart SDK >= 2.12: Đã sử dụng Null safety

  int ?birthYeah;
  number = birthYeah! + 50;
  print ("$number");


}