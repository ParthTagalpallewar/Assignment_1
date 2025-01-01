part of 'form_bloc.dart';

abstract class FormScreenEvent extends Equatable {
  const FormScreenEvent();

  @override
  List<Object> get props => [];
}

class FormSubmitEvent extends FormScreenEvent {
  const FormSubmitEvent();
}

class InitEvent extends FormScreenEvent {
  const InitEvent();
}

class EmailChanged extends FormScreenEvent {
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class NameChanged extends FormScreenEvent {
  const NameChanged({required this.name});
  final String name;
  @override
  List<Object> get props => [name];
}

class PhoneChanged extends FormScreenEvent {
  const PhoneChanged({required this.phone});
  final String phone;

  @override
  List<Object> get props => [phone];
}

class GenderChanged extends FormScreenEvent{
  final String gender;

  const GenderChanged(this.gender);

  @override
  List<Object> get props => [gender];
}

class CountryChanged extends FormScreenEvent {
  final String country;

  const CountryChanged(this.country);
}

class StateChanged extends FormScreenEvent {
  final String state;

  const StateChanged(this.state);
}

class CityChanged extends FormScreenEvent {
  final String city;

  const CityChanged(this.city);
}