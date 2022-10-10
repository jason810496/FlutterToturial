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
  Set<int> st = {};
  bool flag = true;

  for (int i = 0; i < n; i++) {
    int target = k - arr[i];
    if (st.contains(target)) {
      flag = false;
      break;
    }
    st.add(arr[i]);
  }

  stdout.write((flag ? "NO" : "YES"));
}
