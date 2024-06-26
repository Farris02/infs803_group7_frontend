import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';
import 'package:infs803_group7_frontend/src/feature/auth/domain/provider/auth_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/admin_manager.dart';

class AuthStateNotifier extends StateNotifier<AsyncValue<Response>> {
  // final AuthRepository authRepository;
  final Ref ref;

  AuthStateNotifier(this.ref) : super(const AsyncValue.loading());

  Future<Response> login(String username, String password) async {
    state = const AsyncValue.loading();
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    final result = authRepository.login(username, password);
    state = await AsyncValue.guard(() => result);
    if (state.hasValue) {
      if (state.value!.statusCode == 200) {
        final data =
            await json.decode(state.value!.body) as Map<String, dynamic>;
        ref
            .read(loginUserIdProvider.notifier)
            .update((state) => int.parse(data["id"].toString()));
      }
    }
    return result;
  }

  Future<Response> register(
    String name,
    String username,
    String password,
  ) async {
    state = const AsyncValue.loading();
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    final result = authRepository.register(name, username, password);
    state = await AsyncValue.guard(() => result);
    if (state.hasValue) {
      if (state.value!.statusCode == 200) {
        final data =
            await json.decode(state.value!.body) as Map<String, dynamic>;
        ref
            .read(loginUserIdProvider.notifier)
            .update((state) => int.parse(data["id"] as String));
        if (int.parse(data["level"].toString()) > 1) {
          // ref.read(adminProvider.notifier).state = true;
          await AdminManager().saveAdminStatus(true);
        }
      }
    }
    return result;
  }

  Future<Response> forget(String username, String email) async {
    state = const AsyncValue.loading();
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    final result = authRepository.forget(username, email);
    state = await AsyncValue.guard(() => result);
    return result;
  }
}

class AdminNotifier extends StateNotifier<bool> {
  AdminNotifier() : super(false) {
    _loadAdminStatus();
  }

  Future<void> _loadAdminStatus() async {
    state = await AdminManager().getAdminStatus();
  }

  Future<void> setAdminStatus(bool isAdmin) async {
    await AdminManager().saveAdminStatus(isAdmin);
    state = isAdmin;
  }
}
