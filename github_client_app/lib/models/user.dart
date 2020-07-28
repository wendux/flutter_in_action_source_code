import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    num id;
    String login;
    String name;
    String avatar_url;
    String url;
    String html_url;
    String followers_url;
    String following_url;
    String gists_url;
    String starred_url;
    String subscriptions_url;
    String organizations_url;
    String repos_url;
    String events_url;
    String received_events_url;
    String type;
    String blog;
    String weibo;
    String bio;
    num public_repos;
    num public_gists;
    num followers;
    num following;
    num stared;
    num watched;
    String created_at;
    String updated_at;
    String email;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
