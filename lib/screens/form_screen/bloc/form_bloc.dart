import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/models/form_item.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormScreenEvent, AppFormState> {
  FormBloc() : super(FormInitial()) {
    on<EmailChanged>(emailChanged);
    on<NameChanged>(nameChanged);
    on<PhoneChanged>(phoneChanged);
    on<GenderChanged>(genderChanged);
    // on<CountryChanged>(countryChanged);
  }

  FutureOr<void> emailChanged(EmailChanged event, Emitter<AppFormState> emit) {
    print("email change");
    final email = event.email.trim(); // Get the email input and trim spaces.

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (emailRegex.hasMatch(email)) {
      print("email match");
      emit(EmailValidState(email));
    } else {
      print("Email not match");
      emit(EmailInvalidState("Please enter a valid email address."));
    }
  }
}

FutureOr<void> nameChanged(NameChanged event, Emitter<AppFormState> emit) {
  final name = event.name.trim(); // Get the name input and trim spaces.

  // Regular expression to validate a name (allows alphabets and spaces only).
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');

  if (nameRegex.hasMatch(name) && name.isNotEmpty) {
    emit(NameValidState(name));
  } else {
    emit(NameInvalidState("Please enter a valid name."));
  }
}

FutureOr<void> phoneChanged(PhoneChanged event, Emitter<AppFormState> emit) {
  final phone = event.phone.trim(); // Get the phone input and trim spaces.

  // Regular expression to validate a phone number (10 digits only).
  final phoneRegex = RegExp(r'^\d{10}$');

  if (phoneRegex.hasMatch(phone)) {
    emit(PhoneValidState(phone));
  } else {
    print("10 digit phone number");
    emit(PhoneInvalidState("Please enter a valid 10-digit phone number."));
  }
}

FutureOr<void> genderChanged(GenderChanged event, Emitter<AppFormState> emit) {
  final gender = event.gender.trim();

  // List of valid genders
  const validGenders = ['Male', 'Female', 'Other'];

  if (validGenders.contains(gender)) {
    emit(GenderValidState(gender));
  } else {
    emit(GenderInvalidState("Please select a valid gender."));
  }
}
