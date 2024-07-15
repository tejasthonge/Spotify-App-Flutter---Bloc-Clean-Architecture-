

import 'package:spotify/domain/entities/songs/songs.dart';

class SongModel {
   String? title;
   String? artist;
   double? durartion;
   DateTime? releseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.durartion,
      required this.releseDate});


  SongModel.fromJSON(Map<String,dynamic> data){

    title =data["title"] ?? "";
    artist = data["artist"] ?? "";
    durartion = data["duration"]?? 0.0;
    releseDate = DateTime.parse(data["release_date"]?? "0001-01-01");
    

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
    );
  }
 }