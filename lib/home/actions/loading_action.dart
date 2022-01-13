import 'package:async_redux/async_redux.dart';
import 'package:github_repos_app/model/app_state.dart';

///
/// loading_action.dart
/// ...
///

class LoadingAction extends ReduxAction<AppState> {
  final bool loading;

  LoadingAction(this.loading);

  @override
  AppState? reduce() {
    return state.copy(loading: loading);
  }
}
