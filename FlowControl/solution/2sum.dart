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
  int k = Input[1];

  List<int> arr = ReadIntList();

  bool flag = true;

  for (int i = 0; i < n && flag; i++) {
    for (int j = i - 1; j >= 0; j--) {
      if (arr[i] + arr[j] == k) {
        flag = false;
        break;
      }
    }
  }

  stdout.write((flag ? "NO" : "YES"));
}
