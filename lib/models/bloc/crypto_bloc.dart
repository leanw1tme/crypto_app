import 'dart:async';

import 'package:crypto_app/models/models.dart';
import 'package:crypto_app/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

//State Management Bloc
class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc(this.coinsRepository) : super(CryptoInitial()) {
    on<LoadCryptoList>((event, emit) {
      try {
        //Состояние загрузки
        emit(CryptoLoading());
        final coinsList = coinsRepository.getCryptoCoins();
        //Состояние завершения загрузки
        emit(CryptoLoaded(coinsList: coinsList));
      } catch (e) {
        //Состояние ошибки загрузки
        emit(CryptoLoadingFailure(exception: e));
      }
    });
  }

  final CryptoCoinsRepository coinsRepository;
}
