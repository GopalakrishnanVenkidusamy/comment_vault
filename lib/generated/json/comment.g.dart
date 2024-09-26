import 'package:comment_vault/generated/json/base/json_convert_content.dart';
import 'package:comment_vault/model/comment.dart';

Comment $CommentFromJson(Map<String, dynamic> json) {
	final Comment comment = Comment();
	final int? postId = jsonConvert.convert<int>(json['postId']);
	if (postId != null) {
		comment.postId = postId;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		comment.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		comment.name = name;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		comment.email = email;
	}
	final String? body = jsonConvert.convert<String>(json['body']);
	if (body != null) {
		comment.body = body;
	}
	return comment;
}

Map<String, dynamic> $CommentToJson(Comment entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['postId'] = entity.postId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['email'] = entity.email;
	data['body'] = entity.body;
	return data;
}