import 'dart:async';

import 'package:crypto_app/models/data/main_data.dart';
import 'package:crypto_app/repositories/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc(this.coinsRepository) : super(CryptoInitial()) {
    on<LoadCryptoList>((event, emit) {
      try {
        emit(CryptoLoading());
        final coinsList = coinsRepository.getCryptoCoins();
        emit(CryptoLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoLoadingFailure(exception: e));
      }
    });
  }

  final CryptoCoinsRepository coinsRepository;
}
