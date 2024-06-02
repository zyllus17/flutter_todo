import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/screens/custom_task_screen.dart';

List<Todo> todos = [
  Todo(title: 'Training at the Gym'),
  Todo(title: 'Play Paddle with friends'),
  Todo(title: 'Burger BBQ with family'),
];

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: const Color(0xff3556AB),
            child: const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 40, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/50977126?v=4'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'Hello, Maruf Hassan',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'csengineer.maruf@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xffCDE53D),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/trophy.png',
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Go Pro (No Ads)',
                            style: TextStyle(
                                color: Color(0xff071D55), fontSize: 18),
                          ),
                          Text(
                            'No fuss, no ads, for only \$1 a \nmonth',
                            style: TextStyle(
                                color: Color(0xff0D2972), fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 65,
                  color: const Color(0xff071D55),
                  child: const Center(
                    child: Text(
                      '\$1',
                      style: TextStyle(
                        color: Color(0xffF2C94C),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: Material(
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      tileColor: Colors.white,
                      leading: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          activeColor: const Color(0xff53DA69),
                          checkColor: const Color(0xff399649),
                          shape: const OvalBorder(),
                          value: todos[index].isDone,
                          onChanged: (value) {
                            setState(() {
                              todos[index].isDone = value!;
                            });
                          },
                        ),
                      ),
                      title: Text(
                        todos[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xff0D2972),
                          fontSize: 16,
                          decoration: todos[index].isDone
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0xff071D55),
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            child: const Text('Edit',
                                style: TextStyle(color: Color(0xff071D55))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomTaskScreen(
                                      isEditing: true,
                                      index: index,
                                      todo: todos[index]),
                                ),
                              ).then((value) => setState(() {}));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff123EB1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomTaskScreen(
                isEditing: false,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
