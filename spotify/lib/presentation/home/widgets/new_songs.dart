
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
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
          height: 240,
          
          child: BlocBuilder<NewSongCubit, NewSongState>(
            builder: (context, state) {
              if (state is NewSongsLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              }
              if (state is NewSongsLoaded) {
                return _songs(songs: state.songs,context: context);
              }
              return Container();
            },
          )),
    );
  }

  Widget _songs({required List<SongEntity> songs ,required BuildContext context}) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _coverPhoto(song: songs[index],context: context),
              const SizedBox(height: 4),
              Text(
                songs[index].title,
                style: TextStyle(
                  
                  color: context.isDarkMode?
                    Colors.white: 
                    Colors.black
                  ,


                  fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                songs[index].artist,

                style: TextStyle(
                  color: context.isDarkMode?
                    Colors.white54: 
                    Colors.black.withOpacity(.5)
                  ,
                  fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
        separatorBuilder: ((context, index) => const SizedBox(width: 14)),
        itemCount: songs.length);
  }

  Widget _coverPhoto({required SongEntity song ,required BuildContext context}) {
    return SizedBox(
          height: 190,

      child: Stack(
        children: [
          Container(
            height: 180,
            width: 147,
           
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  
                    fit: BoxFit.cover, image:
                    
                     NetworkImage(song.cover!))
                    
                    
                    ),
                     child: Container( 
                  height: 40,
                  width: 40,
                  transform: Matrix4.translationValues(10, 10, 0),
                  decoration:  BoxDecoration( 
                    
                    shape: BoxShape.circle,


                    color:
                      context.isDarkMode?
                      AppColors.darkGrey:
                     Color(0xffE6E6E6)
      
                  ),
                  child:IconButton( 
                    onPressed: (){
                      
                    },
                    icon:   Icon( 
                    Icons.play_arrow_rounded,
                  color:
                      context.isDarkMode?
                      Color(0xff959595):
                     AppColors.darkGrey,
                    size: 24,
      
                  ),
                  )
      
                ),
                    
          ),
         
        ],
      ),
    );
  }
}
