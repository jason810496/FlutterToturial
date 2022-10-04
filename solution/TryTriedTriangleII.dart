import 'dart:io';

void main(List<String> args) {
  dynamic a;
  a = stdin.readLineSync();
  int n = int.parse(a);
  
  for (int i = 1; i <= n; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write("*");
    }
    stdout.writeln();
  }
}
