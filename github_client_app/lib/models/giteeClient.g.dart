// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giteeClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteeClient _$GiteeClientFromJson(Map<String, dynamic> json) {
  return GiteeClient()
    ..client_id = json['client_id'] as String
    ..client_secret = json['client_secret'] as String;
}

Map<String, dynamic> _$GiteeClientToJson(GiteeClient instance) =>
    <String, dynamic>{
      'client_id': instance.client_id,
      'client_secret': instance.client_secret
    };
