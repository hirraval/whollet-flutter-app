import 'package:data/src/model/model_helpers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'id_model.dart';
import 'nest_service_credentials_model.dart';

part 'user_model.g.dart';

typedef UserIdentity = ({
  String text,
  bool verified,
});

@JsonSerializable()
class User extends NetworkResourceId {
  final String fullName;
  final UserIdentity email;
  final UserIdentity mobile;
  final int countryCode;
  final String profilePic;
  final NestServiceCredentials? nestService;

  const User({
    required super.id,
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.countryCode,
    this.profilePic = "",
    required this.nestService,
  });

  @override
  List<Object?> get props => [id, fullName, email, mobile, countryCode, profilePic, nestService];

  factory User.fromJson(JsonMap json) => _$UserFromJson(json);

  @override
  JsonMap toJson() => _$UserToJson(this);

  User copyWith({
    String? fullName,
    UserIdentity? email,
    UserIdentity? mobile,
    int? countryCode,
    String? profilePic,
    NestServiceCredentials? nestService,
  }) {
    return User(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      countryCode: countryCode ?? this.countryCode,
      profilePic: profilePic ?? this.profilePic,
      nestService: nestService ?? this.nestService,
    );
  }
}
