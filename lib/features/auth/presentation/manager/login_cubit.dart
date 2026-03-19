import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_treasure/features/auth/domain/entities/login_params.dart';


part 'login_state.dart';

enum UserType { student, parent }

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isPasswordHidden = true;
  UserType selectedType = UserType.student;

  void updateType(UserType type) {
    selectedType = type;
    emit(LoginUserTypeChanged(type));
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginPasswordVisibilityChanged(isPasswordHidden));
  }

  Future<void> login({required LoginParams params}) async {
    emit(LoginLoading());
    // Simulate API call  
    await Future.delayed(const Duration(seconds: 1));
    emit(LoginSuccess());
  }
}
