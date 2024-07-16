import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify/domain/usecases/songs/get_play_list_usecase.dart';

import 'package:spotify/presentation/home/bloc/playlist_state.dart';
import 'package:spotify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit():super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUsecase>().call();

    returnedSongs.fold((l) {
      emit(PlayListFailur());
    }, (r) {
      emit(PlayListLoaded(playlist: r));
    });
  }
}
