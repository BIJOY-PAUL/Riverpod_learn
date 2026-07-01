import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final counterProvider = StateProvider<int>((ref) => 0);

final switchProvider = StateProvider<bool>((ref) => false);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Provider created");

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(counterProvider).toString();

              print("Consumer widget rebuilds");

              return Text(count, style: TextStyle(fontSize: 30));
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final switchValue = ref.watch(switchProvider);

              print("build3");

              return Switch(
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },
                value: switchValue,
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Text('+'),
              ),

              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                child: Text('-'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
