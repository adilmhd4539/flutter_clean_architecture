import 'package:dartz/dartz.dart';
import 'package:flutter_clean_acrtect/config/failure/failure.dart';
import 'package:flutter_clean_acrtect/feature/login/domain/repositories/login_repository.dart';

import '../entites/login/login_enity.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase({required this.repository});
  Future<Either<Failure, UserEntity>> login(
      {required String userName, required String password}) {
    return repository.login(userName: userName, password: password);
  }
}
