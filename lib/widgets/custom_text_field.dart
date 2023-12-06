import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.hintText,this.maxLines=1, this.onSaved, this.onChanged});
final String hintText;
final int maxLines;
 final void Function(String?)? onSaved;
 final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if(value?.isEmpty??true)
        {
          return 'Feild Is Require';
        }else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hintText,
     hintStyle:const TextStyle(
      color: kPrimaryColor,
     ),
      border: buildBorder(),
      enabledBorder: buildBorder(),
      focusedBorder: buildBorder(kPrimaryColor),
    ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color:color?? Colors.white,
      )
    );
  }
}