import 'package:fetch/features/authentication/domain/repositories/domain_auth_repository.dart';
import 'package:fetch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(const AuthState.initial());

  Future<void> updateUser(String fullname) async {
    state = const AuthState.loading();
    final response = await authRepository.updateUser(fullname: fullname);

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        return const AuthState.success();
      },
    );
  }

  Future<void> registerUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await authRepository.registerUser(
      username: username,
      password: password,
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        return const AuthState.success();
      },
    );
  }

  Future<void> loginUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await authRepository.loginUser(
      username: username,
      password: password,
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        return const AuthState.success();
      },
    );
  }
}
