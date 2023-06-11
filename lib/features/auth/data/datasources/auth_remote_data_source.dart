import 'package:nano_health/core/error/exceptions.dart';
import 'package:nano_health/core/network/network_info.dart';
import 'package:nano_health/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(String username, String password);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginModel> login(String username, String password) async {
    final dio = Dio();
    final response = await dio.post("${NetworkInfo.baseUrl}""auth/login",
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        }),
        data: {"username": username, "password": password});

    if (response.statusCode == 200) {
      final LoginModel loginModel = LoginModel.fromJson((response.data));

      return loginModel;
    } else {
      throw ServerException();
    }
  }
}
