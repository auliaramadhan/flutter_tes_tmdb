import 'package:equatable/equatable.dart';

enum StatusState { initial, fetching, success, failure }

abstract class GeneralState<T> extends Equatable {
  final StatusState status;
  final T? data;
  final String? message;

  const GeneralState({
    this.status = StatusState.initial,
    this.data,
    this.message,
  });

  GeneralState copyWith({
    StatusState? status,
    T? data,
    String? message,
  });
  @override
  List<Object?> get props => [status, data, message];
}
