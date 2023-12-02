import 'package:equatable/equatable.dart';

class DataSelector<T> extends Equatable {
  final T data;
  final bool isSelected;

  const DataSelector({
    required this.data,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [data, isSelected];

  DataSelector<T> copyWith({
    T? data,
    bool? isSelected,
  }) {
    return DataSelector(
      data: data ?? this.data,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
