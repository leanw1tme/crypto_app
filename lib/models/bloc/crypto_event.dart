part of 'crypto_bloc.dart';

abstract class CryptoEvent extends Equatable {}

class LoadCryptoList extends CryptoEvent {
  @override
  List<Object?> get props => [];
}
