// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..login = json['login']
  ..id = json['id']
  ..avatar_url = json['avatar_url']
  ..url = json['url']
  ..type = json['type']
  ..site_admin = json['site_admin']
  ..name = json['name']
  ..company = json['company']
  ..blog = json['blog']
  ..location = json['location']
  ..email = json['email']
  ..hireable = json['hireable']
  ..bio = json['bio']
  ..public_repos = json['public_repos']
  ..public_gists = json['public_gists']
  ..followers = json['followers']
  ..following = json['following']
  ..created_at = json['created_at']
  ..updated_at = json['updated_at']
  ..total_private_repos = json['total_private_repos']
  ..owned_private_repos = json['owned_private_repos'];

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
      'owned_private_repos': instance.owned_private_repos,
    };
