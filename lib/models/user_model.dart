class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? nik;
  final String? phoneNumber;
  final String? role;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.nik,
    this.phoneNumber,
    this.role,
  });

  // Fungsi untuk mengubah data JSON dari API menjadi Objek Dart (UserModel)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      nik: json['nik'], // Menampung NIK pengguna
      phoneNumber: json['phone_number'],
      role: json['role'],
    );
  }

  // Fungsi untuk mengubah Objek Dart kembali ke bentuk JSON jika diperlukan
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nik': nik,
      'phone_number': phoneNumber,
      'role': role,
    };
  }
}