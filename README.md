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

- **命名規則** 
識別字 ( Identifier ) 也就是變數（ variable ）、函式 ( function )、類別 ( class ) 的名稱，而 Identifier 的命名也有一些要求：

1. 不能以**數字開頭**
```dart
int 1One = 1;
```
2. 不能以 `-` **( 負號 )** 連接
```dart
int a-b-c = 10;
```
3. 不能是**保留字（ keywords ）**
```dart
int continue = 3;
```
所有的保留字可見：[Keywords List](https://dart.dev/guides/language/language-tour#keywords)

以下是合法的變數名稱：
```dart
int NumberOne = 1;
String my_name = 'Jason';
double Pi314159 = 3.14159;
```
- **初始化規則**

在 `C/C++` 中，這樣的程式是可以編譯的： （ 只是輸出結果是未初始化的變數 ）
```c
int main(){
  int num;
  printf("%d" , num );
  return 0;
}
```
如果換成 `Dart` 來寫：
```c
void main(){
  int num;
  printf( num );
}
```
會發現無法編譯，因為 `Dart` 不允許程式存取未經過初始化的變數 （ 所有變數在未初始化前都是 `null` object ，但是 `Dart` 不允許在存取變數以前，該變數還是 `null` Object ) 
```
line 3.The non-nullable local variable 'num' must be assigned before it can be used.
```
（ 用 `Dart` 改寫後的錯誤訊息 ， 關於[存取未初始化變數](https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=not_assigned_potentially_non_nullable_local_variable#not_assigned_potentially_non_nullable_local_variable)的完整說明 ）


- 解決方法 ： 

加上 `?` 在變數型態後方（ 讓該變數變成 `nullable` ， 也就是 ）
```dart
void main(){
  int? num;
  printf( num );
}
```

執行結果：
```
null
```

或是在每次宣告變數時都預先**初始化變數** （ 如：`int a = 0 ;` ）

### late variables

在**流程簡單**的程式中， `Dart` 的流程分析工具能自動偵測出：能檢查出變數在被存取前，是否已經被賦予值。

以簡單的例子說明：
```dart
import 'dart:io';

void main(){
  
  int num;
  String name = stdin.readLineSync();
  
  if( name == 'admin' ){
    num = 10 ;
  }
  else{
    num = -10;
  }

  print( num );
}
```
可以看到 `num` 在宣告時並沒有初始化，不過在後面的 `if/else` statement 中：`Dart` 的流程分析工具可以偵測出在執行 `print( num )` 之前，`num` 一定會被賦予實際的值（ `num` 不再是 `null` object ，而是 `int` object ）


不過在更複雜的流程控制中，`Dart` 的流程分析工具不一定能偵測出變數是否已經被賦予值，這會導致先前提過的[存取未初始化變數](https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=not_assigned_potentially_non_nullable_local_variable#not_assigned_potentially_non_nullable_local_variable)錯誤 （ 這邊假設宣告方式是 `int num;` 而非 `int num=0;` 這種在宣告變數時已經初始化過的情況 ）





### final and const


### Important Concept of `Dart`

- 在 `Dart` 中，所有東西都是**類別的實例** ( instance of a class )

無論是 `int`、`bool`、`function` （ 連 `null` 自己也是一個 class ) 在 [Dart core library](https://api.dart.dev/stable/2.18.1/dart-core/Object-class.html) 可以看到所有 type 的 class 定義 （ 而所有的型態都繼承至 `Object` class ）

- `Sound null safety` 機制 （ 前面所提到的`初始化規則`中更詳細的內容 ）
在 `2.12` 版本中，`Dart` 引進 `sound null safety` 機制（ 避免潛在的 `runtime error` ，使 IDE 能在 `edit-time` 就能檢查出來 ）

所以所有的變數需要經過**初始化**才能存取，或是需要允許 `nullable` （ 或是加上 `late` 修飾詞、用 `Object`、`dynamic` 型態宣告 ）才能正常編譯。

這邊是關於 `null safety` 更詳細的教學 （ 如果想完全了解 `sound null safety` 可以看完 document 再練習 `null safety` 的語法 ）

- [Understanding null safety](https://dart.dev/null-safety/understanding-null-safety)
- [Practice of null safety syntax](https://dart.dev/codelabs/null-safety)



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