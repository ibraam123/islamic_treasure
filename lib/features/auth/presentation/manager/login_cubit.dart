import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

enum UserType { student, parent, teacher }

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

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(LoginSuccess());
  }
}
