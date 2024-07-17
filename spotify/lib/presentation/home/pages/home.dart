import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/apbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/home/widgets/new_songs.dart';
import 'package:spotify/presentation/home/widgets/play_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabContrllere;

  @override
  void initState() {
    super.initState();
    _tabContrllere = TabController(
        vsync:
            this, //for the vsync we requider the this but we base this it get error so we have to child of or state class with the SingleTickerProviderStateMixin due to that we get this
        length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: ,
            children: [
              _homeArtistsCard(context: context),
              _tabs(),
              SizedBox(
                height: 240,
                child: TabBarView(controller: _tabContrllere, children: [
                  const NewSongWidget(),
                  Container(),
                  Container(),
                  Container()
                ]),
              ),
               Container(
                margin: EdgeInsets.only(right: 12),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Playlist",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "see more"
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 450,
                child: PalyListWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeArtistsCard({BuildContext? context}) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                height: 110,
                child: SvgPicture.asset(
                  AppVectors.homeTopCard,

                  width: double.infinity,
                  // height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 48.0),
              child: Image.asset(
                AppImages.homeArtist,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        tabAlignment: TabAlignment.start,
        dividerHeight: 0,
        padding: const EdgeInsets.only(bottom: 20),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        controller: _tabContrllere,
        indicatorColor: AppColors.primary,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        unselectedLabelColor:
            context.isDarkMode ? Colors.white24 : Colors.black54,
        tabs: const [
          Tab(
            child: Text(
              "News",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Video",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Artists",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            child: Text(
              "Podcast",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ]);
  }
}
