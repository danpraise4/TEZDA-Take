import 'package:fetch/features/authentication/domain/providers/domain_auth_provider.dart';
import 'package:fetch/features/authentication/domain/repositories/domain_auth_repository.dart';
import 'package:fetch/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:fetch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    
    final AuthenticationRepository authenticationRepository =
        ref.watch(authRepositoryProvider);

    return AuthNotifier(
      authRepository: authenticationRepository,
    );
  },
);
