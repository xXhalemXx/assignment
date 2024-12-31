import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final String gender;
  final Map<String, String?> errors;
  final bool isSubmitting;

  const AuthState({
    this.name = '',
    this.email = '',
    this.gender = '',
    this.errors = const {},
    this.isSubmitting = false,
  });

  AuthState copyWith({
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? country,
    String? state,
    String? city,
    Map<String, String?>? errors,
    bool? isSubmitting,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      // country: country ?? this.country,
      // state: state ?? this.state,
      // city: city ?? this.city,
      errors: errors ?? this.errors,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        gender,
        // country,
        // state,
        // city,
        errors,
        isSubmitting,
      ];
}
