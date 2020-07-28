import 'package:json_annotation/json_annotation.dart';

part 'access.g.dart';

@JsonSerializable()
class Access {
    Access();

    String access_token;
    String token_type;
    num expires_in;
    String refresh_token;
    String scope;
    num created_at;
    
    factory Access.fromJson(Map<String,dynamic> json) => _$AccessFromJson(json);
    Map<String, dynamic> toJson() => _$AccessToJson(this);
}
