part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {}

class CryptoInitial extends CryptoState {
  @override
  List<Object?> get props => [];
}

class CryptoLoading extends CryptoState {
  @override
  List<Object?> get props => [];
}

class CryptoLoaded extends CryptoState {
  CryptoLoaded({required this.coinsList});
  final Future<MainData>? coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CryptoLoadingFailure extends CryptoState {
  CryptoLoadingFailure({required this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
