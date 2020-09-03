import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/home_controller.dart';
import 'package:getxdemo/models/users.dart';

class ListUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'users',
        builder: (_) {
          if (_.getLoading) {
            return Center(child: LinearProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final User user = _.getUsers[index];
                return ListTile(
                  onTap: () => _.showUserProfile(user),
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                  trailing: Text(user.lastName),
                  leading:
                      CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                );
              },
              itemCount: _.getUsers.length,
            );
          }
        });
  }
}
