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

bool IsPrime(int n) {
  bool flag = true;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      flag = false;
      break;
    }
  }

  return flag;
}

void main(List<String> args) {
  int t = ReadInt();
  for (int i = 0; i < t; i++) {
    int n = ReadInt();
    if (IsPrime(n)) {
      stdout.writeln("YES");
    } else {
      stdout.writeln("NO");
    }
  }
}
