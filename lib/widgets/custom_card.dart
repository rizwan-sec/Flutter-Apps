import 'package:flutter/material.dart';
import 'package:userinfo/model/user_model.dart'; 

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserCard({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          leading: CircleAvatar(
            radius: 28.0,
            backgroundImage: NetworkImage(user.avatar),
            backgroundColor: Colors.grey[300],
          ),
          title: Text(
            '${user.firstName} ${user.lastName}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            user.email,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
