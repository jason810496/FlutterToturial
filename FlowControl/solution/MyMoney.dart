import 'dart:io';

void main(List<String> args) {
  dynamic a, b;
  a = stdin.readLineSync();
  b = stdin.readLineSync();

  int numA = int.parse(a);
  int numB = int.parse(b);

  print(numA - numB);
}
