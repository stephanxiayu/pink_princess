import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pink_princess/note/note.dart';



final _lightColors = [
  Colors.white,
  Colors.white,
  Colors.white,
Colors.white,
 Colors.white,
  Colors.white,
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.pink.shade700),
            ),
            SizedBox(height: 4),
            Text(
              note.title,
               style: TextStyle(
      color: Colors.pink,
      fontSize: 20,fontWeight: FontWeight.bold,
      shadows: <Shadow>[Shadow(offset: Offset(1.0, 1.0),blurRadius: 2.0,color: Colors.grey,
        ),
      ],
    ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 100;
      case 2:
        return 100;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}