import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReqModel? userData);
  Future<Either> signUp(CreateUserReqModel? useData);
}

class AuthFirebaseServiceImplimetetion extends AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReqModel? userData) async {

     try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userData!.email, password: userData.password);
      return Right("Sign in successfully");
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if(e.code == 'invalid-email'){
        errorMessage = 'Not user found in the database';
      }
      else if(e.code == 'invalid-credentials'){
        errorMessage = 'Wrong password';
      }
      else{
        errorMessage = e.code;
      }
      return Left(errorMessage);

    }
  
  }

  @override
  Future<Either> signUp(CreateUserReqModel? userData) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userData!.email, password: userData.password);
      return Right("SignUp successfully");
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if(e.code == 'weak-password'){
        errorMessage = 'The password is too weak';
      }
      else if(e.code == 'email-already-in-use'){
        errorMessage = 'Account already in exists with the same email';
      }else{
        errorMessage = e.code;
      }
      return Left(errorMessage);

    }
  }
}
