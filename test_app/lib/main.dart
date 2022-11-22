import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      // color: Colors.blue,
      width: 100,
      height: 100,
      child: const Text('123',textDirection: TextDirection.ltr),
    );
  }
}




// import 'package:flutter/material.dart';

// void main() {
//   // runApp(const MyApp());
//   runApp(const RootApp());
// }

// // step 0 
// class RootApp extends StatelessWidget {
//   const RootApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false, // disable the top-right 'debug' banner
//       home:MyWidget(),
//     );
//   }
// }

// // step 1 
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black,
//       child: const Text('123'),
//     );
//   }
// }

// // step 2 
// class MyWidget2 extends StatelessWidget {
//   const MyWidget2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black,
//       child: const Scaffold(body: Text('123'),),
//     );
//   }
// }