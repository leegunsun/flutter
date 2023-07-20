// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/models/user_model.dart';
import 'package:fb_auth_provider/providers/profile/profile_state.dart';
import 'package:fb_auth_provider/repositories/profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';

class ProfileProvider extends StateNotifier<ProfileState> with LocatorMixin {
  ProfileProvider() : super(ProfileState.initial());

  Future<void> getProfile({required String uid}) async {
    state = state.copyWith(profileStatus: ProfileStatus.loaded);

    try {
      final User user = await read<ProfileRepository>().getProfile(uid: uid);

      state = state.copyWith(profileStatus: ProfileStatus.loaded, user: user);
    } on CustomError catch (e) {
      state = state.copyWith(profileStatus: ProfileStatus.error, error: e);
    }
  }
}
