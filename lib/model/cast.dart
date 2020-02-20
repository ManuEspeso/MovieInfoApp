import 'package:movies_proyect/util/utils.dart';

class Cast {
  String character;
  String name;
  String profilePicture;
  int id;

  get profilePictureUrl =>
      getMediumPictureUrl((profilePicture != null ? profilePicture : ""));

  Cast.fromJson(Map jsonMap)
      : character = jsonMap['character'],
        name = jsonMap['name'],
        profilePicture = jsonMap['profile_path'],
        id = jsonMap['id'];
}
