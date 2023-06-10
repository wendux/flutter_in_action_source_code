// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile()
  ..user = User.fromJson(json['user'] as Map<String, dynamic>)
  ..token = json['token']
  ..theme = json['theme'] as num
  ..cache = CacheConfig.fromJson(json['cache'] as Map<String, dynamic>)
  ..lastLogin = json['lastLogin']
  ..locale = json['locale'];


Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'theme': instance.theme,
      'cache': instance.cache,
      'lastLogin': instance.lastLogin,
      'locale': instance.locale,
    };
