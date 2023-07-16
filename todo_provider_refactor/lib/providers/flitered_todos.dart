// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:todo_provider/models/todo_model.dart';
import 'package:todo_provider/providers/todo_filter.dart';
import 'package:todo_provider/providers/todo_list.dart';
import 'package:todo_provider/providers/todo_search.dart';

import 'package:flutter/cupertino.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filterdTodos;
  FilteredTodosState({
    required this.filterdTodos,
  });

  factory FilteredTodosState.initial() {
    return FilteredTodosState(filterdTodos: []);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filterdTodos];

  FilteredTodosState copyWith({
    List<Todo>? filterdTodos,
  }) {
    return FilteredTodosState(
      filterdTodos: filterdTodos ?? this.filterdTodos,
    );
  }
}

class FilteredTodos {
  final TodoSearch todoSearch;
  final TodoFilter todoFilter;
  final TodoList todoList;
  FilteredTodos({
    required this.todoSearch,
    required this.todoFilter,
    required this.todoList,
  });

  FilteredTodosState get state {
    List<Todo> _filteredTodos;

    switch (todoFilter.state.filter) {
      case Filter.active:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos =
            todoList.state.todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoList.state.todos;
        break;
    }

    if (todoSearch.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSearch.state.searchTerm))
          .toList();
    }

    return FilteredTodosState(filterdTodos: _filteredTodos);
  }
}
