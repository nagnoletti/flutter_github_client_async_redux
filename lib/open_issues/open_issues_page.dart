import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_repos_app/model/issue_model.dart';
import 'package:github_repos_app/open_issues/model/open_issues_page_model.dart';

///
/// open_issues_page.dart
/// ...
///

class OpenIssuesPage extends StatelessWidget {
  final OpenIssuesPageModel model;
  final String url;
  final void Function() closeCallback;

  const OpenIssuesPage({
    Key? key,
    required this.model,
    required this.url,
    required this.closeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.issues.length,
            itemBuilder: (context, index) => _Issue(model: model.issues[index]),
          ),
        ),
      ],
    );
  }
}

class _Issue extends StatelessWidget {
  final IssueModel model;

  const _Issue({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 8,
                ),
                child: Text(
                  model.title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox.square(
                dimension: 24,
                child: Icon(
                  model.locked ? Icons.lock : Icons.lock_open,
                  color: Colors.grey,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 8,
                left: 0,
                right: 0,
                bottom: 8,
              ),
              child: SizedBox.square(
                dimension: 24,
                child: Icon(
                  Icons.message,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 4,
                right: 24,
                bottom: 8,
              ),
              child: Text(
                model.comments.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          indent: 16,
          color: Colors.grey,
        ),
      ],
    );
  }
}
