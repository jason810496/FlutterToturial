import 'dart:io';

int ReadInt() {
  dynamic input;
  input = stdin.readLineSync();
  return int.parse(input);
}

List<int> ReadIntList() {
  dynamic input;
  input = stdin.readLineSync();
  List<String> Line = input.split(' ');
  List<int> Result = Line.map(int.parse).toList();
  return Result;
}

void main(List<String> args) {
  for (int i = 1; i <= 9; i++) {
    for (int j = 1, x; j <= 9; j++) {
      x = i * j;
      stdout.write("$i * $j = $x ");
    }
    stdout.writeln();
  }
}
