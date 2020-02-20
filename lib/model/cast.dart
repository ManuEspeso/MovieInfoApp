class Cast {
  String character;
  String name;
  String profilePicture;
  int id;

  Cast.fromJson(Map jsonMap)
      : character = jsonMap['character'],
        name = jsonMap['name'],
        profilePicture = jsonMap['profile_path'],
        id = jsonMap['id'];
}
