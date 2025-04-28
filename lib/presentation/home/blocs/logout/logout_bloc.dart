import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:training/data/dataresource/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LogoutBloc({required this.authRemoteDatasource}) : super(LogoutInitial()) {
    on<LogoutButtonPressed>((event, emit) async {
      emit(LogoutLoading());

      final response = await authRemoteDatasource.logout();

      response.fold(
        (l) => emit(LogoutFailure(message: l)),
        (r) => emit(LogoutSuccess()),
      );
    });
  }
}
