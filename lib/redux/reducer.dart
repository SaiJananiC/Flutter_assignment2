import 'package:assignmentt_2/models/student.dart';
import 'package:assignmentt_2/redux/actions.dart';
import 'package:assignmentt_2/redux/store.dart';

AppState reducers(AppState prevState, dynamic action) {
  AppState newState;
  if (action is AddStudent) {
    List<Student> newStudents = prevState.students ?? [];
    newStudents.add(action.newStudent);
    newState = AppState.copyWith(prev: prevState, newStudents: newStudents);
  } else if (action is RemoveStudent) {
    List<Student> newStudents = prevState.students ?? [];
    newStudents.removeWhere((s) => s.name == action.name);
    newState = AppState.copyWith(prev: prevState, newStudents: newStudents);
  } else {
    newState = AppState.copyWith(prev: prevState);
  }
  return newState;
}
