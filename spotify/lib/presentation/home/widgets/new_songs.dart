import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/songs/songs.dart';
import 'package:spotify/presentation/home/bloc/new_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/new_songs_state.dart';

class NewSongWidget extends StatelessWidget {
  const NewSongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongCubit()..getNEwSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewSongCubit, NewSongState>(
            builder: (context, state) {
              if (state is NewSongsLoading) {
                return const Center(child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              }
              if (state is NewSongsLoaded) {
                return _songs(
                  songs:  state.songs
                );
              }
              return Container();
            },
          )),
    );
  }

  Widget _songs({required List<SongEntity> songs}) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [

            ],
          );
        },
        separatorBuilder: ((context, index) =>const SizedBox(width: 14)),
        itemCount: songs.length);
  }
}
