// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_10/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog08', breed: 'breed08', age: 3),
      child: MaterialApp(
        title: 'Provider 08',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 08'),
      ),
      body: Selector<Dog, String>(
        selector: (BuildContext context, Dog dog) => dog.name,
        builder: (BuildContext context, String name, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                SizedBox(
                  height: 10,
                ),
                Text(
                  '- name: $name',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                BreedAndAge(),
              ],
            ),
          );
        },
        child: Text(
          'I like dogs very much',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
        selector: (BuildContext context, Dog dog) => dog.breed,
        builder: (_, String breed, __) {
          return Column(
            children: [
              Text(
                '- breed: $breed',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Age(),
            ],
          );
        });
  }
}

class Age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
        selector: (BuildContext context, Dog dog) => dog.age,
        builder: (BuildContext context, int age, Widget? child) {
          return Column(
            children: [
              Text(
                '- age : $age',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.read<Dog>().grow(),
                  child: Text(
                    'Grow',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          );
        });
  }
}
