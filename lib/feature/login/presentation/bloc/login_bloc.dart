import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_acrtect/config/failure/failure.dart';
import 'package:flutter_clean_acrtect/feature/login/domain/entites/login/login_enity.dart';
import 'package:flutter_clean_acrtect/feature/login/domain/usecase/login_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const _Initial()) {
    on<Login>(_handleOnLogin);
  }
  FutureOr<void> _handleOnLogin(Login event, Emitter<LoginState> emit) async {
    emit(const _Loading());
    final data = await _loginUseCase.login(
        userName: event.username, password: event.password);
    data.fold((error) => emit(_Error(Failure.convertFailureToMessage(error))),
        (user) => emit(_Succes(user: user)));
  }
}
