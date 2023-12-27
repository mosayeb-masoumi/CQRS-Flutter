import 'package:flutter/material.dart';
import 'command.dart';
import 'handler.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {

  @override
  Widget build(BuildContext context) {
    final CounterCommandHandler commandHandler = CounterCommandHandler();
    return ICounterExample(commandHandler: commandHandler);

  }
}

class ICounterExample extends StatefulWidget {

  final CounterCommandHandler commandHandler;

  const ICounterExample({super.key, required this.commandHandler});

  @override
  State<ICounterExample> createState() => _ICounterExampleState();
}

class _ICounterExampleState extends State<ICounterExample> {
  late CounterCommandHandler _commandHandler;

  @override
  void initState() {
    super.initState();
    _commandHandler = widget.commandHandler;
  }


  void _incrementCounter() {
    setState(() {
      _commandHandler.executeCommand(IncrementCommand());
    });
  }

  void _decrementCounter() {
    setState(() {
      _commandHandler.executeCommand(DecrementCommand());
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("CQRS Counter"),
      ),
      body: Center(
        child: Column(
          children: [

           const Text('Counter Value:'),

            Text('${_commandHandler.counter.value}',),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              tooltip: "Increment",
              onPressed: _incrementCounter,
              child: const Icon(Icons.add)),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
              tooltip: "Decrement",
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove))
        ],
      ),
    );
  }
}
