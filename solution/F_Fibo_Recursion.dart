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

int RecursionFibo(int n) {
  if (n <= 2) return 1;
  return RecursionFibo(n - 1) + RecursionFibo(n - 2);
}

void main(List<String> args) {
  int n = ReadInt();
  stdout.write(RecursionFibo(n));
}
