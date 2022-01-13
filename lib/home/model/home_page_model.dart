import 'package:github_repos_app/model/app_state.dart';
import 'package:github_repos_app/model/repo_model.dart';

///
/// home_page_model.dart
/// ...
///

class HomePageModel {
  late final String searchedText;
  late final List<RepoModel> repos;
  late final bool loading;
  late final int page;
  late final int pageCount;

  HomePageModel.fromState(AppState? state) {
    if (state != null) {
      searchedText = state.searchedText;
      repos = state.repos;
      loading = state.loading;
      page = state.page;
      pageCount = state.pageCount;
    } else {
      searchedText = "";
      repos = [];
      loading = false;
      page = 0;
      pageCount = 1;
    }
  }
}
