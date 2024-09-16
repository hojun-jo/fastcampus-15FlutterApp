import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_status.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_fire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoStatusWidget extends ConsumerWidget {
  final Todo todo;

  TodoStatusWidget(
    this.todo, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tap(
      onTap: () {
        ref.readTodoHolder.changeTodoStatus(todo);
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: switch (todo.status) {
          TodoStatus.incomplete => const Checkbox(
            value: false,
            onChanged: null,
          ),
          TodoStatus.ongoing => const Fire(),
          TodoStatus.complete => Checkbox(
            value: true,
            onChanged: null,
            fillColor: MaterialStateProperty.all(context.appColors.checkBoxColor),
          ),
        },
      ),
    );
  }
}
