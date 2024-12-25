import 'package:flutter/material.dart';
import 'package:myapp/models/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical:5 ),
          onTap: () {
            onToDoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: const Color.fromARGB(178, 198, 33, 168),
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
              padding: const EdgeInsets.all(0),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 121, 21, 136),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  onDeleteItem(todo.id);
                },
                icon: const Icon(Icons.delete),
                color: const Color.fromARGB(255, 186, 28, 207),
                iconSize: 18,
              ))),
    );
  }
}