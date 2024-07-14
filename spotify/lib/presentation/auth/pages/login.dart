import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/apbar/app_bar.dart';
import 'package:spotify/common/widgets/bottom/bassic_app_bottom.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/root/pages/root.dart';
import 'package:spotify/service_locator.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});


  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        width: double.infinity,
        child: ListView(
          children: [
            _loginWidget(),
            _emailFieldWidget(),
            _passwordFieldWidget(),
            const SizedBox(height: 20,),
            BassicAppBottom(onPressed: ()async{
              
             var risult = await  sl<SigninUsecase>().call(
              params: SigninUserReqModel(email: _emailTEC.text.trim(), password: _passwordTEC.text.trim())
             );
              
            risult.fold(
              
              (l) {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar( 
                    content: Text(l),
              
                  )
                );
              },
             (r) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_)=>const RootPage())
                  , (route) => false);
             });
            }, title: "Sign In"),
            const SizedBox(height: 240,),
            _bottomSignUpText(context: context)
          ],
        ),
      ),
    );
  }

  Widget _loginWidget() {
    return Column(
      children: [
        const Text(
          "Sign in",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("If you need any support"),
            TextButton(
              onPressed: () {},
              child: const Text(
                "click here",
                style: TextStyle(color: AppColors.primary),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _fullNameFieldWidget() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 80,
        decoration: BoxDecoration(

            // border: Border.all(color: AppColors.grey)
            ),
        child: TextFormField(
          decoration: InputDecoration(hintText: "Full Name"),
        ));
  }

  Widget _emailFieldWidget() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),

        height: 80,
        decoration: BoxDecoration(


            ),
        child: TextFormField(
          controller: _emailTEC,
          decoration: InputDecoration(hintText: "Enter Email"),
        ));
  }

   Widget _passwordFieldWidget() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),

        height: 80,
        decoration: BoxDecoration(

            // border: Border.all(color: AppColors.grey)
            ),
        child: TextFormField(
          controller: _passwordTEC,
          decoration: InputDecoration(hintText: "Password",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton( 
                onPressed: (){
              
                },
                icon: Icon(
                  true?
                  Icons.visibility_off:
                  Icons.visibility 
                  
                  ),
              ),
            )
          ),
          
        )
        
        );
  }

  Widget _bottomSignUpText({required BuildContext context}){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

          Text("Not A Member ?",
            style: TextStyle( 
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),    
        ),

        TextButton(onPressed: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_)=> SignUpPage())
          );
        }, child: Text( 
          "Register Now",
           style: TextStyle( 
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),    
        ))
      ]);
  }
}