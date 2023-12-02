import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

abstract class BaseBloc<E extends Object?, S extends Object?> extends Bloc<E, S>
    with StreamSubscriptionMixin, ListMixin, ApiMixin {
  @override
  final BuildContext context;

  BaseBloc({required this.context, required S initialState}) : super(initialState);

  @override
  StreamSubscription<DataEvent<T>> processData<T>(
    Stream<DataEvent<T>> stream, {
    bool handleLoading = true,
    bool ignoreCache = false,
    required ResultCallback<T>? onSuccess,
    LoadingCallback? onLoading,
    ApiExceptionCallback? onFailure,
  }) {
    final subscription = super.processData(
      stream,
      handleLoading: handleLoading,
      ignoreCache: ignoreCache,
      onLoading: onLoading,
      onSuccess: onSuccess,
      onFailure: onFailure,
    );
    listSubscription.add(subscription);
    return subscription;
  }
}
