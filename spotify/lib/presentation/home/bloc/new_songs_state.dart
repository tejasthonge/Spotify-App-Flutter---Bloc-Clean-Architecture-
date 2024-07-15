import 'package:spotify/domain/entities/songs/songs.dart';

abstract class NewSongState {}

class NewSongsLoading extends NewSongState {}

class NewSongsLoaded extends NewSongState {
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}


class NewSongLoadFailur extends NewSongState {}
