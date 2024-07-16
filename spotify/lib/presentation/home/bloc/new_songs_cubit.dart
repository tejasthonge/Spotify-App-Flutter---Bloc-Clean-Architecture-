import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/songs/get_new_songs_usecase.dart';
import 'package:spotify/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewSongCubit extends Cubit<NewSongState> {
  NewSongCubit():super(NewSongsLoading());

  Future<void> getNEwSongs() async {
    var returnedSongs = await sl<GetNewSongsUsecase>().call();

    returnedSongs.fold((l) {
      emit(NewSongLoadFailur());
    }, (r) {
      emit(NewSongsLoaded(songs: r));
    });
  }
}
