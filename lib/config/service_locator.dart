import 'package:flutter_clean_acrtect/feature/login/data/data_scources/login_network_data_scource.dart';
import 'package:flutter_clean_acrtect/feature/login/data/repository/login_repository_impl.dart';
import 'package:flutter_clean_acrtect/feature/login/domain/usecase/login_usecase.dart';
import 'package:flutter_clean_acrtect/feature/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../feature/login/domain/repositories/login_repository.dart';

final GetIt serviceLocator = GetIt.instance;
Future<void> initializeDependencices() async {
  //LOGIN
  serviceLocator.registerSingleton<http.Client>(http.Client());
  serviceLocator.registerSingleton<LoginNetworkDataSource>(
      LoginNetworkDataSourceImpl(client: serviceLocator()));
  serviceLocator.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(serviceLocator()));
  serviceLocator.registerSingleton<LoginUseCase>(
      LoginUseCase(repository: serviceLocator()));
  serviceLocator.registerSingleton<LoginBloc>(LoginBloc(serviceLocator()));
}
