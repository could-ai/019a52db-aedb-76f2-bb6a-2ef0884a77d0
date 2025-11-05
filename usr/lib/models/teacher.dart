class Teacher {
  final String id;
  final String name;
  final String email;
  final String subject;
  final String bio;
  final double rating;

  Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.subject,
    required this.bio,
    required this.rating,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      subject: json['subject'],
      bio: json['bio'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'subject': subject,
      'bio': bio,
      'rating': rating,
    };
  }
}