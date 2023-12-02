import 'dart:convert';

import 'package:whollet_extensions/whollet_extensions.dart';

typedef JsonMap = Map<String, dynamic>;

typedef DataParser<Input, Output> = Output Function(Input json);

List<T> parseList<T>(dynamic value, DataParser<dynamic, T> parser) {
  List<T> list = <T>[];
  if (value is! Iterable) return list;
  for (var json in value) {
    list.add(parser(json));
  }
  return list;
}

List<T> parseListFromJson<T>(dynamic value, DataParser<Map<String, dynamic>, T> parser) {
  List<T> list = <T>[];
  if (value is! Iterable) return list;
  for (var json in value) {
    if (json is Map<String, dynamic>) list.add(parser(json));
  }
  return list;
}

JsonMap? parseJson(dynamic value) {
  try {
    if (value is JsonMap) return value;
    if (value is String && value.isNotEmpty) {
      return jsonDecode(value) as JsonMap;
    }
  } catch (_) {
    return null;
  }
  return null;
}

double parseDouble(dynamic value) => value.toString().toDouble();

bool parseBool(dynamic value) => value == true || value == 1 || value == 1.toString() || value == true.toString();

DateTime parseUtcDateTimeToLocal(String value) => value.parseUtcDateTime().toLocal();

String toUtcDateTime(DateTime value) => value.toUtc().toIso8601String();

DateTime parseUtcDateTimeFromMilliseconds(int value) =>
    DateTime.fromMillisecondsSinceEpoch(value, isUtc: true).toLocal();

int toUtcDateTimeMilliseconds(DateTime value) => value.toUtc().millisecondsSinceEpoch;

int parseInt(dynamic value) => value.toString().toInt();

String valueToString(dynamic value) => value.toString();
