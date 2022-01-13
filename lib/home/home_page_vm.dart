import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:github_repos_app/utils/debouncer.dart';

import 'model/home_page_model.dart';

///
/// home_page_vm.dart
/// ...
///

class HomePageVm extends Vm {
  static const int _searchDebounceMillis = 1000;
  static const double _textMinLength = 4;

  final Debouncer _searchDebouncer = Debouncer(millis: _searchDebounceMillis);

  final HomePageModel model;

  final void Function(String text) _searchForReposCallback;
  final void Function(String url) openRepoDetailCallback;
  final void Function(String text, int page) changePageCallback;

  final TextEditingController searchTextController =
      TextEditingController(text: "");

  HomePageVm({
    required this.model,
    required this.openRepoDetailCallback,
    required Function(String text) searchForReposCallback,
    required this.changePageCallback,
  }) : _searchForReposCallback = searchForReposCallback;

  void searchForReposCallback(String text) {
    if (text.length < _textMinLength) {
      _searchDebouncer.cancel();
      return;
    } else {
      _searchDebouncer.debounce(() {
        _searchForReposCallback(text);
      });
    }
  }

  @override
  List<Object?> get equals => [
        model.page,
        model.pageCount,
        model.loading,
        model.repos,
      ];
}
