import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/login_response_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/users/'),
        headers: {'Content-Type': 'application/json'},
        body: model.toJson());

    if (response.statusCode == 201) {
      return right(RegisterResponseModel.fromJson(response.body));
    } else {
      return left("register gagal");
    }
  }

  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: model.toJson());

    if (response.statusCode == 201) {
      return right(LoginResponseModel.fromJson(response.body));
    } else {
      return left("login gagal");
    }
  }
}
