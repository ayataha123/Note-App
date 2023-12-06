import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

List<NoteModel> ?notes;
  fetchAhhNotes() {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
     notes = noteBox.values.toList();
     emit(NotesSuccess());
  }
}
