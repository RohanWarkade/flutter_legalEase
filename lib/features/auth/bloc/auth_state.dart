part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

abstract class AuthActionState extends AuthState {}

class AutherrorState extends AuthActionState {
  final String error;
  AutherrorState({required this.error});
}
//main state //action stateerror state message state