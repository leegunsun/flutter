import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider_overview_16/providers/counter.dart';
import "package:provider/provider.dart";

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigate')),
      body: Center(
          child: Text(
        '${context.watch<Counter>().counter}',
        style: TextStyle(fontSize: 40),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().Increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Other Page')),
      body: Center(
          child: Text(
        'Other',
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
