import 'package:get/get.dart';
import '../models/request/login_request.dart';
import '../models/request/register_request.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }

  Future<Response> getYoutubeVideos(String path) {
    return get(path);
  }

  Future<Response> getEvents(String path) {
    return get(path);
  }
}
