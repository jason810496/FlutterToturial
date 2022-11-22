# Introduction to Widget

「 Everything in Flutter is Widget 」

## Flutter command 

在寫自己的 Widget 之前，先來知道一些在快速開發中常會使用到的 command 


**`create`**

`flutter create your_app_name` 會創建一個叫做 `your_app_name` 的新 Project
![](https://i.imgur.com/IJB6KFw.png)

**`run`**

- `flutter run` 執行該專案
![](https://i.imgur.com/8lbekyr.png)
接著需要選擇要執行的裝置 ( 以下是選擇在 chrome 執行 )
![](https://i.imgur.com/CwY5uKZ.png)

- `r` 可以重新載入專案 ( 不用重新 `run` 就可以載入新增，修改的部分 )

- `q` 停止執行 （ quit )

- `flutter run -d device` 可以指定要執行的裝置

例如 `flutter run -d chrome` 可以直接以 chrome 執行專案 ( 省略剛剛在選 option 的時間 )
![](https://i.imgur.com/gWZo1z4.png)

**`pub`**

`flutter pub package_name` 加入叫做 `pack_name` 的第三方套件


**`help`**

如果忘記 command 要怎麼用也沒關係 `flutter help` 會列出所有指令的說明
![](https://i.imgur.com/tAe5IUm.jpg)

## VSCode Extension

Flutter 的 Widget 很容易不小心就寫到 100 多行，所以當然要使用一些好用的 extension 來幫助我們 ！
![](https://i.imgur.com/8UMBGbe.png)
- Flutter : edit-time syntax check
- Flutter Widget : auto complete

基本上只需要裝這兩個就夠了

## The Base Widget

- **The 「 Hello World ! 」 in Flutter**

如果我們直接 `flutter create app_name` 創建新的專案，在 `lib/main.dart` 會有以下這份 Code ( 把註解拿掉的話 )

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

```

看起來非常複雜... 光是最基本的 「 Hello World 」Code 就要 **70** 行了，我們先來自己寫寫看更簡單的例子

- **import basic package**

在開始撰寫所有的 Widget 之前，要先 import `package:flutter/material.dart` 這個 package ( 所有的 Widget Class 都是定義在這個 package )

`import 'package:flutter/material.dart';`
( 加在 `lib\eample.dart` 的最上面 )

- **IDE : practice of DRY Principle**

如果剛剛有裝好那兩個 extension 的話，只需要在 IDE 打上 `st` ， 就會直接跳出 `StatelessWidget` / `StatefullWidget` 兩個 base widget 
![](https://i.imgur.com/zpv8crP.png)
那我們只需要點一下就完成第一個 Widget 了！ ( 這邊先選用 Stateless Widget )
![](https://i.imgur.com/vqrF66a.png)


- **Stateless Widget**

現在的 code 應該是長這樣 : 

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
IDE 幫我們生成的 `MyWidget` 這個就是最基本的 Widget，我們可以看到
- MyWidget 繼承 StatelessWidget 
- MyWidget 也同樣繼承 parent 的 constructor 
- override parent 的 build method 
- build method 的 return type 是 Widget

而 `Container` 就像是 Web 中的 `Div` ( 一個最基本的矩形 )

**`Stateless Widget`** 就是**無狀態**的 Widget ( 靜態的 Widget ， 從建構後就不會更新了 )

先用最一開始教的 `flutter run` 跑跑看 ( 當然可以用 IDE 自己的 run )

應該會是整個 screen 都是白色的結果：

![](https://i.imgur.com/aDNPldL.png)

Flutter 中的各個 Widget 都有很多可以使用的 properties ( 用來改變大小形狀 ... etc )

先來試試看 Container 的這幾個 properties
- width
- height
- color 

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyWidgetTest extends StatelessWidget {
  const MyWidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.yellow,
    );
  }
}
```
為什麼結果是這樣？
![](https://i.imgur.com/33sKTN5.png)

## Understaning Widget Constraints

這是因為 Container 的 parent 就是 screen ， 而 screen 會強制 Container 變得跟自己一樣大 ( 所以就得到整個 screen 都是黃色的結果 )

但如果修改成： 用一個 `Center` 包住原本的 `Container` 的話 ( 可以用 IDE extension 來幫忙 ！ )
```dart
@override
  Widget build(BuildContext context) {
    // just wrap Container with Center
    return Center(
      child: Container(
        color: Colors.yellow,
        width: 100,
        height: 100,
      ),
    );
  }
```
結果會如下：
![](https://i.imgur.com/neEQR3h.png)
因為 screen 強制 `Center` 跟 screen 一樣大，所以 `Center` 充滿 screen 

然後 `Center` 告訴 `Container` 可以變成任意大小但是不能超過 screen 的大小 ， 所以我們得到我們想的 100x100 的 `Container` 了 ! 

[Flutter : Understanding constraints](https://docs.flutter.dev/development/ui/layout/constraints)

這邊有其他的例子： ( 可以在執行前先想想看結果會長怎樣 )
- Ex1 : 內層多一個 Container
```dart
Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 100,
      height: 100,
      child: Container( 
        color: Colors.blue,
        width: 50,
        height: 50,
      ),
    );
  }
```
- Ex2: 延續 Ex1 ， 最外層多一個 Center 
```dart 
Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        width: 100,
        height: 100,
        child: Container( 
          color: Colors.blue,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
```
- Ex3: Center 加在內層的 Container
```dart 
return Container(
  color: Colors.yellow,
  width: 100,
  height: 100,
  child: Center(
    child: Container( 
      color: Colors.blue,
      width: 50,
      height: 50,
    ),
  ),
);
```
- Ex4: 內/外層的 Container 都加上 Center 
```dart 
return Center(
  child: Container(
    color: Colors.yellow,
    width: 100,
    height: 100,
    child: Center(
      child: Container( 
        color: Colors.blue,
        width: 50,
        height: 50,
      ),
    ),
  ),
);
```

## Think in Widget Tree

如果我們想寫出這樣的 Widget : 
![](https://i.imgur.com/jBdemFo.png)

在寫 Widget 時，大致上會依據**大到小**原則來寫，能以 Widget Tree 的思維來寫當然是最好的
![](https://i.imgur.com/DsYyWAM.png)
```dart
... 
                 date,
                      style:const TextStyle(
                        fontSize:13,
                        color:Colors.white60,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Icon(Icons.done_all,size:20,color: Colors.white60,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Split Big Widgets into Modules

為了要避免掉以上那種階層地獄，會視情況(可能是根據功能，複雜程度)把大 Widget 分寫成好幾個小 Widget

例如這是簡單的 App 架構圖
```
App {
  Home {
    Animation{}
    Gallery{}
  }
  Members{
    MembersCard{}
    Profile{}
  }
}
```
就會建議把 `Animation` `Gallery` `MembersCard` `Profile` 這幾個 Widget 分在各個檔案編輯( 分別命名為 `Animation.dart` `Gallery.dart` ... ) 然後在根據階層 import 到大 Widget ( `App.dart` import , `Home.dart` import `Animaton.dart` ) 

檔案路徑可能會像這樣：
```
.
├── home
│   ├── animation.dart
│   └── gallery.dart
├── home.dart
└── main.dart
```

## Stateful Widget

有狀態的 Widget ( 動態的 Widget ， 會根據使用者狀態更新 )

```dart
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```


## Widget , A bunch of Widgets

這邊有各種 Widgets ( 按照功能或主題分類 ) 可以先大致瀏覽過再開始自己練習建 UI 看看
[Widget catalog](https://docs.flutter.dev/development/ui/widgets)


## Some References

[Widget Layout](https://docs.flutter.dev/development/ui/layout)
[Advance Flutter](https://ithelp.ithome.com.tw/users/20134548/ironman/4459)
[MaterialApp , WidgetApp Example & Troubleshooting](https://api.flutter.dev/flutter/material/MaterialApp-class.html)
[Example of using `WidgetApp` to create App](https://gist.github.com/antronic/e4953ae41b2c15492d9be5a5e8c07bec)

