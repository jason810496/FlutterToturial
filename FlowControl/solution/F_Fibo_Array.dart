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

int ArrayFibo(int n) {
  List<int> arr = [1, 1];
  for (int i = 2; i < n; i++) {
    arr.add(arr[i - 1] + arr[i - 2]);
  }
  return arr.last;
}

void main(List<String> args) {
  int n = ReadInt();
  stdout.write(ArrayFibo(n));
}
