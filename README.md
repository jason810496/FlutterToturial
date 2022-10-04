# Quick Dart Toturial 

- [Dart Pad](https://dartpad.dev/?) : 專門跑 `Dart` 的線上 IDE
- [Replit](https://replit.com) : 線上的 IDE 可以跑各種語言，包括 `Dart` 
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

## Compile Dart

在 CLI 執行 `.dart` 檔案 ： `dart run FILE_NAME.dart`

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

用來宣告**不能被修改**的變數：
```dart
final a = "This is a final variable";
const b = [ 1,2,4];
```

看起來與 `var` 和 `dynamic` 沒什麼差？（ **那我可以都用 `var` 就好了嗎？**

答案是可以的！不過適當的使用 `final` 與 `const` 可以提升程式的健壯性，主要用來保護變數（ 例如該變數從頭到尾都不應該修改到時，就可以使用 `const` 宣告，來達到**健壯性**

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

關於 `var`,`dynamic`,`Object`,`final`,`const`,`late`的各種比較：

[Difference between `Object` , `var` and `dynamic` (StackOverFlow)](https://stackoverflow.com/questions/68570162/difference-between-object-dynamic-and-var-in-dart)

### Summary of Variables

- **變數命名規則**
不要與 keywords 重複，不要以數字開頭，或是以 `-` 連接變數名稱
- **初始化規則**
在宣告變數時，順便設定初始值給變數

## Build-in types

### Numbers
- `int`
整數型態：可以存 `-2^63` 到 `2^63-1` 的整數
- `double`
浮點數： `1.234` , `3.14159` 

```dart
double Pi = 3.14;
int BigNumber = 999999;
```
### Strings
- `String`
字串：可以用 `''`（單引號）或`""`（雙引號）包住要存的字串

```dart
String str1 = '123.124';
String str2 = "a stands for apple";
```
### Booleans
- `bool`
布林值：專門用來表示 `true` 或 `false` 的型態
```dart
bool flag = false;
List<int> arr = [ 1,2,3,4,5 ];
for(int i=0;i<n;i++){
  if( arr[i] == 3 ){
    flag = true;
  }
}

if( flag ){
  // todo 1
}
else{
  // todo 2
}
```

## I/O

這邊的 I/O 是 Console 的輸入輸出 ( Hint : 如果是使用線上 IDE 的話，Console I/O 在 [DartPad](https://dartpad.dev/?) 無法使用，不過在 [Replit](https://replit.com) 可以正常使用 )

必需要 import 的 library : `dart:io`

- 輸入：
  - `stdin.readLineSync()`
- 輸出：
  - `print( var )`
  - `stdout.write( var )`
  - `stdout.writeln( var )`
  - `stdout.writeAll( IterableObject )`

**那要如何在字串中輸出變數？**

在字串中的變數名稱前加上 `$` 符號 ：

`print( "Age : $person_age" );`

基本架構 ： 
```dart
import 'dart:io';

void main(List<String> args) {
  dynamic str = stdin.readLineSync();
  print("Hi , my name is $str !");
}
```
結果 : 
```
[ in] : 123
[out] : Hi , my name is 123 !
```

（ 為什麼要知道 Console I/O ? 在日後開始寫 APP 時可以方便 Debug ! ）
### Practice 
## Flow Control

在 `Dart` 中的流程控制語法（ `if/else`,`for/while`,`break/continue` ）都與 `C/C++` , `JS` , `Java` 都相同：
### if/else Statement

```dart
if( status1 ){
  // todo 1
}
else if( status2 ){
  // todo 2
}
else{
  // todo 3
}
```

同樣的 `dart` 也有支援**三元運算子**：`( condition ? exprIfTrue : exprIfFalse )`
```dart
print( (a>b ? a:b) );
```

#### Practice
### Loop
#### For loops
```dart
int n = 10;
for(int i=0;i<n;i++){
  print(i);
}
```
#### While loops

```dart
int l=0 ,r=10;
while( l<=r ){
  int mid = (l+r)/2;
  if( check(mid) ) l=mid+1;
  else r=mid-1;
}
```
#### Break and Continue 
```dart
List<int> arr = [1,2,3,4,5,6,7,8];
for(int i=0;i<arr.length;i++){
  if( arr[i] % 2 == 0){
    continue;
  }
  else if( arr[i] == 5 ){
    print( arr[i] );
    break;
  }
}
```
#### Practice 
## Function

也與 `C/C++` 和 `JS` 相同，都是 `RETURN_TYPE FUNCTION_NAME(PARAMETERS){}` 的語法：
```dart
void PrintElement(int num){
  print( num );
}

int Two(int num){
  return num<<1;
}
```
## Data Structure
- **List**
`Dart` 中的 List 就是其他程式語言中的 array 
```dart
List<int> arr = [1,2,3];
var arr2 = [ 'john' , 'joe' , 'jef' ];

```
- **Set**

```dart
var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.
```

- **Map**

`Dart` 中的 `Map` 相當於 `python` 中的 `dictionary` , 可以在初始化時建立好 key value pair , 也可以用 `MAP[KEY] = VALUE` 加入新 key value pair

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

gifts['fourth'] = 'calling birds'; // Add a key-value pair
```

#### Practice

## Reference 