import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider_overview_16/providers/counter.dart';
import 'package:provider/provider.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({super.key});

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('Be careful!'),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Count is 3'),
              );
            });
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Handle Dialog')),
      body: Center(
          child: Text(
        '${context.watch<Counter>().counter}',
        style: TextStyle(fontSize: 40),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.read<Counter>().Increment(),
      ),
    );
  }
}
