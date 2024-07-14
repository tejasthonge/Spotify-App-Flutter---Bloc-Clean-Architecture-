import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SignupUsecase implements UseCase<Either, CreateUserReqModel> {
  @override
  Future<Either> call({CreateUserReqModel? params}) {
    return sl<AuthRepository>().signUp(params!);
  }
}
