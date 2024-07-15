import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/apbar/app_bar.dart';
import 'package:spotify/common/widgets/bottom/bassic_app_bottom.dart';
import 'package:spotify/core/configs/assets/app_vector.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/presentation/auth/pages/login.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullNameTEC = TextEditingController();
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
            _registerWidget(),
            _fullNameFieldWidget(),
            _emailFieldWidget(),
            _passwordFieldWidget(),
            const SizedBox(
              height: 20,
            ),
            BassicAppBottom(
                onPressed: () async {
                  EasyLoading.show(status: "Please wait till Data is upload in database");
                  var risult =  await sl<SignupUsecase>().call(
                      params: CreateUserReqModel(
                          fullName: _fullNameTEC.text.trim(),
                          email: _emailTEC.text.trim(),
                          password: _passwordTEC.text.trim()));
      
                  risult.fold(
                    (l) {
                       ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l),
                    ),
                    
                  );
                  EasyLoading.showError("Failed to Create Account");
                  EasyLoading.dismiss();
                    }, 
                    (r) {
                        EasyLoading.showSuccess("Account successfully Created");
                  EasyLoading.dismiss();

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_)=>const HomePage())
                          , (route) => false);
                    }
                    
                     );
                },
                title: "creat account"),
              const SizedBox(height:150,),
            _bottomSigninText(context: context)
          ],
        ),
      ),
    );
  }

  Widget _registerWidget() {
    return Column(
      children: [
        const Text(
          "Register",
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
          controller: _fullNameTEC,
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
          decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(true ? Icons.visibility_off : Icons.visibility),
                ),
              )),
        ));
  }

  Widget _bottomSigninText({required BuildContext context}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Do you have an account? ",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginPage()));
          },
          child: Text(
            "sign in",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ))
    ]);
  }
}
