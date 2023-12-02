import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cms_content_model.g.dart';

@JsonSerializable()
class CmsContent extends Equatable {
  const CmsContent({
    required this.title,
    required this.content,
    required this.updatedAt,
  });

  final String title;
  final String content;
  @JsonKey(fromJson: parseUtcDateTimeToLocal, toJson: toUtcDateTime)
  final DateTime updatedAt;

  @override
  List<Object?> get props => [title, content, updatedAt];

  factory CmsContent.fromJson(Map<String, dynamic> json) => _$CmsContentFromJson(json);

  Map<String, dynamic> toJson() => _$CmsContentToJson(this);
}
