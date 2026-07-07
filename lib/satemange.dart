import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/search_provider.dart';

class Statemangeclass extends ConsumerStatefulWidget {
  const Statemangeclass({super.key});

  @override
  ConsumerState<Statemangeclass> createState() => _StatemangeclassState();
}

class _StatemangeclassState extends ConsumerState<Statemangeclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              print("textfiled");

              return TextField(
                onChanged: (value) {
                  ref.read(searchProvider.notifier).search(value);
                },
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchProvider);
              return Text(search.search);
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final isChange = ref.watch(
                (searchProvider).select((state) {
                  return state.isChange;
                }),
              );
              return Switch(
                value: isChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
