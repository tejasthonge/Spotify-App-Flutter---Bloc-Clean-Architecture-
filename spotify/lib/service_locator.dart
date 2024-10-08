

import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_implimetetion.dart';
import 'package:spotify/data/repository/songs/songs_repositor_imp.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/data/sources/songs/sons_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/songs/songs.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/domain/usecases/songs/get_new_songs_usecase.dart';
import 'package:spotify/domain/usecases/songs/get_play_list_usecase.dart';

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
   sl.registerSingleton<SigninUsecase>(
    SigninUsecase()
  );




   sl.registerSingleton<SongsFirebaseService>(
    SongsFirebaseServiceImp()
  );
   sl.registerSingleton<SongsRepository>(
    SongsRepositoryImp()
  );
   sl.registerSingleton<GetNewSongsUsecase>(
    GetNewSongsUsecase()
  );
   sl.registerSingleton<GetPlayListUsecase>(
    GetPlayListUsecase()
  );



}

