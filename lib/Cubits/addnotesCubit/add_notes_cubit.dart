import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color=const Color(0xff9381ff);
  addNotes(NoteModel note) async {
    note.color=color.value;
    emit(AddNotesLoading());

    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNotesSuccess());
    } on Exception catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
