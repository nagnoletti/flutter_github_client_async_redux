import 'dart:async';

import 'package:dio/dio.dart';
import 'package:github_repos_app/model/issue_model.dart';
import 'package:github_repos_app/model/repo_model.dart';
import 'package:github_repos_app/model/search_repos_model.dart';
import 'package:github_repos_app/service/remote/model/github_issue_remote_model.dart';
import 'package:github_repos_app/service/remote/model/github_repo_remote_model.dart';
import 'package:github_repos_app/service/remote/model/github_repo_search_remote_model.dart';

///
/// github_remote_service.dart
/// ...
///

class GithubRemoteService {
  static final GithubRemoteService instance = GithubRemoteService._();
  static const String _baseUrl = "https://api.github.com";

  static final Dio _dio = Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
    ),
  );

  static const String _qpQuery = "#q#";
  static const String _qpPage = "#page#";
  static const int _maxPage = 100;
  static const String _qpPerPage = "#per_page#";
  static const int _qpPerPageDef = 10;
  static const String _qpSort = "#sort#";
  static const String _qpOrder = "#order#";
  static const String _searchReposPath = "/search/repositories?q=$_qpQuery"
      "&page=$_qpPage&per_page=$_qpPerPage&sort=$_qpSort&order=$_qpOrder";

  GithubRemoteService._() {
    _dio.interceptors.add(LogInterceptor());
  }

  Future<SearchReposModel> searchReposForText(String text, int page) {
    final String path = "$_baseUrl$_searchReposPath"
        .replaceFirst(_qpQuery, text)
        .replaceFirst(_qpPage, page.toString())
        .replaceFirst(_qpPerPage, _qpPerPageDef.toString())
        .replaceFirst(_qpSort, "")
        .replaceFirst(_qpOrder, "");
    return _dio.get(path).then((response) {
      if (response.statusCode == 200) {
        final mapped = GithubRepoSearchRemoteModel.fromJson(
            response.data as Map<String, dynamic>);

        // pageCount should be 1 if no repositories are found
        int pageCount = mapped.totalCount;
        if (pageCount > _maxPage) {
          pageCount = _maxPage;
        } else if (pageCount < 1) {
          pageCount = 1;
        }

        return SearchReposModel(
          searchedText: text,
          page: page,
          pageCount: pageCount,
          repos: mapped.items
              .map((e) => e.toRepoModel())
              .whereType<RepoModel>()
              .toList(),
        );
      } else {
        return SearchReposModel(
          searchedText: text,
          page: 1,
          pageCount: 1,
          repos: [],
        );
      }
    });
  }

  Future<List<IssueModel>> getIssuesByUrl(String url) {
    return _dio.get(url).then((response) {
      if (response.statusCode == 200) {
        final mapped = (response.data as List<dynamic>).map((e) =>
            GithubIssueRemoteModel.fromJson(e as Map<String, dynamic>)
                .toIssueModel());
        return mapped.whereType<IssueModel>().toList();
      } else {
        return List.empty();
      }
    });
  }
}

extension _RepoModelExt on GithubRepoRemoteModel {
  RepoModel? toRepoModel() {
    final id = this.id;
    final name = fullName;
    final url = this.url;
    final score = this.score;
    final openIssuesUrl = issuesUrl;

    if (id != null &&
        name != null &&
        url != null &&
        score != null &&
        openIssuesUrl != null) {
      return RepoModel(
        id: id,
        name: name,
        url: url,
        score: score,
        openIssuesUrl: openIssuesUrl,
      );
    } else {
      return null;
    }
  }
}

extension _IssueModelExt on GithubIssueRemoteModel {
  IssueModel? toIssueModel() {
    final id = this.id;
    final title = this.title;
    final state = this.state;
    final locked = this.locked;
    final comments = this.comments;
    final body = this.body;

    if (id != null &&
        title != null &&
        state != null &&
        locked != null &&
        comments != null &&
        body != null) {
      return IssueModel(
        id: id,
        title: title,
        state: state,
        locked: locked,
        comments: comments,
        body: body,
      );
    } else {
      return null;
    }
  }
}
