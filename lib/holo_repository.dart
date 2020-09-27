import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class HoloRepository {
  final _firebase = FirebaseDatabase.instance;

  Future<List<StreamItem>> getStreamList(String liver) async {
    final ref = await _firebase.reference().child("youtube_data/" + liver).once();

    final dynamicList = (ref.value as List<dynamic>);
    return dynamicList.map((e) => StreamItem.fromDynamic(e)).toList();
  }

  Future<List<Liver>> getLiverList() async {
    final ref = await _firebase.reference().child("youtube_data").once();

    final livers = ref.value as Map<dynamic, dynamic>;

    return livers.keys.map((e) => Liver(e.toString()));
  }
}

class Liver {
  final String liverName;

  Liver(this.liverName);
}

class StreamItem {
  final String videoId;
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final String thumbnailDefault;
  final String thumbnailMedium;
  final String thumbnailHigh;
  final String liveBroadcastContent;
  final String publishTime;
  final String actualStartTime;
  final String actualEndTime;
  final String scheduledStartTime;

  StreamItem(
      this.videoId,
      this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnailDefault,
      this.thumbnailMedium,
      this.thumbnailHigh,
      this.liveBroadcastContent,
      this.publishTime,
      this.actualStartTime,
      this.actualEndTime,
      this.scheduledStartTime);

  StreamItem.fromDynamic(dynamic data)
      : videoId = data["videoId"],
        publishedAt = data["publishedAt"],
        channelId = data["channelId"],
        title = data["title"],
        description = data["description"],
        thumbnailDefault = data["thumbnailDefault"],
        thumbnailMedium = data["thumbnailMedium"],
        thumbnailHigh = data["thumbnailHigh"],
        liveBroadcastContent = data["liveBroadcastContent"],
        publishTime = data["publishTime"],
        actualStartTime = data["actualStartTime"],
        actualEndTime = data["actualEndTime"],
        scheduledStartTime = data["scheduledStartTime"];

  @override
  String toString() {
    return 'StreamItem{videoId: $videoId, publishedAt: $publishedAt, channelId: $channelId, title: $title, description: $description, thumbnailDefault: $thumbnailDefault, thumbnailMedium: $thumbnailMedium, thumbnailHigh: $thumbnailHigh, liveBroadcastContent: $liveBroadcastContent, publishTime: $publishTime, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, scheduledStartTime: $scheduledStartTime}';
  }
}
