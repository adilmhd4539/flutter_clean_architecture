import 'package:dartz/dartz.dart';
import 'package:flutter_clean_acrtect/config/failure/failure.dart';
import 'package:flutter_clean_acrtect/feature/login/domain/entites/login/login_enity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> login(
      {required String userName, required String password});
}
