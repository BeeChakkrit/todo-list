import 'package:flutter_todoapp_getx/screens/model/todo_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TodoController extends GetxController {
  var notes = List<TodoModel>().obs;
  void add(TodoModel n) {
    notes.add(n);
  }

  @override
  void onInit() {
    List storedNotes = GetStorage().read<List>('notes');
    if (!storedNotes.isNull) {
      notes = storedNotes.map((e) => TodoModel.fromJson(e)).toList().obs;
    }
    ever(notes, (_) {
      GetStorage().write('notes', notes.toList());
    });
    super.onInit();
  }
}
