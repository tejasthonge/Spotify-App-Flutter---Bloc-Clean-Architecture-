 import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';

abstract class AuthRepository{

  Future<Either> signUp(CreateUserReqModel userData);
  Future<Either> signIn(SigninUserReqModel userData);
 }