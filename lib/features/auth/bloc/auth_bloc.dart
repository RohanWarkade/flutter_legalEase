import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthType {
  login,
  register,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // on<AuthEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<AuthenticationEvent>(authenticationEvent);
  }

  FutureOr<void> authenticationEvent(
      AuthenticationEvent event, Emitter<AuthState> emit) async {
    switch (event.authType) {
      case AuthType.login:
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            log('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            log('Wrong password provided for that user.');
          }
        }
        break;

      case AuthType.register:
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            log('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }

      default:
    }
  }
}
