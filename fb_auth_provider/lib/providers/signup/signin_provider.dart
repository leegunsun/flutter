// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/signup/signup_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class SignupProvider with ChangeNotifier {
  SignupState _state = SignupState.initial();
  SignupState get state => _state;

  final AuthRepository authRepository;
  SignupProvider({
    required this.authRepository,
  });

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    _state = _state.copyWith(signupStatus: SignupStatus.submitting);
    notifyListeners();

    try {
      await authRepository.signup(name: name, email: email, password: password);
      _state = _state.copyWith(signupStatus: SignupStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(signupStatus: SignupStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }
}
