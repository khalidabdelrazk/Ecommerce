// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/authentication/data/data%20sources/sign%20in/impl/sign_in_data_source_impl.dart'
    as _i130;
import '../../features/authentication/data/data%20sources/sign%20in/sign_in_data_source.dart'
    as _i638;
import '../../features/authentication/data/data%20sources/sign%20up/impl/sign_up_data_source_impl.dart'
    as _i319;
import '../../features/authentication/data/data%20sources/sign%20up/sign_up_data_source.dart'
    as _i601;
import '../../features/authentication/data/repository/auth_repository_impl.dart'
    as _i233;
import '../../features/authentication/domain/repository/authentication_repository.dart'
    as _i797;
import '../../features/authentication/domain/use%20case/sign_in_use_case.dart'
    as _i205;
import '../../features/authentication/domain/use%20case/sign_up_use_case.dart'
    as _i642;
import '../../features/authentication/ui/cubit/authentication_view_model.dart'
    as _i239;
import '../api%20manager/api_manager.dart' as _i949;
import '../network/network_info.dart' as _i932;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i949.ApiManager>(() => _i949.ApiManager());
    gh.lazySingleton<_i932.NetworkInfo>(() => _i932.NetworkInfoImpl());
    gh.lazySingleton<_i638.SignInDataSource>(
      () => _i130.SignInDataSourceImpl(
        apiManager: gh<_i949.ApiManager>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i601.SignUpDataSource>(
      () => _i319.SignUpDataSourceImpl(
        apiManager: gh<_i949.ApiManager>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i797.AuthenticationRepository>(
      () => _i233.AuthRepositoryImpl(
        signUpDataSource: gh<_i601.SignUpDataSource>(),
        signInDataSource: gh<_i638.SignInDataSource>(),
      ),
    );
    gh.factory<_i205.SignInUseCase>(
      () => _i205.SignInUseCase(gh<_i797.AuthenticationRepository>()),
    );
    gh.factory<_i642.SignUpUseCase>(
      () => _i642.SignUpUseCase(gh<_i797.AuthenticationRepository>()),
    );
    gh.factory<_i239.AuthenticationViewModel>(
      () => _i239.AuthenticationViewModel(
        signUpUseCase: gh<_i642.SignUpUseCase>(),
        signInUseCase: gh<_i205.SignInUseCase>(),
      ),
    );
    return this;
  }
}
