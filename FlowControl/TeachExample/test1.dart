import 'dart:io';

void PrintOAO() {
  print("OAO");
}

int FindMax(List<int> L) {
  int mx = 0;
  for (int i in L) {
    mx = (i > mx ? i : mx);
  }
  return mx;
}

void main(List<String> args) {
  dynamic input = stdin.readLineSync();
  int num = int.parse(input);

  print(num);

  List<int> nums = [1, 2, 3];

  for (int i in nums) {
    print(i);
  }

  for (int i = 0; i < n; i++) {}
}
