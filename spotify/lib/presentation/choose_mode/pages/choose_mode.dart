import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/bottom/bassic_app_bottom.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.chooseModeBG,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(AppVectors.logo),
                const Spacer(),
                const Text(
                  "Choose mode",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: AppColors.darkGrey,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(AppVectors.moon))),
                const SizedBox(height: 20),

                        const Text(
                          "Dart mode",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    
                    Column(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: AppColors.darkGrey,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(AppVectors.sun))),
                const SizedBox(height: 20),

                        const Text(
                          "Light mode",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 80),
                BassicAppBottom(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ChooseModePage()));
                    },
                    title: "Continue"),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
