

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp( CreateUserReqModel userData)async {
    // TODO: implement signUp

    return  sl<AuthFirebaseService>().signUp(userData);
  }
  
}