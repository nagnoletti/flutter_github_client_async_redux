import 'github_repo_remote_model.dart';

///
/// github_repo_search_remote_model.dart
/// ...
///

class GithubRepoSearchRemoteModel {
  late final int totalCount;
  late final bool incompleteResults;
  late final Iterable<GithubRepoRemoteModel> items;

  GithubRepoSearchRemoteModel.fromJson(Map<String, dynamic> json) {
    totalCount = json["total_count"];
    incompleteResults = json["incomplete_results"];
    items = (json["items"] as List<dynamic>)
        .map((e) => GithubRepoRemoteModel.fromJson(e as Map<String, dynamic>));
  }
}
