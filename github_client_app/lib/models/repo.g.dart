// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo()
    ..id = json['id'] as num
    ..full_name = json['full_name'] as String
    ..human_name = json['human_name'] as String
    ..url = json['url'] as String
    ..namespace = json['namespace'] as Map<String, dynamic>
    ..path = json['path'] as String
    ..name = json['name'] as String
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..description = json['description'] as String
    ..private = json['private'] as bool
    ..public = json['public'] as bool
    ..internal = json['internal'] as bool
    ..fork = json['fork'] as bool
    ..html_url = json['html_url'] as String
    ..ssh_url = json['ssh_url'] as String
    ..forks_url = json['forks_url'] as String
    ..keys_url = json['keys_url'] as String
    ..collaborators_url = json['collaborators_url'] as String
    ..hooks_url = json['hooks_url'] as String
    ..branches_url = json['branches_url'] as String
    ..tags_url = json['tags_url'] as String
    ..blobs_url = json['blobs_url'] as String
    ..stargazers_url = json['stargazers_url'] as String
    ..contributors_url = json['contributors_url'] as String
    ..commits_url = json['commits_url'] as String
    ..comments_url = json['comments_url'] as String
    ..issue_comment_url = json['issue_comment_url'] as String
    ..issues_url = json['issues_url'] as String
    ..pulls_url = json['pulls_url'] as String
    ..milestones_url = json['milestones_url'] as String
    ..notifications_url = json['notifications_url'] as String
    ..labels_url = json['labels_url'] as String
    ..releases_url = json['releases_url'] as String
    ..recommend = json['recommend'] as bool
    ..homepage = json['homepage'] as String
    ..language = json['language'] as String
    ..forks_count = json['forks_count'] as num
    ..stargazers_count = json['stargazers_count'] as num
    ..watchers_count = json['watchers_count'] as num
    ..default_branch = json['default_branch'] as String
    ..open_issues_count = json['open_issues_count'] as num
    ..has_issues = json['has_issues'] as bool
    ..has_wiki = json['has_wiki'] as bool
    ..issue_comment = json['issue_comment'] as bool
    ..can_comment = json['can_comment'] as bool
    ..pull_requests_enabled = json['pull_requests_enabled'] as bool
    ..has_page = json['has_page'] as bool
    ..license = json['license'] as String
    ..outsourced = json['outsourced'] as bool
    ..project_creator = json['project_creator'] as String
    ..members = json['members'] as List
    ..pushed_at = json['pushed_at'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..parent = json['parent'] as String
    ..paas = json['paas'] as String
    ..stared = json['stared'] as bool
    ..watched = json['watched'] as bool
    ..permission = json['permission'] as Map<String, dynamic>
    ..relation = json['relation'] as String;
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'human_name': instance.human_name,
      'url': instance.url,
      'namespace': instance.namespace,
      'path': instance.path,
      'name': instance.name,
      'owner': instance.owner,
      'description': instance.description,
      'private': instance.private,
      'public': instance.public,
      'internal': instance.internal,
      'fork': instance.fork,
      'html_url': instance.html_url,
      'ssh_url': instance.ssh_url,
      'forks_url': instance.forks_url,
      'keys_url': instance.keys_url,
      'collaborators_url': instance.collaborators_url,
      'hooks_url': instance.hooks_url,
      'branches_url': instance.branches_url,
      'tags_url': instance.tags_url,
      'blobs_url': instance.blobs_url,
      'stargazers_url': instance.stargazers_url,
      'contributors_url': instance.contributors_url,
      'commits_url': instance.commits_url,
      'comments_url': instance.comments_url,
      'issue_comment_url': instance.issue_comment_url,
      'issues_url': instance.issues_url,
      'pulls_url': instance.pulls_url,
      'milestones_url': instance.milestones_url,
      'notifications_url': instance.notifications_url,
      'labels_url': instance.labels_url,
      'releases_url': instance.releases_url,
      'recommend': instance.recommend,
      'homepage': instance.homepage,
      'language': instance.language,
      'forks_count': instance.forks_count,
      'stargazers_count': instance.stargazers_count,
      'watchers_count': instance.watchers_count,
      'default_branch': instance.default_branch,
      'open_issues_count': instance.open_issues_count,
      'has_issues': instance.has_issues,
      'has_wiki': instance.has_wiki,
      'issue_comment': instance.issue_comment,
      'can_comment': instance.can_comment,
      'pull_requests_enabled': instance.pull_requests_enabled,
      'has_page': instance.has_page,
      'license': instance.license,
      'outsourced': instance.outsourced,
      'project_creator': instance.project_creator,
      'members': instance.members,
      'pushed_at': instance.pushed_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'parent': instance.parent,
      'paas': instance.paas,
      'stared': instance.stared,
      'watched': instance.watched,
      'permission': instance.permission,
      'relation': instance.relation
    };
