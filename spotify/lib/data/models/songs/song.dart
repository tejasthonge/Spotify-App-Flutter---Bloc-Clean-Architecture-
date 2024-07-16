

import 'package:spotify/domain/entities/songs/songs.dart';

class SongModel {
   String? title;
   String? artist;
   num? durartion;
   DateTime? releseDate;
   String? cover;
   String? song;

  SongModel(
      {required this.title,
      required this.artist,
      required this.durartion,
      required this.releseDate,
      required this.cover,
      required this.song
      });


  SongModel.fromJSON(Map<String,dynamic> data){

    title =data["title"] ?? "";
    artist = data["artist"] ?? "";
    durartion = data['durartion']  ?? 0;
    releseDate = DateTime.parse(data["release_date"]?? "0001-01-01");
    cover =data["cover"] ?? "";
    song = data["song"] ?? "";

    

  }

  //creting the function to convert the the songmodel to song entities 

  //we use the extension 

 


}
 

 extension SongModelExt on SongModel {

  SongEntity toSongEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      durartion: durartion!,
      releseDate: releseDate!,
      cover: cover!,
      song: song!
    );
  }
 }