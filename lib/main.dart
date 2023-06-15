import 'package:flutter/material.dart';
import 'package:practice/intprovider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: home()));
}

class home extends ConsumerWidget {
  const home({super.key});

  void change(String value, WidgetRef ref) {
    ref.read(intprovider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(intprovider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Column(children: [
          Center(
            child: TextField(
              onSubmitted: (value) => change(value, ref),
            ),
          )
        ]),
      ),
    );
  }
}
