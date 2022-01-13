import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'model/home_page_model.dart';

///
/// home_page.dart
/// ...
///

class HomePage extends StatelessWidget {
  final HomePageModel model;

  final void Function(String text) searchForReposCallback;
  final void Function(String url) openRepoDetailCallback;
  final void Function(String text, int page) changePageCallback;

  const HomePage({
    Key? key,
    required this.model,
    required this.searchForReposCallback,
    required this.openRepoDetailCallback,
    required this.changePageCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  onChanged: (text) {
                    searchForReposCallback(text);
                  },
                  decoration:
                      const InputDecoration(labelText: "Search for repos..."),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              model.repos.isEmpty
                  ? const Center(
                      child: Text("No repos found"),
                    )
                  : EasyRefresh(
                      header: CustomHeader(
                        completeDuration: const Duration(milliseconds: 500),
                        headerBuilder: _headerBuilder,
                      ),
                      taskIndependence: true,
                      onRefresh: () async {
                        changePageCallback(model.searchedText, model.page);
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.repos.length,
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(model.repos[index].name),
                              TextButton(
                                onPressed: () {
                                  openRepoDetailCallback(
                                    model.repos[index].openIssuesUrl.replaceAll("{/number}", ""),
                                  );
                                },
                                child: const Text("Open"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              model.loading
                  ? Container(
                      color: Colors.white54,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        _NumberPagination(
          pageCount: model.pageCount,
          page: model.page,
          onSelection: (page) {
            changePageCallback(model.searchedText, page);
          },
        ),
      ],
    );
  }

  Widget _headerBuilder(
    BuildContext context,
    RefreshMode refreshState,
    double pulledExtent,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
    AxisDirection axisDirection,
    bool float,
    Duration? completeDuration,
    bool enableInfiniteRefresh,
    bool success,
    bool noMore,
  ) {
    final Widget child;
    switch (refreshState) {
      case RefreshMode.drag:
      case RefreshMode.armed:
        child = const Center(
          child: Icon(Icons.arrow_downward_outlined),
        );
        break;
      case RefreshMode.refresh:
      case RefreshMode.refreshed:
        child = const Center(child: Icon(Icons.done_outlined));
        break;
      default:
        child = const SizedBox.shrink();
    }

    const duration = Duration(milliseconds: 200);
    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) =>
          ScaleTransition(child: child, scale: animation),
      reverseDuration: duration,
      duration: duration,
      child: child,
    );
  }
}

class _NumberPagination extends StatelessWidget {
  final int pageCount;
  final int page;
  final void Function(int page) onSelection;

  const _NumberPagination({
    required this.pageCount,
    required this.page,
    required this.onSelection,
    Key? key,
  })  : assert(pageCount >= page),
        assert(page > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [];

    if (page - 1 >= 1) {
      list.add(
        _button(
          textColor: Colors.black26,
          text: "1",
          toPage: 1,
        ),
      );
    }

    if (page - 2 >= 1) {
      list.add(
        _button(
          textColor: Colors.black26,
          text: "${page - 1}",
          toPage: page - 1,
        ),
      );
    }

    list.add(
      _button(
        textColor: Colors.black,
        text: "$page",
        toPage: page,
      ),
    );

    if (page + 2 <= pageCount) {
      list.add(
        _button(
          textColor: Colors.black26,
          text: "${page + 1}",
          toPage: page + 1,
        ),
      );
    }

    if (page + 1 <= pageCount) {
      list.add(
        _button(
          textColor: Colors.black26,
          text: "$pageCount",
          toPage: pageCount,
        ),
      );
    }

    return Container(
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: list,
      ),
    );
  }

  Widget _button({
    required Color textColor,
    required String text,
    required int toPage,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: () => onSelection(toPage),
        ),
      );
}
