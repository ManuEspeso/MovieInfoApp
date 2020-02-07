import 'package:movies_proyect/repository/remote/HttpRemoteRepository.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';
import 'package:http/http.dart';

class Injector {
  static final Injector instance = new Injector._internal();

  factory Injector() => instance;

  RemoteRepository remoteRepository;
  //LocalRepository localRepository;

  Injector._internal() {
    remoteRepository = HttpRemoteRepository(Client());
    //localRepository = PreferencesLocalRepository();
  }
}