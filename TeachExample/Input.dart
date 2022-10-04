import 'dart:io';

void main(List<String> args) {
  dynamic one = stdin.readLineSync();

  int OneNum = int.parse(one);

  print("This is a num : $OneNum ");

  dynamic line = stdin.readLineSync();

  List<String> splitted = line.split(' ');
  List<int> NumList = splitted.map(int.parse).toList();

  print(NumList);

  print(NumList[1] - NumList[0]);
}
