import 'package:flutter/material.dart';
import 'package:userinfo/model/user_model.dart';
import 'package:userinfo/widgets/custom_dialog.dart';

class UserProfileCard extends StatelessWidget {
  final User user;
  final VoidCallback onDelete;

  const UserProfileCard({
    super.key,
    required this.user,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatar),
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 20),

            Text(
              '${user.firstName} ${user.lastName}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
          
            Text(
              user.email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
            
                showConfirmationDialog(
                  context,
                  contentText: 'Are you sure you want to delete this profile?',
                  onConfirm: onDelete,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
