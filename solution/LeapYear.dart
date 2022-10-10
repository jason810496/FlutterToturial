import 'dart:io';

void solve() {
  dynamic a;
  a = stdin.readLineSync();
  int numA = int.parse(a);

  print(((numA % 400 == 0 || numA % 4 == 0 && numA % 100 != 0) ? "Yes" : "No"));
}

void main(List<String> args) {
  dynamic r;
  r = stdin.readLineSync();
  int n = int.parse(r);

  for (int i = 0; i < n; i++) {
    solve();
  }
}
