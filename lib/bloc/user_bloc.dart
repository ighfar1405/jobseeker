import 'package:bloc/bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import 'package:http/http.dart' as http;

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState.initial()) {
    on<NamaChanged>((event, emit) {
      emit(state.copyWith(nama: event.nama));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<NoHpChanged>((event, emit) {
      emit(state.copyWith(noHp: event.noHp));
    });

    on<DeskripsiAkunChanged>((event, emit) {
      emit(state.copyWith(deskripsiAkun: event.deskripsiAkun));
    });

    on<AlamatChanged>((event, emit) {
      emit(state.copyWith(alamat: event.alamat));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ConfirmationPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmationPassword: event.confirmationPassword));
    });

    on<PhotoUploaded>((event, emit) {
      emit(state.copyWith(photo: event.photo));
    });

    on<SubmitRegistration>((event, emit) async {
      emit(state.copyWith(isSubmitting: true));

      try {
        // Prepare the request
        var request = http.MultipartRequest(
            'POST', Uri.parse('https://www.jobee.my.id/api/register'));

        request.fields['nama'] = state.nama;
        request.fields['email'] = state.email;
        request.fields['no_hp'] = state.noHp;
        request.fields['deskripsi_akun'] = state.deskripsiAkun;
        request.fields['alamat'] = state.alamat;
        request.fields['password'] = state.password;
        request.fields['confirmation_password'] = state.confirmationPassword;

        if (state.photo != null) {
          request.files.add(await http.MultipartFile.fromPath(
            'photo',
            state.photo!.path,
          ));
        }

        // Send the request
        var response = await request.send();

        if (response.statusCode == 200) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } else {
          emit(state.copyWith(isSubmitting: false, isFailure: true));
        }
      } catch (_) {
        emit(state.copyWith(isSubmitting: false, isFailure: true));
      }
    });
  }
}
