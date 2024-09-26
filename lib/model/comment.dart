import 'package:comment_vault/generated/json/comment.g.dart';

import 'package:comment_vault/generated/json/base/json_field.dart';

@JsonSerializable()
class Comment {

	Comment();

	factory Comment.fromJson(Map<String, dynamic> json) => $CommentFromJson(json);

	Map<String, dynamic> toJson() => $CommentToJson(this);

  @JSONField(name: "postId")
  int? postId;
  @JSONField(name: "id")
  int? id;  
  @JSONField(name: "name")
  String? name;
  @JSONField(name: "email")
  String? email;
  @JSONField(name: "body")
  String? body;
}
