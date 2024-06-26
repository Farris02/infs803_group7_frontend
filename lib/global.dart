import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/token_manager.dart';
import 'package:tmdb_api/tmdb_api.dart';

const String url =
    "https://rustwebapp.happywave-d1214138.australiaeast.azurecontainerapps.io";

// const String url = "http://localhost:8000";

final TokenManager tokenManager = TokenManager();
final tmdbWithCustomLogs = TMDB(
  //TMDB instance
  ApiKeys(
    'Your API KEY',
    'apiReadAccessTokenv4',
  ), //ApiKeys instance with your keys,
);

const storage = FlutterSecureStorage();
