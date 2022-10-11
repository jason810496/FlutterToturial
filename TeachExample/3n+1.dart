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

  while (n != 1) {
    if (n % 2 == 0) {
      n = n ~/ 2;
    } else {
      n = n * 3 + 1;
    }
    stdout.writeln(n);
  }
}
