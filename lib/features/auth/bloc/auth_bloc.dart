import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_legalease/app.dart';
import 'package:flutter_legalease/features/auth/models/user_model.dart';
import 'package:flutter_legalease/features/auth/repos/auth_repo.dart';
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
    UserCredential? credential;
    switch (event.authType) {
      case AuthType.login:
        try {
          credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            log('No user found for that email.');
            emit(AutherrorState(error: "No user found for that email"));
          } else if (e.code == 'wrong-password') {
            log('Wrong password provided for that user.');
            emit(AutherrorState(
                error: "Wrong password provided for that user."));
          }
        }
        break;

      case AuthType.register:
        try {
          credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            log('The password provided is too weak.');
            emit(AutherrorState(error: "The password provided is too weak."));
          } else if (e.code == 'email-already-in-use') {
            log('The account already exists for that email.');
            emit(AutherrorState(
                error: "The account already exists for that email."));
          }
        } catch (e) {
          log(e.toString());
          emit(AutherrorState(error: "Something Went Wrong"));
        }
    }

    

    if (credential != null) {
      if (event.authType == AuthType.login) {
        UserModel? userModel =
            await AuthRepo.getUserRepo(credential.user?.uid ?? "");
        if (userModel != null) {
          DecidePage.authStream.add(credential.user?.uid ?? "");
          emit(AuthSuccessState());
        } else {
          emit(AutherrorState(error: "Something went wrong"));
        }
        //for login
      } else if (event.authType == AuthType.register) {
        bool success = await AuthRepo.createUserRepo(UserModel(
            uid: credential.user?.uid ?? "",
            tweets: [],
            firstName: "Rohan",
            lastName: "Warkade",
            email: event.email,
            createdAt: DateTime.now()));

        if (success) {
          DecidePage.authStream.add(credential.user?.uid ?? "");
          emit(AuthSuccessState());
        } else {
          emit(AutherrorState(error: "Something wenr wrong"));
        }
      }
    }
  }
}
