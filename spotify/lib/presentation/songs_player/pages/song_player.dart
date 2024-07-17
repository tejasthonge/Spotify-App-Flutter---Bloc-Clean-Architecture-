import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/apbar/app_bar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/songs/songs.dart';
import 'package:spotify/presentation/songs_player/bloc/song_player_cubit.dart';
import 'package:spotify/presentation/songs_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity song;
  const SongPlayerPage({super.key, required this.song});

  String formateDuration({required Duration duration}) {
    final min = duration.inMinutes.remainder(60);
    final sec = duration.inSeconds.remainder(60);
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
        title: const Text(
          "Now Playing",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubic()..loadSong(song.song!),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              _songInfoWidget(context: context, song: song),
              songPlayer(context: context, song: song)
            ],
          ),
        ),
      ),
    );
  }

  Widget _songInfoWidget(
      {required BuildContext context, required SongEntity song}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 420,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(song.cover!))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  song.title,
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 29,
                  color: context.isDarkMode
                      ? const Color(0xff959595)
                      : AppColors.darkGrey,
                ))
          ],
        ),
        // const SizedBox(height: 5,),
        Text(
          song.artist,
          style: TextStyle(
              color: context.isDarkMode
                  ? Colors.white54
                  : Colors.black.withOpacity(.5),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget songPlayer({required BuildContext context, required SongEntity song}) {
    return BlocBuilder<SongPlayerCubic, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              value: context
                  .read<SongPlayerCubic>()
                  .songPosition
                  .inSeconds
                  .toDouble(),
              min: 0,
              max: context
                  .read<SongPlayerCubic>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
              onChanged: (value) {},
              thumbColor: context.isDarkMode ? Colors.white : Colors.black,
              activeColor: context.isDarkMode
                  ? Colors.white
                  : Colors.black.withOpacity(.9),
              inactiveColor:
                  context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formateDuration(
                        duration: context.read<SongPlayerCubic>().songPosition),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formateDuration(
                        duration: context.read<SongPlayerCubic>().songDuration),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  context.read<SongPlayerCubic>().playORpause();
                },
                icon: Icon(
                  context.read<SongPlayerCubic>().audioPlayer.playing
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 30,
                  color: Colors.white ,
                ),
              ),
            )
          ],
        );
      }
      if (state is SongPlayerFailure) {
        return const Text("Plase Try After some time");
      }
      return Container();
    });
  }
}
