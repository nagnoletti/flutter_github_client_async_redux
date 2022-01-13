import 'package:github_repos_app/model/issue_model.dart';
import 'package:github_repos_app/model/repo_model.dart';

///
/// app_state.dart
/// ...
///

class AppState {
  final String searchedText;

  final int page;

  final int pageCount;

  final List<RepoModel> repos;

  final bool loading;

  final List<IssueModel> openIssues;

  AppState._({
    required this.searchedText,
    required this.page,
    required this.pageCount,
    required this.repos,
    required this.loading,
    required this.openIssues,
  });

  factory AppState.initial() => AppState._(
        searchedText: "",
        page: 1,
        pageCount: 1,
        repos: [],
        loading: false,
        openIssues: List.empty(),
      );

  AppState copy({
    String? searchedText,
    int? page,
    int? pageCount,
    List<RepoModel>? repos,
    bool? loading,
    List<IssueModel>? openIssues,
  }) =>
      AppState._(
        searchedText: searchedText ?? this.searchedText,
        page: page ?? this.page,
        pageCount: pageCount ?? this.pageCount,
        repos: repos ?? this.repos,
        loading: loading ?? this.loading,
        openIssues: openIssues ?? this.openIssues,
      );
}
