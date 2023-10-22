part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;

  const AuthState({
    required this.email,
    required this.password,
  });

  factory AuthState.initial() => const AuthState(
        email: "",
        password: "",
      );

  AuthState copyWith({String? email, String? password, String? checkPassword}) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
