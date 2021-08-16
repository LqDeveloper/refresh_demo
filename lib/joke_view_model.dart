import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:refresh_demo/dio_manager.dart';
import 'package:refresh_demo/joke_model.dart';

class JokeViewModel with ChangeNotifier {
  RefreshController _controller = RefreshController(initialRefresh: false);

  RefreshController get controller => _controller;

  List<Result> _list = [];

  List<Result> get list => _list;

  bool _disposed = false;

  int _page = 1;

  Future<void> loadData() async {
    _page += 1;
    var response = await DioManager.instance.getJoke(_page, 10);
    _list = response.result ?? [];
    _controller.loadComplete();
    notifyListeners();
  }

  Future<void> refreshData() async {
    _page = 1;
    var response = await DioManager.instance.getJoke(_page, 10);
    _list = response.result ?? [];
    _controller.refreshCompleted(resetFooterState: true);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_disposed) {
      return;
    }
    super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.dispose();
    super.dispose();
  }
}
