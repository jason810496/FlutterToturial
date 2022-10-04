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
    int ans = Nums[0] * Nums[3] * Nums[3] + Nums[1] * Nums[3] + Nums[2];
    print("ans=$ans");
  }
}
