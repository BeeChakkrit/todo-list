import 'package:flutter/material.dart';
import 'package:flutter_todoapp_getx/screens/controller/todo_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_todoapp_getx/screens/my_note.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController nc = Get.put(TodoController());
    Widget getNoteList() {
      return Obx(
        () => ListView.builder(
            itemCount: nc.notes.length,
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: Text(nc.notes[index].title,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      leading: Text(
                        (index + 1).toString() + ".",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: Wrap(children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.create),
                            onPressed: () => Get.to(MyNote(index: index))),
                        IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'Delete Note',
                                  middleText: nc.notes[index].title,
                                  onCancel: () => Get.back(),
                                  buttonColor: Colors.deepPurple.shade400,
                                  confirmTextColor: Colors.white,
                                  cancelTextColor: Colors.deepPurple.shade400,
                                  onConfirm: () {
                                    nc.notes.removeAt(index);
                                    Get.back();
                                  });
                            })
                      ])),
                )),
      );
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Todo App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.deepPurple.shade400,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
              onPressed: () {
                Get.to(MyNote());
              },
            ),
            body: Container(
              child: Padding(padding: EdgeInsets.all(20), child: getNoteList()),
            )));
  }
}
