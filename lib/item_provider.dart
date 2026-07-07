import 'dart:core';

import 'package:flutter/material.dart';
import 'package:river_pod/item.dart';
import 'package:riverpod/legacy.dart';

final itemProvider = StateNotifierProvider<itemNotifier, List<Item>>((ref) {
  return itemNotifier();
});

class itemNotifier extends StateNotifier<List<Item>> {
  itemNotifier() : super([]);

  void addItem(String name) {
    final item = Item(
      name: name,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    state.add(item);
    state = state.toList();
  }

  void upDate(String id, String name) {
    final foundIndex = state.indexWhere((item) => item.id == id);

    state[foundIndex].name = name;

    state = state.toList();
  }

  void deletItem(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }
}
