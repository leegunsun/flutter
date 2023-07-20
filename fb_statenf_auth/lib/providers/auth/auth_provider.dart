// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:fb_auth_provider/providers/auth/auth_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthProvider extends StateNotifier<AuthState> with LocatorMixin {
  AuthProvider() : super(AuthState.unkonwn());

  @override
  void update(Locator watch) {
    final user = watch<fbAuth.User?>();

    if (user != null) {
      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: user,
      );
    } else {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
    }
    print('authState: $state');
    super.update(watch);
  }

  void signout() async {
    await read<AuthRepository>().signout();
  }
}
