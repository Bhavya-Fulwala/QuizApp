part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
     @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? email,
    String? errorMessage,
    String? userId,
    String? role,
  })= _AuthState;
}
