import 'dart:io';

void main(List<String> args) {
  dynamic str = stdin.readLineSync();
  print("Hi , my name is $str !");
  stdout.write("Hi , my name is $str !");
}
