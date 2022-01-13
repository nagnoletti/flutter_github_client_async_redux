import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:github_repos_app/home/actions/loading_action.dart';
import 'package:github_repos_app/model/app_state.dart';
import 'package:github_repos_app/service/remote/github_remote_service.dart';

import 'loading_action.dart';

///
/// search_for_repos_action.dart
/// ...
///

class SearchForReposAction extends ReduxAction<AppState> {
  final String text;
  final int page;

  SearchForReposAction({required this.text, required this.page});

  // todo fault tolerance
  @override
  Future<AppState?> reduce() => Future.microtask(() {
        dispatch(LoadingAction(true));
        return GithubRemoteService.instance
            .searchReposForText(text, page)
            .then((searchReposModel) {
          dispatch(LoadingAction(false));
          return state.copy(
            searchedText: searchReposModel.searchedText,
            // Restart from first page
            // page: searchReposModel.page,
            page: 1,
            pageCount: searchReposModel.pageCount,
            repos: searchReposModel.repos,
          );
        });
      });
}
