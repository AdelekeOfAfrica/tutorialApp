class AppConstants {
  static const String SERVER_API_URL =
      "http://192.168.213.2:8000/"; // always use ip address this will allow it to work simontaineously on both andriod and ios
  static String IMAGE_UPLOADS_PATH = "${SERVER_API_URL}uploads/";
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token';
  static const String STORAGE_DEVICE_OPEN_FIRST_KEY = "first_time ";
}
