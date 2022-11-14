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
  int n = ReadInt();
  List<int> counter = List<int>.filled(10, 0);

  for (int i = 0, x; i < n; i++) {
    x = ReadInt();
    counter[x % 10]++;
  }

  for (int i = 0; i < 10; i++) {
    stdout.write("${counter[i]}  ");
  }
}
