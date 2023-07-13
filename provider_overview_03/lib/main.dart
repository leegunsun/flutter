// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_03/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
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
  final dog = Dog(name: 'dog03', breed: 'breed03');

  @override
  void initState() {
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() {
    print('age listner: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 03'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '- name: ${dog.name}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          BreedAndAge(dog: dog),
        ],
      )),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${dog.breed}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age : ${dog.age}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () => dog.grow(),
            child: Text(
              'Grow',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
