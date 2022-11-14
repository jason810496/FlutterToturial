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

int n = 0, k = 0;
List<int> arr = [];
List<int> ans = [];
List<bool> visited = [];

bool flag = true;

void DFS(int cur, int last) {
  if (last == 0) {
    for (int i in ans) {
      stdout.write("$i ");
    }
    stdout.writeln();
    flag = false;
    return;
  }
  if (cur == n) return;

  // add current
  ans.add(arr[cur]);
  visited[cur] = true;
  DFS(cur + 1, last - arr[cur]);
  ans.removeLast();
  visited[cur] = false;
  // don't add current
  DFS(cur + 1, last);
}

void main(List<String> args) {
  List<int> r = ReadIntList();
  n = r[0];
  k = r[1];

  arr = ReadIntList();
  for (int i = 0; i < n; i++) {
    visited.add(false);
  }

  arr.sort();

  DFS(0, k);

  if (flag) {
    print(-1);
  }
}
