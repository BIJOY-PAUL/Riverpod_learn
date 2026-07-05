import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/slider_provider.dart';
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
              final slider = ref.watch(
                sliderProvider.select((state) => state.showPassword),
              );
              print("eye ");

              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showPassword: !slider,
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,

                  child: slider
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.image),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              print("container");

              return Container(
                height: 200,
                width: 200,

                color: Colors.green.withValues(alpha: slider),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );

              print('slider');
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
