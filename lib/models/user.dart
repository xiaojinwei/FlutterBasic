
class User{
  final String token;
  final String id;

  User({this.token,this.id});

  factory User.fromJson(Map<String,dynamic> json) =>
      new User(token: json['token'],id: json['id']);

  Map<String,dynamic> toJson() => <String,dynamic>{
    'token':this.token,
    'id':this.id
  };

  @override
  String toString() {
    return '''User{
            token: $token,
            id: $id,
        }''';
  }

}