import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

  late num id;
  late String name;
  late String full_name;
  late User owner;
  //Repo? parent;
  late bool private;
  late String html_url;
  String? description;
  late bool fork;
  String? homepage;
  String? language;
  late num forks_count;
  late num stargazers_count;
  late num watchers_count;
  late num size;
  late String default_branch;
  late num open_issues_count;
  late List topics;
  late bool has_issues;
  late bool has_projects;
  late bool has_wiki;
  late bool has_pages;
  late bool has_downloads;
  late String pushed_at;
  late String created_at;
  late String updated_at;
  Map<String,dynamic>? permissions;
  num? subscribers_count;
  Map<String,dynamic>? license;
  
  factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
