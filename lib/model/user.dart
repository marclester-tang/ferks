class User {
  String id;
  String firstName;
  String middleName;
  String lastName;
  String email;
  String mobile;
  String picture;
  String gender;
  int birthday;
  String primaryAddress;
  String secureToken;

  User(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.mobile,
      this.picture,
      this.gender,
      this.birthday,
      this.primaryAddress,
      this.secureToken});

  void setSecureToken(String val) {
    this.secureToken = val;
  }

  String getSecureToken() {
    return secureToken;
  }
}
