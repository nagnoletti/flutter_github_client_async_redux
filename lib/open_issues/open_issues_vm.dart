import 'package:async_redux/async_redux.dart';
import 'package:github_repos_app/open_issues/model/open_issues_page_model.dart';

///
/// open_issues_vm.dart
/// ...
///

class OpenIssuesVm extends Vm {
  final OpenIssuesPageModel model;
  final void Function() closeCallback;

  OpenIssuesVm({
    required this.model,
    required this.closeCallback,
  });

  // https://github.com/marcglasberg/async_redux#store-and-state
  // >>> Only if the view-model changed, the connector rebuilds
  @override
  List<Object?> get equals => [
        model.issues,
        model.loading,
      ];
}
