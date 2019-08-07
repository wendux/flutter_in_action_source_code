// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..login = json['login'] as String
    ..id = json['id'] as num
    ..avatar_url = json['avatar_url'] as String
    ..url = json['url'] as String
    ..type = json['type'] as String
    ..site_admin = json['site_admin'] as bool
    ..name = json['name'] as String
    ..company = json['company'] as String
    ..blog = json['blog'] as String
    ..location = json['location'] as String
    ..email = json['email'] as String
    ..hireable = json['hireable'] as bool
    ..bio = json['bio'] as String
    ..public_repos = json['public_repos'] as num
    ..public_gists = json['public_gists'] as num
    ..followers = json['followers'] as num
    ..following = json['following'] as num
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..total_private_repos = json['total_private_repos'] as num
    ..owned_private_repos = json['owned_private_repos'] as num;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatar_url,
      'url': instance.url,
      'type': instance.type,
      'site_admin': instance.site_admin,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'bio': instance.bio,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'total_private_repos': instance.total_private_repos,
      'owned_private_repos': instance.owned_private_repos
    };
