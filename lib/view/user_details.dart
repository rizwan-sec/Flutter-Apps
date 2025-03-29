import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userinfo/model/user_model.dart';
import 'package:userinfo/view%20model/user_view_model.dart';
import 'package:userinfo/widgets/user_profile.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.blueGrey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          UserProfileCard(
            user: user,
            onDelete: () {
              context.read<UserViewModel>().deleteUser(user.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
