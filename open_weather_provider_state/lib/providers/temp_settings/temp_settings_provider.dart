// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';

part 'temp_settings_state.dart';

class TempSettingsProvider extends StateNotifier<TempSettingsState> {
  TempSettingsProvider() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    state = state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celsius
            ? TempUnit.fahrenheit
            : TempUnit.celsius);
    print('temp unit: $state');
  }
}
