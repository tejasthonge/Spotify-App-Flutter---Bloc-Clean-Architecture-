


import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUsecase implements UseCase<Either, SigninUserReqModel> {
  @override
  Future<Either> call({SigninUserReqModel? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
