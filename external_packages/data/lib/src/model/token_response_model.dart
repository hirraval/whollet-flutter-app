import 'package:data/src/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class NestServiceAccessTokenResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  @JsonKey(fromJson: parseUtcDateTimeFromMilliseconds, toJson: toUtcDateTimeMilliseconds)
  final DateTime expiryDate;

  const NestServiceAccessTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiryDate,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken, expiryDate];

  factory NestServiceAccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$NestServiceAccessTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NestServiceAccessTokenResponseToJson(this);
}

@JsonSerializable()
class NestServiceRefreshTokenResponse extends Equatable {
  final String accessToken;
  @JsonKey(fromJson: parseUtcDateTimeFromMilliseconds, toJson: toUtcDateTimeMilliseconds)
  final DateTime expiryDate;

  const NestServiceRefreshTokenResponse({
    required this.accessToken,
    required this.expiryDate,
  });

  @override
  List<Object?> get props => [accessToken, expiryDate];

  factory NestServiceRefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$NestServiceRefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NestServiceRefreshTokenResponseToJson(this);
}
