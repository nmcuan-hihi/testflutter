import 'package:json_annotation/json_annotation.dart';
part 'post_response.g.dart';

@JsonSerializable()
class CategoryPostResonse {
  final List<PostResponse> result;
  CategoryPostResonse(this.result);
  factory CategoryPostResonse.fromJson(Map<String, dynamic> json) =>
      _$CategoryPostResonseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryPostResonseToJson(this);
}

@JsonSerializable()
class PostResponse {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;
  PostResponse({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
