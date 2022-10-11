import 'dart:ffi';
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
  int N = ReadInt();
  for (int i = 0; i < N; i++) {
    List<int> arr = ReadIntList();
    if (arr[0] == 1) {
      stdout.writeln(arr[1] + arr[2]);
    } else if (arr[0] == 2) {
      stdout.writeln(arr[1] - arr[2]);
    } else if (arr[0] == 3) {
      stdout.writeln(arr[1] * arr[2]);
    } else {
      stdout.writeln((arr[1] / arr[2]).toInt());
      // stdout.writeln( (arr[1] ~/ arr[2]));
    }
  }
}
