
class Contact{
  String username;
  String email;
  // String avatar;

  Contact({required this.username,
    required this.email,
    // required this.avatar,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        username: json['username'],
        email: json['email']
    );
  }
}