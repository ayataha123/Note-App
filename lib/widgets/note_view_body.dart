
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notesCubit/notes_cubit.dart';
import 'package:note_app/widgets/custom_view_appar.dart';
import 'custom_list_view_item.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState(){
    BlocProvider.of<NotesCubit>(context).fetchAhhNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomViewAppBar(text: 'Notes', icon: Icons.search,),
          Expanded(child: ListViewItem()),
        ],
      ),
    );
  }
}


