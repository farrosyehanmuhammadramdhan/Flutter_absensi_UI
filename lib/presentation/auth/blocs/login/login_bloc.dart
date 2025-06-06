import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:training/data/dataresource/auth_remote_datasource.dart';
import 'package:training/data/model/response/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;

  LoginBloc(this.authRemoteDatasource) : super(LoginInitial()){
    on<LoginButtonPressed>((event, emit)  async {
      emit(LoginLoading());

      final response = await authRemoteDatasource.login(event.email, event.password);

      response.fold(
        (l) => emit(LoginFailure(message: l)),
        (r) => emit(LoginSuccess(authResponseModel: r)),
    );
  });
  }
}
