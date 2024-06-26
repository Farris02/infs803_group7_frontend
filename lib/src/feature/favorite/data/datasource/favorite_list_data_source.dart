import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/favorite.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/token_manager.dart';

abstract class FavoriteListDataSource {
  Future<List<Favorite>> getFavoriteList(int userId);
}

class FavoriteListRemoteDataSource implements FavoriteListDataSource {
  @override
  Future<List<Favorite>> getFavoriteList(int userId) async {
    final token = await tokenManager.token;

    final result = await http.get(
      Uri.parse("$url/favorites/$userId"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final List<Favorite> movie = [];

    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      final List dataList = data["favorites"] as List;
      return dataList.map((e) {
        final u = Favorite.fromJson(e as Map<String, dynamic>);
        return u;
      })
          // .where((e) => e.deleted != true)
          .toList();
    } else if (result.statusCode == 401) {
      final response = await TokenManager().refreshToken();
      if (response!.statusCode == 200) {
        getFavoriteList(userId);
      }
    }
    return movie;
  }
}
