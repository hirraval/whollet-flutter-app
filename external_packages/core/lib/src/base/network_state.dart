import 'package:flutter/cupertino.dart';

import 'state.dart';

abstract class NetworkErrorState {
  final bool hasInternetError;
  final bool hasServerError;

  const NetworkErrorState({
    required this.hasInternetError,
    required this.hasServerError,
  });

  NetworkErrorState copyWith({
    bool? hasInternetError,
    bool? hasServerError,
  });
}

extension NetworkErrorStateExt on NetworkErrorState {
  bool get hasError => hasInternetError || hasServerError;
}

class NetworkLoadingState extends LoadingState implements NetworkErrorState {
  @override
  final bool hasInternetError;
  @override
  final bool hasServerError;

  const NetworkLoadingState({
    super.isLoading,
    this.hasInternetError = false,
    this.hasServerError = false,
  });

  @override
  List<Object?> get props => super.props..addAll([hasInternetError, hasServerError]);

  @override
  NetworkLoadingState copyWith({
    bool? isLoading,
    bool? hasInternetError,
    bool? hasServerError,
  }) {
    return NetworkLoadingState(
      isLoading: isLoading ?? this.isLoading,
      hasInternetError: hasInternetError ?? this.hasInternetError,
      hasServerError: hasServerError ?? this.hasServerError,
    );
  }
}

class NetworkDataState<T> extends DataState<T> implements NetworkErrorState {
  @override
  final bool hasInternetError;
  @override
  final bool hasServerError;

  const NetworkDataState({
    super.data,
    super.isLoading,
    this.hasInternetError = false,
    this.hasServerError = false,
  });

  @override
  List<Object?> get props => super.props..addAll([hasInternetError, hasServerError]);

  @override
  NetworkDataState<T> copyWith({
    T? data,
    bool? isLoading,
    bool? hasInternetError,
    bool? hasServerError,
  }) {
    return NetworkDataState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      hasInternetError: hasInternetError ?? this.hasInternetError,
      hasServerError: hasServerError ?? this.hasServerError,
    );
  }
}

class NetworkListState<T> extends ListState<T> implements NetworkErrorState {
  @override
  final bool hasInternetError;
  @override
  final bool hasServerError;
  final List<T> searchList;

  const NetworkListState({
    super.list,
    super.isLoading,
    this.hasInternetError = false,
    this.hasServerError = false,
    this.searchList = const [],
  });

  @override
  List<Object?> get props => super.props..addAll([hasServerError, hasInternetError, searchList]);

  @override
  NetworkListState<T> copyWith({
    List<T>? list,
    List<T>? searchList,
    bool? isLoading,
    bool? hasInternetError,
    bool? hasServerError,
  }) {
    return NetworkListState(
      list: list ?? this.list,
      searchList: searchList ?? this.searchList,
      isLoading: isLoading ?? this.isLoading,
      hasInternetError: hasInternetError ?? this.hasInternetError,
      hasServerError: hasServerError ?? this.hasServerError,
    );
  }
}

class NetworkListSelectionState<T, S> extends SelectionListState<T, S> implements NetworkErrorState {
  @override
  final bool hasInternetError;
  @override
  final bool hasServerError;

  const NetworkListSelectionState({
    super.list,
    super.isLoading,
    super.selected,
    this.hasInternetError = false,
    this.hasServerError = false,
  });

  @override
  List<Object?> get props => super.props..addAll([hasServerError, hasInternetError]);

  @override
  NetworkListSelectionState<T, S> copyWith({
    List<T>? list,
    bool? isLoading,
    S? selected,
    bool? hasInternetError,
    bool? hasServerError,
  }) {
    return NetworkListSelectionState(
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      selected: selected ?? this.selected,
      hasInternetError: hasInternetError ?? this.hasInternetError,
      hasServerError: hasServerError ?? this.hasServerError,
    );
  }
}
