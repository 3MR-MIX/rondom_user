import 'package:dio/dio.dart';
import 'package:rondom_user/model/user_model.dart';

class UserServices{
  static final Dio dio = Dio();

  static Future<UserModel> fetchRandomUsers() async{
    try{
      Response response = await dio.get('https://randomuser.me/api/?results=5');
      return UserModel.fromJson(response.data);
    }catch(error){
      throw Exception('Error fetching users: $error');
    }
  }
}