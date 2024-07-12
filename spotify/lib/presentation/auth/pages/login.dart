import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/apbar/app_bar.dart';
import 'package:spotify/common/widgets/bottom/bassic_app_bottom.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        child: Column(
          children: [
            _loginWidget(),
            _emailFieldWidget(),
            _passwordFieldWidget(),
            const SizedBox(height: 20,),
            BassicAppBottom(onPressed: (){}, title: "Sign In"),
            Spacer(),
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

            // border: Border.all(color: AppColors.grey)
            ),
        child: TextFormField(
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
            MaterialPageRoute(builder: (_)=>const SignUpPage())
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