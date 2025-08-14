part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
const factory AuthEvent.appstarted() = _AppStartedEvent;

  const factory AuthEvent.login({
    required String email,
    required String password,

  }) = _LoginEvent;
  const factory AuthEvent.signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,

  }) = _SignupEvent;
  const factory AuthEvent.logout() = _LogoutEvent;
}