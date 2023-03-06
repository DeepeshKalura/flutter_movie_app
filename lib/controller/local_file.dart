import 'package:shared_preferences/shared_preferences.dart';

class LocalFile {
  static const String _key = 'favorite';

  static Future<void> saveFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorite = prefs.getStringList(_key) ?? [];
    favorite.add(id);
    await prefs.setStringList(_key, favorite);
  }

  static Future<void> removeFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorite = prefs.getStringList(_key) ?? [];
    favorite.remove(id);
    await prefs.setStringList(_key, favorite);
  }

  static Future<List<String>> getFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorite = prefs.getStringList(_key) ?? [];
    return favorite;
  }

  //Implemeting watchlist in Local File

  static Future<void> saveWatchlist(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final watchlist = prefs.getStringList(_key) ?? [];
    watchlist.add(id);
    await prefs.setStringList(_key, watchlist);
  }

  static Future<void> removeWatchlist(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final watchlist = prefs.getStringList(_key) ?? [];
    watchlist.remove(id);
    await prefs.setStringList(_key, watchlist);
  }

  static Future<List<String>> getWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    final watchlist = prefs.getStringList(_key) ?? [];
    return watchlist;
  }
}
