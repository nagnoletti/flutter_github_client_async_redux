///
/// repo_model.dart
/// ...
///

class RepoModel {
  final int id;
  final String name;
  final String url;
  final double score;
  final String openIssuesUrl;

  RepoModel({
    required this.id,
    required this.name,
    required this.url,
    required this.score,
    required this.openIssuesUrl,
  });
}
