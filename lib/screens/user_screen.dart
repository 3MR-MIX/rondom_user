import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rondom_user/provider/user_provider.dart';
import 'package:rondom_user/widget/user_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider providerObject = UserProvider.getObject(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rondom User"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
            builder: (context,userProvider,child){
              final result = userProvider.userData?.result;

              if(result == null){
                providerObject.fetchUsers();
                return Center(child: CircularProgressIndicator(),);
              }else{
                return ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context,index){
                    final user = result[index];

                    return UserItem(
                      name: user["name"],
                      email: user["email"],
                      image: user["image"],
                    );
                  },
                  separatorBuilder: (context,index) => SizedBox(height: 10,),
                );
              }
            }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            providerObject.fetchUsers();
          },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
