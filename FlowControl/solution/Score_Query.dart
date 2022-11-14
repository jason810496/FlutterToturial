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
  List<int> Input = ReadIntList();
  int n = Input[0];
  int q = Input[1];

  List<int> arr = [];
  arr.add(0);

  for (int i = 0; i < n; i++) {
    int x = ReadInt();
    arr.add(x);
  }
  for (int i = 0; i < q; i++) {
    int x = ReadInt();
    stdout.writeln(arr[x]);
  }
}
