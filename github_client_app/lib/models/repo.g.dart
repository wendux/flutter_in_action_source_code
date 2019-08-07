// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..full_name = json['full_name'] as String
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..parent = json['parent'] == null
        ? null
        : Repo.fromJson(json['parent'] as Map<String, dynamic>)
    ..private = json['private'] as bool
    ..html_url = json['html_url'] as String
    ..description = json['description'] as String
    ..fork = json['fork'] as bool
    ..homepage = json['homepage'] as String
    ..language = json['language'] as String
    ..forks_count = json['forks_count'] as num
    ..stargazers_count = json['stargazers_count'] as num
    ..watchers_count = json['watchers_count'] as num
    ..size = json['size'] as num
    ..default_branch = json['default_branch'] as String
    ..open_issues_count = json['open_issues_count'] as num
    ..topics = json['topics'] as List
    ..has_issues = json['has_issues'] as bool
    ..has_projects = json['has_projects'] as bool
    ..has_wiki = json['has_wiki'] as bool
    ..has_pages = json['has_pages'] as bool
    ..has_downloads = json['has_downloads'] as bool
    ..pushed_at = json['pushed_at'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..permissions = json['permissions'] as Map<String, dynamic>
    ..subscribers_count = json['subscribers_count'] as num
    ..license = json['license'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.full_name,
      'owner': instance.owner,
      'parent': instance.parent,
      'private': instance.private,
      'html_url': instance.html_url,
      'description': instance.description,
      'fork': instance.fork,
      'homepage': instance.homepage,
      'language': instance.language,
      'forks_count': instance.forks_count,
      'stargazers_count': instance.stargazers_count,
      'watchers_count': instance.watchers_count,
      'size': instance.size,
      'default_branch': instance.default_branch,
      'open_issues_count': instance.open_issues_count,
      'topics': instance.topics,
      'has_issues': instance.has_issues,
      'has_projects': instance.has_projects,
      'has_wiki': instance.has_wiki,
      'has_pages': instance.has_pages,
      'has_downloads': instance.has_downloads,
      'pushed_at': instance.pushed_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'permissions': instance.permissions,
      'subscribers_count': instance.subscribers_count,
      'license': instance.license
    };
