import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notesCubit/notes_cubit.dart';

import 'package:note_app/models/note_model.dart';

import 'package:note_app/widgets/edit_note_color_list.dart';

import 'custom_text_field.dart';
import 'custom_view_appar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomViewAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();

              BlocProvider.of<NotesCubit>(context).fetchAhhNotes();
              Navigator.pop(context);
            },
            icon: Icons.check,
            text: 'Edit Note',
          ),
          const SizedBox(height: 32),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hintText: widget.note.title,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              subTitle = value;
            },
            hintText: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          EditNoteColorList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
