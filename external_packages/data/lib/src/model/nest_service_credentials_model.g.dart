// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nest_service_credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NestServiceCredentials _$NestServiceCredentialsFromJson(
        Map<String, dynamic> json) =>
    NestServiceCredentials(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiryDate: parseUtcDateTimeFromMilliseconds(json['expiryDate'] as int),
    );

Map<String, dynamic> _$NestServiceCredentialsToJson(
        NestServiceCredentials instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiryDate': toUtcDateTimeMilliseconds(instance.expiryDate),
    };
