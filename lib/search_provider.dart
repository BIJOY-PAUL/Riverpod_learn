import 'package:flutter/material.dart';
import 'package:riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<searchNotifier, SearchState>((
  ref,
) {
  return searchNotifier();
});

class searchNotifier extends StateNotifier<SearchState> {
  searchNotifier() : super(SearchState(search: '', isChange: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onChange(bool isChange) {
    state = state.copyWith(isChange: isChange);
  }
}

class SearchState {
  final String search;

  final bool isChange;

  SearchState({required this.search, required this.isChange});

  SearchState copyWith({String? search, bool? isChange}) {
    return SearchState(
      search: search ?? this.search,
      isChange: isChange ?? this.isChange,
    );
  }
}
