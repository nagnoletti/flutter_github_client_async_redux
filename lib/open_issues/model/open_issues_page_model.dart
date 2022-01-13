import 'package:github_repos_app/model/app_state.dart';
import 'package:github_repos_app/model/issue_model.dart';

///
/// open_issues_page_model.dart
/// ...
///

class OpenIssuesPageModel {
  late final List<IssueModel> issues;
  late final bool loading;

  OpenIssuesPageModel.fromState(AppState? state) {
    if (state != null) {
      issues = state.openIssues;
      loading = state.loading;
    } else {
      issues = [];
      loading = false;
    }
  }
}
