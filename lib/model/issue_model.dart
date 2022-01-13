///
/// issue_model.dart
/// ...
///

class IssueModel {
  final int id;
  final String title;
  final String state;
  final bool locked;
  final int comments;
  final String body;

  IssueModel({
    required this.id,
    required this.title,
    required this.state,
    required this.locked,
    required this.comments,
    required this.body,
  });
}
