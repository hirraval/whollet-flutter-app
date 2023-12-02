// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: _$recordConvert(
        json['email'],
        ($jsonValue) => (
          text: $jsonValue['text'] as String,
          verified: $jsonValue['verified'] as bool,
        ),
      ),
      mobile: _$recordConvert(
        json['mobile'],
        ($jsonValue) => (
          text: $jsonValue['text'] as String,
          verified: $jsonValue['verified'] as bool,
        ),
      ),
      countryCode: json['countryCode'] as int,
      profilePic: json['profilePic'] as String? ?? "",
      nestService: json['nestService'] == null
          ? null
          : NestServiceCredentials.fromJson(
              json['nestService'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'fullName': instance.fullName,
    'email': {
      'text': instance.email.text,
      'verified': instance.email.verified,
    },
    'mobile': {
      'text': instance.mobile.text,
      'verified': instance.mobile.verified,
    },
    'countryCode': instance.countryCode,
    'profilePic': instance.profilePic,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nestService', instance.nestService?.toJson());
  return val;
}

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
