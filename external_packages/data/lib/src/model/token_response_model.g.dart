// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NestServiceAccessTokenResponse _$NestServiceAccessTokenResponseFromJson(
        Map<String, dynamic> json) =>
    NestServiceAccessTokenResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiryDate: parseUtcDateTimeFromMilliseconds(json['expiryDate'] as int),
    );

Map<String, dynamic> _$NestServiceAccessTokenResponseToJson(
        NestServiceAccessTokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiryDate': toUtcDateTimeMilliseconds(instance.expiryDate),
    };

NestServiceRefreshTokenResponse _$NestServiceRefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    NestServiceRefreshTokenResponse(
      accessToken: json['accessToken'] as String,
      expiryDate: parseUtcDateTimeFromMilliseconds(json['expiryDate'] as int),
    );

Map<String, dynamic> _$NestServiceRefreshTokenResponseToJson(
        NestServiceRefreshTokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiryDate': toUtcDateTimeMilliseconds(instance.expiryDate),
    };
