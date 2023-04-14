abstract class AuthServices {
  Future<void> signin({String? mail, String? pass});
  Future<void> signout();
  Future<void> signup({String? name, String? mail, String? pass});
  Future<void> resetPass({String? email});
}
