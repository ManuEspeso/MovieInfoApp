import 'package:http/http.dart';
import 'package:movies_proyect/repository/remote/HttpRemoteRepository.dart';
import 'package:movies_proyect/repository/remote/RemoteRepository.dart';

class Injector {
  static final Injector instance = new Injector._internal();

  factory Injector() => instance;

  RemoteRepository remoteRepository;

  Injector._internal() {
    remoteRepository = HttpRemoteRepository(Client());
  }
}
