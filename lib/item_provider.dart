import 'dart:core';

import 'package:river_pod/item.dart';
import 'package:riverpod/legacy.dart';

final itemProvider = StateNotifierProvider<itemNotifier, List<Item>>((ref) {
  return itemNotifier();
});

class itemNotifier extends StateNotifier<List<Item>> {
  itemNotifier() : super([]);

  void addItem(String name) {
    final item = Item(name: name, id: DateTime.now().millisecondsSinceEpoch);

    state.add(item);
    state = state.toList();
  }
}
