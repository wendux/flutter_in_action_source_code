import 'package:json_annotation/json_annotation.dart';

part 'giteeClient.g.dart';

@JsonSerializable()
class GiteeClient {
    GiteeClient();

    String client_id;
    String client_secret;
    
    factory GiteeClient.fromJson(Map<String,dynamic> json) => _$GiteeClientFromJson(json);
    Map<String, dynamic> toJson() => _$GiteeClientToJson(this);
}
