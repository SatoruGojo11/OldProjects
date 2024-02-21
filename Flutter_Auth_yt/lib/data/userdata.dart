class Userdata {
  late String _username;
  late String _useremail;
  late String _userpwd;

  String get userName => _username;

  set userName(String value) {
    if (value.isNotEmpty) {
      _username = value;
    }
  }

  String get userEmail => _useremail;

  set userEmail(String value) {
    if (value.isNotEmpty) {
      _useremail = value;
    }
  }

  String get userPwd => _userpwd;

  set userPwd(String value) {
    if (value.isNotEmpty) {
      _userpwd = value;
    }
  }
}
