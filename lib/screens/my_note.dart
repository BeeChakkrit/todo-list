import 'package:flutter/material.dart';
import 'package:flutter_todoapp_getx/screens/model/todo_model.dart';
import 'package:get/get.dart';

import 'controller/todo_controller.dart';

class MyNote extends StatelessWidget {
  int index;
  MyNote({this.index});
  @override
  Widget build(BuildContext context) {
    final TodoController nc = Get.find();
    String text = "";
    text = index == null ? " " : nc.notes[index].title;
    TextEditingController textEditingController =
        new TextEditingController(text: text);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple.shade400,
              title: index == null
                  ? Text('Create a New Note ')
                  : Text('Update note'),
            ),
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: textEditingController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          fillColor: Colors.indigo.shade300,
                          hintText: 'Create a new note!!',
                          labelText: ' My Note',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Cancel'),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                if (index == null) {
                                  nc.notes.add(TodoModel(
                                      title: textEditingController.text));
                                } else {
                                  var updatenote = nc.notes[index];
                                  updatenote.title = textEditingController.text;
                                  nc.notes[index] = updatenote;
                                }

                                Get.back();
                              },
                              child:
                                  index == null ? Text('Add') : Text('Update'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            )));
  }
}
