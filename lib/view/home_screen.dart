import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userinfo/view%20model/user_view_model.dart';
import 'package:userinfo/view/user_details.dart';
import 'package:userinfo/widgets/custom_card.dart';  // Assuming UserCard is in this file

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserViewModel>().fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 10.0,
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!, style: TextStyle(color: Colors.red, fontSize: 18.0)));
          }

          return RefreshIndicator(
            onRefresh: () async => viewModel.fetchUsers(),
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];

                return UserCard(
                  user: user,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsScreen(user: user),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),

      // Button  for refreshing users
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
          context.read<UserViewModel>().fetchUsers();
        },
        backgroundColor: Colors.deepPurple,
        tooltip: 'Refresh Users',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
