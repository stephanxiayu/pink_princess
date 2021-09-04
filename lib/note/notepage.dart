

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:pink_princess/ads/ads_data.dart';
import 'package:pink_princess/note/db.dart';
import 'package:pink_princess/note/editnote.dart';
import 'package:pink_princess/note/note.dart';
import 'package:pink_princess/note/notecard.dart';
import 'package:pink_princess/note/notedetails.dart';
import 'package:provider/provider.dart';


class NotesPage extends StatefulWidget {
  
     
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
   
    
  
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override

  Widget build(BuildContext context) { AdmobHelper admobHelper = Provider.of<AdmobHelper> (context, listen:false);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Pink Princess',
            style: TextStyle(
      color: Colors.white,
      fontSize: 40,fontWeight: FontWeight.bold,
      shadows: <Shadow>[Shadow(offset: Offset(1.0, 1.0),blurRadius: 2.0,color: Colors.black,
        ),
      ],
    ),
            ),
          ),
         
        ),
        body: 
             Center(
                       child: isLoading
                ? Lottie.network("https://assets3.lottiefiles.com/packages/lf20_fduqekix.json")
                : notes.isEmpty
                    ? Lottie.network("https://assets3.lottiefiles.com/packages/lf20_ycbVE1.json")
                    : buildNotes()
                     ),
               
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          child: Icon(Icons.add),
          onPressed: () async {admobHelper.loadRewardedAd(); 
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage())
            );

            refreshNotes();
          },
        ),
         bottomNavigationBar: Container(
        height: 60,
        color: Colors.black,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
          ) ));
      
  }
  Widget buildNotes() {
  
  return StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );}
}