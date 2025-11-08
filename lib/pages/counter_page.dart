import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _inc() => setState(() => _counter++);
  void _dec() => setState(() => _counter--);
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Demo")),
      body: Center(
        child: Text(
          "$_counter",
          style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(onPressed: _dec, child: const Icon(Icons.remove)),
          const SizedBox(width: 12),
          FloatingActionButton(onPressed: _inc, child: const Icon(Icons.add)),
          const SizedBox(width: 12),
          FloatingActionButton.small(onPressed: _reset, child: const Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
