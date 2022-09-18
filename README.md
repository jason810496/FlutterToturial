# Quick Dart Toturial 

- [Dart Pad](https://dartpad.dev/?) : 專門跑 `Dart` 的線上 IDE
- [Dart Doc Language Tour](https://dart.dev/guides/language/language-tour) : `Dart` 的官方文件

## Basic Dart Program 
```dart
void main() {
  print('Hello World!');
}

// this is a hello world program written in Dart
```

這是用 `Dart` 寫的 Hello World 程式 ！
像是 `C/C++` ， `Dart` 的主程式也需要寫在 `main` 函式中（ 函式會在後面的章節提到 ）

以下是另一個範例程式：
```dart
void main(){
    var MyName = 'Jason' ;
    print('My name is' + MyName );
}

這是一個
```

## Variables 

就像 `js` , `dart` 有支援動態型態 ( 不需要先指定好變數的型態 ， 不過在 `Dart` 中 `var` 的用法與 `js` 有所差異，可見 [Detail Information](#detail-information) )
```dart
var One = 1;
var Name = 'John';
var NumArray = [ 1, 2, 3 ];
```

也可以像 `C/C++` 一樣，有支援靜態型態 （ 一開始就指定好變數的型態 ）

所以可以將以上動態類型的程式改寫成靜態型態，結果如下：
```dart
int One = 1;
String Name = 'John';
List<int> NumArray = [ 1, 2, 3 ];
```

### Basic Variables Rules

- 變數命名規則 : 

- 初始化規則 : 

### Keywords List

### Important Concept of `Dart`

- 在 `Dart` 中，所有東西都是**類別的實例** ( instance of a class )

無論是 `int`、`bool`、`function` （ 連 `null` 自己也是一個 class ) 在 [Dart core library](https://api.dart.dev/stable/2.18.1/dart-core/Object-class.html) 可以看到所有 type 的 class 定義

- `Sound null safety` 機制 （ 前面所提到的`初始化規則`中更詳細的內容 ）
在 `2.12` 版本中，`Dart` 引進 `null safety` 機制（ 避免潛在的 `runtime error` ，使 IDE 能在 `edit-time` 就能檢查出來 ）

所以所有的變數

### Detail of Null safety

[Understanding null safety](https://dart.dev/null-safety/understanding-null-safety#late-final-variables)
[Practice of null safety syntax](https://dart.dev/codelabs/null-safety)



### 




### Detail Information 

[Difference between `Object` , `var` and `dynamic` (StackOverFlow)](https://stackoverflow.com/questions/68570162/difference-between-object-dynamic-and-var-in-dart)

### Summary of Variables

## Build-in types
### Numbers
- `int`
- `double`
### Strings
- `String`
### Booleans

## I/O
### Practice 
## Flow Control
### if/else Statement 
#### Practice
### Loop
#### For loops
#### While loops
#### Break and Continue 
#### Practice 
## Function 
## Data Structure


## Reference 