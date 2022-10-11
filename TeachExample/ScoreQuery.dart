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
  List<int> r = ReadIntList();
  int n = r[0], m = r[1];

  List<int> arr = [];
  arr.add(0);
  
  for (int i = 0; i < n; i++) {
    int x = ReadInt();
    arr.add(x);
  }
  for (int i = 0; i < m; i++) {
    int x = ReadInt();
    stdout.writeln(arr[x]);
  }
}
