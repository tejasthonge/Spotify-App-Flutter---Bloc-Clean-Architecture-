

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/apbar/app_bar.dart';
import 'package:spotify/common/widgets/bottom/bassic_app_bottom.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/login.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignUpORSignInPage extends StatelessWidget {
  const SignUpORSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack( 
        children: [
          BasicAppBar(),
          Align( 
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern
            ),

          ),

          Align( 
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset( 
              AppVectors.bottomPattern
            ),

          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG
            ),
          ),

          Align(  
            alignment: Alignment.center ,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                    SvgPicture.asset(
                      AppVectors.logo
                    ),
                    const SizedBox(height: 55),
                    const Text( 
              
                      "Enjoy listening to music",
                      style: TextStyle( 
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                      ),
              
                      
                    ),
                    const SizedBox(height: 20),
                     Text(
                      "Spotify is a proprietary Swedish audio streaming and media services provider ",
                      textAlign: TextAlign.center,
                      style: TextStyle( 
                        fontSize: 17,
                          fontWeight: FontWeight.w500 ,
                          color:
                          context.isDarkMode?
                           AppColors.grey:
                          AppColors.darkGrey,
                        )),

                        const SizedBox(height: 30,),

                        Row( 
                          children: [ 
                            Expanded( 
                              flex: 1,
                              child: BassicAppBottom(onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_)=> SignUpPage())
                                  );
                              }, title: "Register"),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              flex: 1, 
                              child: TextButton(
                                style: ButtonStyle( 
                                  // minimumSize: MaterialStateProperty.resolveWith((states) => size.(states) => 
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_)=>const LoginPage())
                                  );
                                  
                                },
                                child: Text("Sign in",
                                  style: TextStyle( 

                                    color:
                                    context.isDarkMode?
                                     Colors.white:
                                    Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                              ) ,
                            ),

                          ],
                        )

                ],  
              ),
            ),
          )
        ],
      ),
    );
  }
}