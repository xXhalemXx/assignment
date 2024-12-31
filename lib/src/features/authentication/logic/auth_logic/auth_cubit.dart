import 'package:assignment/src/core/routes/names.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  // Form key
  final formKey = GlobalKey<FormState>();

  GlobalKey<FormFieldState> genderKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> phoneKey = GlobalKey<FormFieldState>();

  // Validation patterns
  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );
  static final RegExp _namePattern = RegExp(r'^[a-zA-Z\s]{2,}$');

  // variable to store
  bool isValidPhone = false;

  void updateName(String value) {
    final errors = Map<String, String?>.from(state.errors);
    if (!_namePattern.hasMatch(value)) {
      errors['name'] = 'Please enter a valid name';
    } else {
      errors.remove('name');
    }
    emit(state.copyWith(name: value, errors: errors));
  }

  void updateEmail(String value) {
    final errors = Map<String, String?>.from(state.errors);
    if (!_emailPattern.hasMatch(value)) {
      errors['email'] = 'Please enter a valid email';
    } else {
      errors.remove('email');
    }
    emit(state.copyWith(email: value, errors: errors));
  }

  void validatePhone(bool value) {
    isValidPhone = value;
    phoneKey.currentState!.validate();
  }

  void updateGender(String value) {
    genderKey.currentState!.validate();
  }

  void updateCountry(String value) {
    final errors = Map<String, String?>.from(state.errors);
    if (value.isEmpty) {
      errors['country'] = 'Please Enter a country';
    } else {
      errors.remove('country');
    }
    emit(state.copyWith(country: value, errors: errors));
  }

  void updateState(String value) {
    final errors = Map<String, String?>.from(state.errors);
    if (value.isEmpty) {
      errors['state'] = 'Please Enter a state';
    } else {
      errors.remove('state');
    }
    emit(state.copyWith(state: value, errors: errors));
  }

  void updateCity(String value) {
    final errors = Map<String, String?>.from(state.errors);
    if (value.isEmpty) {
      errors['city'] = 'Please enter a city';
    } else {
      errors.remove('city');
    }
    emit(state.copyWith(city: value, errors: errors));
  }

  bool validateForm() {
    final errors = <String, String?>{};

    if (!_namePattern.hasMatch(state.name)) {
      errors['name'] = 'Please enter a valid name';
    }
    if (!_emailPattern.hasMatch(state.email)) {
      errors['email'] = 'Please enter a valid email';
    }
    emit(state.copyWith(errors: errors));
    return errors.isEmpty;
  }

  Future<void> submitForm({required BuildContext context}) async {
    formKey.currentState!.validate();
    if (!validateForm()) return;

    emit(state.copyWith(isSubmitting: true));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Handle success
    emit(state.copyWith(isSubmitting: false));

    Navigator.pushNamed(context, RoutesName.home);
  }
}
