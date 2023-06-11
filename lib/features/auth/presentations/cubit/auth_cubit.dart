import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nano_health/features/auth/domain/usecases/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.loginUseCase}) : super(AuthInitial());

  final LoginUseCase loginUseCase;
  login(String username, String password) async {
    emit(AuthLoading());
    
    final loginResponse = await loginUseCase(username, password);

    loginResponse.fold((l) {
      emit(AuthError());
    }, (r) {
      emit(AuthSuccess());
    });
  }
}
