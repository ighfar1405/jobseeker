// registration_event.dart

import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class NamaChanged extends RegistrationEvent {
  final String nama;

  const NamaChanged(this.nama);

  @override
  List<Object> get props => [nama];
}

class EmailChanged extends RegistrationEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class NoHpChanged extends RegistrationEvent {
  final String noHp;

  const NoHpChanged(this.noHp);

  @override
  List<Object> get props => [noHp];
}

class DeskripsiAkunChanged extends RegistrationEvent {
  final String deskripsiAkun;

  const DeskripsiAkunChanged(this.deskripsiAkun);

  @override
  List<Object> get props => [deskripsiAkun];
}

class AlamatChanged extends RegistrationEvent {
  final String alamat;

  const AlamatChanged(this.alamat);

  @override
  List<Object> get props => [alamat];
}

class PasswordChanged extends RegistrationEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmationPasswordChanged extends RegistrationEvent {
  final String confirmationPassword;

  const ConfirmationPasswordChanged(this.confirmationPassword);

  @override
  List<Object> get props => [confirmationPassword];
}

class PhotoUploaded extends RegistrationEvent {
  final File photo;

  const PhotoUploaded(this.photo);

  @override
  List<Object> get props => [photo];
}

class SubmitRegistration extends RegistrationEvent {}
