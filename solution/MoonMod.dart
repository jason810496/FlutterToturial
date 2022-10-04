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
  int T = ReadInt();

  for (int t = 0; t < T; t++) {
    List<int> Nums = ReadIntList();
    print( ( Nums[0]%Nums[1] == 0 ? "Yes" : "No" ) );
  }
}
