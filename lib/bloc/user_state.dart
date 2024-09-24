// registration_state.dart

import 'package:equatable/equatable.dart';
import 'dart:io';

class RegistrationState extends Equatable {
  final String nama;
  final String email;
  final String noHp;
  final String deskripsiAkun;
  final String alamat;
  final String password;
  final String confirmationPassword;
  final File? photo;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const RegistrationState({
    required this.nama,
    required this.email,
    required this.noHp,
    required this.deskripsiAkun,
    required this.alamat,
    required this.password,
    required this.confirmationPassword,
    this.photo,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory RegistrationState.initial() {
    return RegistrationState(
      nama: '',
      email: '',
      noHp: '',
      deskripsiAkun: '',
      alamat: '',
      password: '',
      confirmationPassword: '',
      photo: null,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegistrationState copyWith({
    String? nama,
    String? email,
    String? noHp,
    String? deskripsiAkun,
    String? alamat,
    String? password,
    String? confirmationPassword,
    File? photo,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return RegistrationState(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      noHp: noHp ?? this.noHp,
      deskripsiAkun: deskripsiAkun ?? this.deskripsiAkun,
      alamat: alamat ?? this.alamat,
      password: password ?? this.password,
      confirmationPassword: confirmationPassword ?? this.confirmationPassword,
      photo: photo ?? this.photo,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
        nama,
        email,
        noHp,
        deskripsiAkun,
        alamat,
        password,
        confirmationPassword,
        photo,
        isSubmitting,
        isSuccess,
        isFailure,
      ];
}
