import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class HoloRepository {
  final _firebase = FirebaseDatabase.instance;

  Stream<StreamItem> getStreamList() {
    return _firebase.reference().child("youtube_data/yukihanalamy").onChildAdded.map((event) {
      print(event.snapshot.value["title"]);
      return StreamItem(event.snapshot.value["title"]);
    });
  }

  Future<List<StreamItem>> getOnce() async {
    final ref = await _firebase.reference().child("youtube_data/yukihanalamy").once();

    final dynamicList = (ref.value as List<dynamic>);
    return dynamicList.map((e) => StreamItem(e["title"])).toList();
  }
}

class Liver {
  final String liverName;
  final List<StreamItem> steamList;

  Liver(this.liverName, this.steamList);
}

class StreamItem {
  final String title;

  StreamItem(this.title);
}
