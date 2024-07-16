class SongEntity {
  final String title;
  final String artist;
  final num durartion;
  final DateTime releseDate;
  final String? cover;
   final String? song;

  SongEntity(
      {required this.title,
      required this.artist,
      required this.durartion,
      required this.releseDate,
      required this.cover,
      required this.song
      });
}
