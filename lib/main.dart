import 'package:flutter/material.dart';
import 'package:practice/intprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/user.dart';

void main() {
  runApp(const ProviderScope(child: home()));
}

class home extends ConsumerWidget {
  const home({super.key});

  void change(String value, WidgetRef ref) {
    ref.read(intprovider.notifier).update((state) => value);
  }

  void changeusername(String value, WidgetRef ref) {
    ref.read(userprovider.notifier).updatename(value);
  }

  void changeuserage(String value, WidgetRef ref) {
    ref.read(userprovider.notifier).updateage(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateread = ref.watch(intprovider);
    final normal = ref.watch(normalprovider);
    final userreading = ref.watch(userprovider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${stateread}:  state provider'),
        ),
        body: Column(children: [
          Center(
            child: TextField(
              decoration: InputDecoration(label: Text("change appbar")),
              onSubmitted: (value) => change(value, ref),
            ),
          ),
          TextField(
            decoration: InputDecoration(label: Text("change user name")),
            onSubmitted: (value) => changeusername(value, ref),
          ),
          TextField(
            decoration: InputDecoration(label: Text("change user age")),
            onSubmitted: (value) => changeuserage(value, ref),
            keyboardType: TextInputType.number,
          ),
          Text.rich(TextSpan(
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold), //apply style to all
              children: [
                TextSpan(
                  text: '${userreading.name}',
                ),
                TextSpan(
                    text: ' : name statenotifier provider',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
              ])),
          Text.rich(TextSpan(
              style: TextStyle(color: Colors.redAccent), //apply style to all
              children: [
                TextSpan(
                    text: '${userreading.age}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: ' : age statenotifier provider',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))
              ])),
          Text(
            '${normal} :  normal provider',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            "RIVERPOD CONCEPTS",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
