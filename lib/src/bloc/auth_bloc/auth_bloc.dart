import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/src/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(const AuthState()) {
    on<_AppStartedEvent>(_onAppStarted);
    on<_LoginEvent>(_onLogin);
    on<_SignupEvent>(_onSignup);
    on<_LogoutEvent>(_onLogout);
  }

  Future<void> _onAppStarted(_AppStartedEvent event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (loggedIn) {
      emit(state.copyWith(isAuthenticated: true));
    } else {
      emit(state.copyWith(isAuthenticated: false));
    }
  }

  Future<void> _onLogin(_LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      emit(state.copyWith(isAuthenticated: true, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.message));
    }
  }

  Future<void> _onSignup(_SignupEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(UserModel(
            uid: _firebaseAuth.currentUser!.uid,
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            totalScore: 0,
            quizzesTaken: 0,
            highestScore: 0,
            createdAt: DateTime.now(),
          ).toMap());
      

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      emit(state.copyWith(isAuthenticated: true, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.message));
    }
  }

  Future<void> _onLogout(_LogoutEvent event, Emitter<AuthState> emit) async {
    await _firebaseAuth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    emit(state.copyWith(isAuthenticated: false));
  }
}
