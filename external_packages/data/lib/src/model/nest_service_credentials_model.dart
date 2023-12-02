import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model_helpers.dart';

part 'nest_service_credentials_model.g.dart';

@JsonSerializable()
class NestServiceCredentials extends Equatable {
  final String accessToken;
  final String refreshToken;
  @JsonKey(fromJson: parseUtcDateTimeFromMilliseconds, toJson: toUtcDateTimeMilliseconds)
  final DateTime expiryDate;

  const NestServiceCredentials({
    required this.accessToken,
    required this.refreshToken,
    required this.expiryDate,
  });

  bool get hasExpired => DateTime.now().toUtc().isAfter(expiryDate);

  bool get shouldRefresh => DateTime.now().add(const Duration(minutes: 1)).toUtc().isAfter(expiryDate);

  @override
  List<Object?> get props => [accessToken, refreshToken, expiryDate];

  factory NestServiceCredentials.fromJson(JsonMap json) => _$NestServiceCredentialsFromJson(json);

  JsonMap toJson() => _$NestServiceCredentialsToJson(this);

  NestServiceCredentials copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? expiryDate,
  }) {
    return NestServiceCredentials(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}
