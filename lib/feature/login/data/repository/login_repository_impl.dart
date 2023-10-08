import 'package:dartz/dartz.dart';
import 'package:flutter_clean_acrtect/config/failure/failure.dart';
import 'package:flutter_clean_acrtect/feature/login/data/data_scources/login_network_data_scource.dart';
import 'package:flutter_clean_acrtect/feature/login/data/models/user.dart';
import 'package:flutter_clean_acrtect/feature/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginNetworkDataSource _loginNetworkDataSource;
  LoginRepositoryImpl(this._loginNetworkDataSource);
  @override
  Future<Either<Failure, User>> login(
      {required String userName, required String password}) async {
    try {
      User user = await _loginNetworkDataSource.login(
          userName: userName, password: password);
      return Right(user);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return const Left(Failure.unAutherised());
    }
  }
}
