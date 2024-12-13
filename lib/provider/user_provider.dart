import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rondom_user/model/user_model.dart';
import 'package:rondom_user/services/user_services.dart';

class UserProvider extends ChangeNotifier{
  UserModel? userData;

  static UserProvider getObject (context) => 
      Provider.of<UserProvider>(context,listen: false);

  Future<void> fetchUsers() async{
    userData = await UserServices.fetchRandomUsers();
    notifyListeners();
  }
}