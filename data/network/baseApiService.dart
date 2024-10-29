abstract class BaseApiServices {
  Future<dynamic> getApiPublic({required String url});
  Future<dynamic> getApiPrivate({required String url, required String token});
  Future<dynamic> postApiPublic({required dynamic data, required String url});
  Future<dynamic> postAPiPrivate(
      {required dynamic data, required String url, required String token});
}
