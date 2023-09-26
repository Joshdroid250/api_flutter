import 'package:api_test/api_services/api_service.dart';
import 'package:flutter/material.dart';
import 'api_services/UserModel.dart';

void main() => runApp(PracticeApp());

class PracticeApp extends StatelessWidget {
  const PracticeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Rest Api Example",
      home: Start(),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  late List<UserModel>? _userModel;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = await ApiService().getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuarios'),
        ),
        body: _userModel == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : HomeScreen(_userModel!),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<UserModel> userModelList;

  HomeScreen(this.userModelList);

  @override
  Widget build(BuildContext context) {
    return UserList(userModelList);
  }
}

class UserList extends StatelessWidget {
  final List<UserModel> userModelList;

  UserList(this.userModelList);

  @override
  Widget build(BuildContext context) {
    return userModelList.isEmpty
        ? Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
      itemCount: userModelList.length,
      itemBuilder: (context, index) {
        return UserCard(user: userModelList[index]);
      },
    );
  }
}

class UserCard extends StatelessWidget {
  final UserModel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user.id.toString()),
              Text(user.username),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user.email),
              Text(user.website),
            ],
          ),
        ],
      ),
    );
  }
}