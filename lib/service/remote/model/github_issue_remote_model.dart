///
/// github_issue_remote_model.dart
/// ...
///

class GithubIssueRemoteModel {
  late final String? url;
  late final String? repositoryUrl;
  late final String? labelsUrl;
  late final String? commentsUrl;
  late final String? eventsUrl;
  late final String? htmlUrl;
  late final int? id;
  late final String? nodeId;
  late final int? number;
  late final String? title;
  late final dynamic user;
  late final dynamic labels;
  late final String? state;
  late final bool? locked;
  late final dynamic assignee;
  late final dynamic assignees;
  late final dynamic milestone;
  late final int? comments;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? closedAt;
  late final String? authorAssociation;
  late final dynamic activeLockReason;
  late final bool? draft;
  late final dynamic pullRequest;
  late final String? body;
  late final dynamic reactions;
  late final String? timelineUrl;
  late final bool? performedViaGithubApp;

  GithubIssueRemoteModel.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    repositoryUrl = json["repository_url"];
    labelsUrl = json["labels_url"];
    commentsUrl = json["comments_url"];
    eventsUrl = json["events_url"];
    htmlUrl = json["html_url"];
    id = json["id"];
    nodeId = json["node_id"];
    number = json["number"];
    title = json["title"];
    user = json["user"];
    labels = json["labels"];
    state = json["state"];
    locked = json["locked"];
    assignee = json["assignee"];
    assignees = json["assignees"];
    milestone = json["milestone"];
    comments = json["comments"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    closedAt = json["closed_at"];
    authorAssociation = json["author_association"];
    activeLockReason = json["active_local_reason"];
    draft = json["draft"];
    pullRequest = json["pull_request"];
    body = json["body"];
    reactions = json["reactions"];
    timelineUrl = json["timeline_url"];
    performedViaGithubApp = json["performed_via_github_app"];
  }
}
