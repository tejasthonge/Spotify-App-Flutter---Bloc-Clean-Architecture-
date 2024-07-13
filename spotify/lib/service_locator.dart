

import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_implimetetion.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signUpusecase.dart';

final sl = GetIt.instance;  //this is global and we use all over the app used for check pub.dev 


Future<void> registerDependencies()async{

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImplimetetion()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );
  sl.registerSingleton<SignupUsecase>(
    SignupUsecase()
  );
}

