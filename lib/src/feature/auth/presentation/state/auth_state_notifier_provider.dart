import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state_notifier.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AsyncValue<Response>>((ref) {
  return AuthStateNotifier(ref);
});

// final loginFutureProvider = Provider(
//   (ref) {
//     final AuthRepository authRepository = ref.watch(authRepositoryProvider);
//     return authRepository.login(username, password);
//   },
// );

final adminNotifierProvider = StateNotifierProvider<AdminNotifier, bool>((ref) {
  return AdminNotifier();
});
