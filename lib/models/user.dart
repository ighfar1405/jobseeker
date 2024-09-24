class User {
  final String nama;
  final String email;
  final String noHp;
  final String deskripsiAkun;
  final String alamat;
  final String password;

  final String confirmationPassword;
  final String photo;

  User({
    required this.nama,
    required this.email,
    required this.noHp,
    required this.deskripsiAkun,
    required this.alamat,
    required this.password,
    required this.confirmationPassword,
    required this.photo,
  });

  // Contoh fungsi untuk konversi dari JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nama: json['nama'],
        email: json['email'],
        noHp: json['no_hp'],
        deskripsiAkun: json['deskripsi_akun'],
        alamat: json['alamat'],
        password: json['password'],
        confirmationPassword: json['confirmation_password'],
        photo: json['photo']);
  }

  // Contoh fungsi untuk konversi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'no_hp': noHp,
      'deskripsi_akun': deskripsiAkun,
      'alamat': alamat,
      'password': password,
      'confirmation_password': confirmationPassword,
    };
  }
}
