import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/bottom/bassic_app_bottom.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack( 

        children: [ 
          Container(
            width: double.infinity,
            decoration:const BoxDecoration(
              image: DecorationImage(
                
                image: AssetImage(
                  AppImages.introBG,
                  
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
                  const SizedBox( height: 50,),
                  SvgPicture.asset(
                    AppVectors.logo
                  ),
              
                  const Spacer(),
                 const  Text(
                    "Enjoy Listening To Music ",
                    style: TextStyle( 
                      color:Colors.white,
                       fontSize: 18,
                       fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 15,),
              
                   const  Text(
                    textAlign: TextAlign.center,
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                    style: TextStyle( 
                      color:AppColors.grey,
                       fontSize: 13,
                       fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 15,),

                  BassicAppBottom(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_)=>const ChooseModePage())
                    );
                  }, title: "Get started"),
                  
              
              
                  const SizedBox(height: 60,)
                ],
              ),
            ),
        ],
      ),
    );
  }
}