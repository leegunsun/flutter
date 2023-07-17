import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_ex/providers/bg_color.dart';
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [counter];

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}

class Counter extends StateNotifier<CounterState> with LocatorMixin {
  Counter() : super(CounterState(counter: 0));

  void increment() {
    print(read<BgColor>().state);

    Color currentColor = read<BgColor>().state.color;

    if (currentColor == Colors.black) {
      state = state.copyWith(counter: state.counter + 10);
    } else if (currentColor == Colors.red) {
      state = state.copyWith(counter: state.counter - 10);
    } else {
      state = state.copyWith(counter: state.counter + 1);
    }
  }

  @override
  void update(Locator watch) {
    print('1. in Counter StateNotifier: ${watch<BgColorState>().color}');
    print('2. in Counter StateNotifier: ${watch<BgColor>().state.color}');
    super.update(watch);
  }
}
