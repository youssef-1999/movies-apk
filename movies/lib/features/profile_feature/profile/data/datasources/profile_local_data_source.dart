import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getProfile();
  Future<void> saveProfile(ProfileModel profile);
  Future<void> clear();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  static const _kName = 'profile_name';
  static const _kPhone = 'profile_phone';
  static const _kAvatar = 'profile_avatar';
  static const _kWish = 'profile_wish_count';
  static const _kHistory = 'profile_history_count';

  @override
  Future<ProfileModel> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    // Fall back to the signed-in Firebase user instead of a placeholder name.
    final user = FirebaseAuth.instance.currentUser;
    return ProfileModel(
      name: prefs.getString(_kName) ?? user?.displayName ?? '',
      phone: prefs.getString(_kPhone) ?? user?.phoneNumber ?? '',
      avatarIndex: prefs.getInt(_kAvatar) ?? 1,
      wishListCount: prefs.getInt(_kWish) ?? 0,
      historyCount: prefs.getInt(_kHistory) ?? 0,
    );
  }

  @override
  Future<void> saveProfile(ProfileModel p) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kName, p.name);
    await prefs.setString(_kPhone, p.phone);
    await prefs.setInt(_kAvatar, p.avatarIndex);
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kName);
    await prefs.remove(_kPhone);
    await prefs.remove(_kAvatar);
    await prefs.remove(_kWish);
    await prefs.remove(_kHistory);
  }
}
