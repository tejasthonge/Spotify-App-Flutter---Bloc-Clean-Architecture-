import 'package:spotify/domain/entities/songs/songs.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> playlist;

  PlayListLoaded({required this.playlist});
}


class PlayListFailur extends PlayListState {}
 