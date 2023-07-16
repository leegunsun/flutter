import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/pages/todos_page.dart';
import 'package:todo_provider/providers/active_todo_count.dart';
import 'package:todo_provider/providers/flitered_todos.dart';
import 'package:todo_provider/providers/todo_filter.dart';
import 'package:todo_provider/providers/todo_list.dart';
import 'package:todo_provider/providers/todo_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(create: (context) => TodoFilter()),
        ChangeNotifierProvider<TodoSearch>(create: (context) => TodoSearch()),
        ChangeNotifierProvider<TodoList>(create: (context) => TodoList()),
        ProxyProvider<TodoList, ActiveTodoCount>(
            update:
                (BuildContext context, TodoList todoList, ActiveTodoCount? _) =>
                    ActiveTodoCount(todoList: todoList)),
        ProxyProvider3<TodoFilter, TodoSearch, TodoList, FilteredTodos>(
            update: (BuildContext context,
                    TodoFilter todoFilter,
                    TodoSearch todoSearch,
                    TodoList todoList,
                    FilteredTodos? _) =>
                FilteredTodos(
                    todoSearch: todoSearch,
                    todoFilter: todoFilter,
                    todoList: todoList)),
      ],
      child: MaterialApp(
          title: 'TODOS',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const TodosPage()),
    );
  }
}
