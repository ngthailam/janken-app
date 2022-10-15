// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/api/alice_config.dart' as _i3;
import 'data/api/rest_client.dart' as _i6;
import 'data/modules/auth/datasource/auth_local_ds.dart' as _i4;
import 'data/modules/auth/datasource/auth_repo.dart' as _i5;
import 'data/modules/match/datasource/match_repo.dart' as _i8;
import 'data/modules/match/socket/match_socket_service.dart' as _i9;
import 'data/modules/stats/stats_repo.dart' as _i10;
import 'features/auth/bloc/login_register_bloc.dart' as _i7;
import 'features/game/bloc/game_page_bloc.dart' as _i11;
import 'features/leaderboard/bloc/leaderboard_page_bloc.dart' as _i12;
import 'features/match/bloc/match_page_bloc.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AliceConfig>(() => _i3.AliceConfigImpl());
  gh.singleton<_i4.AuthLocalDataSource>(_i4.AuthLocalDataSourceImpl());
  gh.factory<_i5.AuthRepo>(() => _i5.AuthRepoImpl(
        get<_i6.RestClient>(),
        get<_i4.AuthLocalDataSource>(),
      ));
  gh.factory<_i7.LoginRegisterBloc>(
      () => _i7.LoginRegisterBloc(get<_i5.AuthRepo>()));
  gh.factory<_i8.MatchRepo>(() => _i8.MatchRepoImpl(get<_i6.RestClient>()));
  gh.factory<_i9.MatchSocketService>(
      () => _i9.MatchSocketServiceImpl(get<_i4.AuthLocalDataSource>()));
  gh.factory<_i10.StatsRepo>(() => _i10.StatsRepoImpl(get<_i6.RestClient>()));
  gh.factory<_i11.GamePageBloc>(() => _i11.GamePageBloc(get<_i8.MatchRepo>()));
  gh.factory<_i12.LeaderboardPageBloc>(
      () => _i12.LeaderboardPageBloc(get<_i10.StatsRepo>()));
  gh.factory<_i13.MatchPageBloc>(() => _i13.MatchPageBloc(
        get<_i8.MatchRepo>(),
        get<_i5.AuthRepo>(),
        get<_i9.MatchSocketService>(),
      ));
  return get;
}
