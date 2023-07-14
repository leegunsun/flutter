import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_13/counter.dart';
import 'package:provider_overview_13/show_me_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anonymous Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) =>
            ChangeNotifierProvider.value(value: _counter, child: MyHomePage()),
        '/counter': (context) => ChangeNotifierProvider.value(
            value: _counter, child: ShowMeCounter())
      },
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => context.read<Counter>().increment(),
              child: Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20),
              ))
        ],
      )),
    );
  }
}
