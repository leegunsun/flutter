// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My counter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blue[100],
            padding: const EdgeInsets.all(20),
            child: Text(
              'MyHomePage',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CounterA(counter: counter, increment: increment),
          SizedBox(height: 20),
          Middle(counter: counter)
        ],
      )),
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;

  const CounterA({
    Key? key,
    required this.counter,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(
          '$counter',
          style: TextStyle(fontSize: 48),
        ),
        ElevatedButton(
            onPressed: increment,
            child: Text(
              "Increment",
              style: TextStyle(fontSize: 20),
            ))
      ]),
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;

  const Middle({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CounterB(counter: counter),
            SizedBox(width: 20),
            Sibling()
          ]),
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;
  const CounterB({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10),
      child: Text(
        '$counter',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10),
      child: Text(
        'Sibling',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
