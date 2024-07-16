import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/songs/song.dart';
import 'package:spotify/domain/entities/songs/songs.dart';

abstract class SongsFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
}

class SongsFirebaseServiceImp extends SongsFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    List<SongEntity> songsList = [];

    try {
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releseDate", descending: true)
          .limit(3)
          .get();

      for (var songs in data.docs) {
        Map<String, dynamic> firebaseDocMap = songs.data();
        var newSongModel = SongModel.fromJSON(firebaseDocMap);
        SongEntity newSongEntity = newSongModel.toSongEntity();
        songsList.add(newSongEntity);
      }
      return Right(songsList);
    } catch (e) {
      return const Left("An error occurred please try again later");
    }
  }
  
  @override
  Future<Either> getPlayList()async {
   List<SongEntity> playList = [];

    try {
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .get();

      for (var songs in data.docs) {
        Map<String, dynamic> firebaseDocMap = songs.data();
        var newSongModel = SongModel.fromJSON(firebaseDocMap);
        SongEntity newSongEntity = newSongModel.toSongEntity();
        playList.add(newSongEntity);
      }
      return Right(playList);
    } catch (e) {
      return const Left("An error occurred please try again later");
    }
  }
}
