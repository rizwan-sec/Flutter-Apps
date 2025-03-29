import 'package:flutter/material.dart';


Future<void> showConfirmationDialog(
  BuildContext context, {
  required String contentText,  
  required VoidCallback onConfirm, 
  String confirmText = 'Delete',
  String cancelText = 'Cancel', 
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(contentText),
        actions: <Widget>[
         
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text(cancelText),
          ),

          TextButton(
            onPressed: () {
              onConfirm();  
              Navigator.of(context).pop();
            },
            child: Text(confirmText, style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
