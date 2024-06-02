import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/screens/todo_screen.dart';

class CustomTaskScreen extends StatefulWidget {
  final Todo? todo;
  final int? index;
  final bool isEditing;

  const CustomTaskScreen(
      {super.key, this.todo, this.index, required this.isEditing});

  @override
  State<CustomTaskScreen> createState() => _CustomTaskScreenState();
}

class _CustomTaskScreenState extends State<CustomTaskScreen> {
  late TextEditingController _todoController;

  @override
  void initState() {
    super.initState();
    _todoController =
        TextEditingController(text: widget.isEditing ? widget.todo?.title : '');
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _saveTodo() {
    String todoTitle = _todoController.text;
    if (todoTitle.isNotEmpty) {
      if (widget.isEditing) {
        setState(() {
          widget.todo?.title = todoTitle;
        });
      } else {
        Todo newTodo = Todo(title: todoTitle);
        todos.add(newTodo);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.isEditing ? 'Edit Task' : 'Add New Task',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff3556AB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Task Name'),
            const SizedBox(height: 10),
            TextField(
              controller: _todoController,
              decoration: InputDecoration(
                hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3556AB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: _saveTodo,
                  child:
                      const Text('Done', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
