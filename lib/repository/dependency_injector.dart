import 'package:http/http.dart';
import 'package:MovieDb/repository/remote/HttpRemoteRepository.dart';
import 'package:MovieDb/repository/remote/RemoteRepository.dart';

class Injector {
  static final Injector instance = new Injector._internal();

  factory Injector() => instance;

  RemoteRepository remoteRepository;

  Injector._internal() {
    remoteRepository = HttpRemoteRepository(Client());
  }
}
