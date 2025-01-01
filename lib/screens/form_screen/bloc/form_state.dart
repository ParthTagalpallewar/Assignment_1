part of 'form_bloc.dart';

abstract class AppFormState {}

class FormInitial extends AppFormState {}

class EmailValidState extends AppFormState {
  final String email;
  EmailValidState(this.email);
}

class EmailInvalidState extends AppFormState {
  final String error;
  EmailInvalidState(this.error);
}

class NameValidState extends AppFormState {
  final String name;
  NameValidState(this.name);
}

class NameInvalidState extends AppFormState {
  final String error;
  NameInvalidState(this.error);
}

class PhoneValidState extends AppFormState {
  final String phone;
  PhoneValidState(this.phone);
}

class PhoneInvalidState extends AppFormState {
  final String error;
  PhoneInvalidState(this.error);
}

class GenderValidState extends AppFormState {
  final String gender;

  GenderValidState(this.gender);
}

class GenderInvalidState extends AppFormState {
  final String errorMessage;

  GenderInvalidState(this.errorMessage);
}