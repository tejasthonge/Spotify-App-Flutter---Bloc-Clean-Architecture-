import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> signIn();
  Future<Either> signUp(CreateUserReqModel? useData);
}

class AuthFirebaseServiceImplimetetion extends AuthFirebaseService {
  @override
  Future<void> signIn() async {}

  @override
  Future<Either> signUp(CreateUserReqModel? userData) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userData!.email, password: userData.password);
      return Right("Sign in successfully");
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if(e.code == 'weak-password'){
        errorMessage = 'The password is too weak';
      }
      else if(e.code == 'email-already-in-use'){
        errorMessage = 'Account already in exists with the same email';
      }
      return Left(errorMessage);

    }
  }
}
