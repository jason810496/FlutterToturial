import 'dart:io';

void main(List<String> args) {
  dynamic a;
  a = stdin.readLineSync();
  int numA = int.parse(a);

  print( ( (numA % 400 == 0 || numA%4==0 && numA % 100 != 0 ) ? "Yes":"No" ) );
}
