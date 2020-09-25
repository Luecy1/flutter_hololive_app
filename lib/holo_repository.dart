import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class HoloRepository {
  final _firebase = FirebaseDatabase.instance;

  Stream<StreamItem> getStreamList() {
    // final snapshot = await _firebase.reference().child("youtube_data/yukihanalamy/0").once();

    // final controller = StreamController<Liver>();
    //
    // _firebase.reference().child("youtube_data/yukihanalamy").onChildAdded.forEach((element) {
    //   controller.sink.add(Liver(
    //     "yukihanalamy",
    //     [StreamItem(element.snapshot.value["title"])],
    //   ));
    // });

    return _firebase
        .reference()
        .child("youtube_data/yukihanalamy")
        .onChildAdded
        .map((event) => StreamItem(event.snapshot.value["title"]));
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
