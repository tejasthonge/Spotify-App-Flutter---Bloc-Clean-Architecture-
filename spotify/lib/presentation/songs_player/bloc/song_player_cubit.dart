



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/presentation/songs_player/bloc/song_player_state.dart';


class SongPlayerCubic extends Cubit<SongPlayerState>{
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration =Duration.zero;
  Duration songPosition =Duration.zero;

  SongPlayerCubic() : super(SongPlayerLoading()){ 

     audioPlayer.positionStream.listen((position) {
      songPosition =position;
      updateSongPlayerUI();
     });

     audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
      
     });
  }
   

  void updateSongPlayerUI(){
    emit(
      SongPlayerLoaded()
    );
  }




  Future<void> loadSong(String songURl)async{
 
    try{
      await audioPlayer.setUrl( songURl ).whenComplete((){
        emit(SongPlayerLoaded());
      });
    }
    catch(e){
      emit(SongPlayerFailure());
    }
  }


void  playORpause(){
    if(audioPlayer.playing ){

      audioPlayer.stop();
    }
    else{
      audioPlayer.play();
    }
    emit(
      SongPlayerLoaded()
    );
  }
  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}