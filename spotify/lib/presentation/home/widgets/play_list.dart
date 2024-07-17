import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/songs/songs.dart';
import 'package:spotify/presentation/home/bloc/playlist_cubit.dart';
import 'package:spotify/presentation/home/bloc/playlist_state.dart';
import 'package:spotify/presentation/songs_player/pages/song_player.dart';

class PalyListWidget extends StatelessWidget {
  const PalyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: SizedBox(
          height: 300,
          child: BlocBuilder<PlayListCubit, PlayListState>(
            builder: (context, state) {
              if (state is PlayListLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              }
              if (state is PlayListLoaded) {
                return Column(
                  children: [
                    _playListWidget(
                        context: context, plalylist: state.playlist),
                  ],
                );
              }
              return Container();
            },
          )),
    ));
  }

  Widget _playListWidget(
      {required BuildContext context, required List<SongEntity> plalylist}) {
    return Expanded(
      child: SizedBox(
        // height: 200,
        child: ListView.builder(
            itemCount: plalylist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SongPlayerPage(
                            song: plalylist[index],
                          )));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 40,
                            width: 40,

                            // transform: Matrix4.translationValues(10, 10, 0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.isDarkMode
                                    ? AppColors.darkGrey
                                    : Color(0xffE6E6E6)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                color: context.isDarkMode
                                    ? Color(0xff959595)
                                    : AppColors.darkGrey,
                                size: 24,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plalylist[index].title,
                                  style: TextStyle(
                                      color: context.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  plalylist[index].artist,
                                  style: TextStyle(
                                      color: context.isDarkMode
                                          ? Colors.white54
                                          : Colors.black.withOpacity(.5),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(plalylist[index]
                                  .durartion
                                  .toString()
                                  .replaceAll(".", ": ")
                              // ""
                              )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_rounded,
                              color: context.isDarkMode
                                  ? Color(0xff959595)
                                  : AppColors.darkGrey,
                            ),
                          )),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
