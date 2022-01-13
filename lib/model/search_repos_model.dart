import 'package:github_repos_app/model/repo_model.dart';

///
/// search_repos_model.dart
/// ...
///

class SearchReposModel {
  final String searchedText;
  final int page;
  final int pageCount;
  final List<RepoModel> repos;

  SearchReposModel({
    required this.searchedText,
    required this.page,
    required this.pageCount,
    required this.repos,
  });
}
