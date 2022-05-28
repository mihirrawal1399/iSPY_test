
import 'package:flutter/material.dart';
import 'package:ispy/pages/onlinePlayersList.dart';
import 'package:ispy/pages/signinPage.dart';
import 'package:ispy/pages/splashscreen.dart';
import 'package:ispy/pages/takePicture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iSPY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenWidget(),
      routes: {
        // When navigating to the "/" route, build the HomeScreen widget.
        // '/': (context) => const SplashScreenWidget(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signin': (context) => const SignInWidget(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
