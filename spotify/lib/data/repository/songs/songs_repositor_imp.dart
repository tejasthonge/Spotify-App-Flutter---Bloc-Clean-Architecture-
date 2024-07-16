


import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/songs/sons_firebase_service.dart';
import 'package:spotify/domain/repository/songs/songs.dart';
import 'package:spotify/service_locator.dart';

class SongsRepositoryImp extends SongsRepository{
  @override
  Future<Either> getNewSongs()async {
   return await sl<SongsFirebaseService>().getNewSongs();
  }
  
  @override
  Future<Either> getPlayList()async {
    // TODO: implement getPlayList
     return await sl<SongsFirebaseService>().getPlayList();

  }

}