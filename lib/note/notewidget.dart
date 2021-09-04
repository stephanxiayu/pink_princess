import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Text("Aufgabe hinzufügen",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),),
              SizedBox(height: 40,),
              buildTitle(),
              SizedBox(height: 20),
              buildDescription(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() => Container(  margin: EdgeInsets.all(10),height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.teal,// set border color
            width: 3.0),   // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius
      ),
    child: TextFormField(
          maxLines: 1,
          initialValue: title,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '  Überschrift.....',
            hintStyle: TextStyle(color: Colors.grey[700],fontSize: 16),
          ),
          validator: (title) =>
              title != null && title.isEmpty ? 'du musst schon was schreiben' : null,
          onChanged: onChangedTitle,
        ),
  );

  Widget buildDescription() => Container(  margin: EdgeInsets.all(10),height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.teal,// set border color
            width: 3.0),   // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius
      ),
    child: TextFormField(
          maxLines: 5,
          initialValue: description,
          style: TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '   schreib etwas.....',
            hintStyle: TextStyle(color: Colors.grey[700]),
          ),
          validator: (title) => title != null && title.isEmpty
              ? 'Du musst schon ein Text schreiben'
              : null,
          onChanged: onChangedDescription,
        ),
  );
}