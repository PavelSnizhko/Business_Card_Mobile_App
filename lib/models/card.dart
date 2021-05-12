


class Card{
  final int id;
  final String imageUrl;
  final String name;
  final String lastName;
  final String company;
  final String phone;
  final String email;
  final String description;
  // int id;
  // String imageUrl;
  // String name;
  // String lastName;
  // String company;
  // String phone;
  // String email;
  // String description;

  Card(this.id, this.imageUrl, this.name, this.lastName, this.company, this.phone, this.email, this.description);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatar': imageUrl,
      'name': name,
      'lastName': lastName,
      'company': company,
      'phone': phone,
      'email': email,
      'description': description,
    };
  }

  // factory Card.fromJson(Map<String, dynamic> json) => Card(
  //   id: json['id'],
  //   imageUrl: json['avatar'],
  //   name: json['name'],
  //   lastName: json['lastName'],
  //   company: json['company'],
  //   phone: json['phone'],
  //   email: json['email'],
  //   description: ['description'],
  //   // phone: ['phone'],
  //   // email: ['email'],
  //   // description: ['description'],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //     'id': id,
  //     'avatar': imageUrl,
  //     'name': name,
  //     'lastName': lastName,
  //     'company': company,
  //     'phone': phone,
  //     'email': email,
  //     'description': description,
  // };

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Card{id: $id, avatar: $imageUrl, name: $name, lastName: $lastName,'
        ' company: $company, phone: $phone, email: $email, description: $description}';
  }

}