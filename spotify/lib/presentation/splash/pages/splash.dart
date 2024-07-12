


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
  super.initState();
  redirectToNextPage();  //
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 

      body: Center( 
        child: SvgPicture.asset(
          AppVectors.logo 
        )
      ),
    );
  }

  Future<void> redirectToNextPage()async{
     Future.delayed(const Duration(seconds: 2),
    (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const GetStartedPage(),
        ),
      );
    } 
   );
  }
}