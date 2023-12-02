import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_us_model.g.dart';

@JsonSerializable()
class ContactUsInfo extends Equatable {
  const ContactUsInfo({
    required this.email,
    required this.mobile,
  });

  final String email;
  final String mobile;

  @override
  List<Object?> get props => [email, mobile];

  factory ContactUsInfo.fromJson(Map<String, dynamic> json) => _$ContactUsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsInfoToJson(this);
}
