part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends AuthEvent {
  final String email;

  const EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends AuthEvent {
  final String password;

  const PasswordChangedEvent({required this.password});
}
