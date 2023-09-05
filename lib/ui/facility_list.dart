import 'package:flutter/material.dart';
import 'package:qa_vero_mobileapp_api/model/listview_api_model.dart';

class User {
  final String id;
  final String username;

  User({required this.id, required this.username});
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  final TextEditingController _searchController = TextEditingController();

  final List<User> _users = [
    User(id: '33', username: 'TMIT TEST Facility Master'),
    User(id: '11', username: 'TMIT Test Facility'),
  ];


  List<User> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users;
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredUsers = _users
            .where((user) =>
            user.username.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredUsers = _users;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text('Facilities List',style: TextStyle(color: Colors.white,fontSize: 22),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _searchController,
                 onChanged: _filterUsers,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Search Facility',
              hintStyle: const TextStyle(color: Colors.black),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.all(16.0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextField(
          //     controller: _searchController,
          //     onChanged: _filterUsers,
          //     decoration: InputDecoration(
          //       labelText: 'Search',
          //       prefixIcon: Icon(Icons.search),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                final user = _filteredUsers[index];
                return ListTile(
                  title: Column(
                    children: [
                      Container(
                        width: 600,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.list,size: 40,color: Colors.purple,),
                          title: Text(user.username),
                          trailing: Text(user.id),


                        ),

                      ),
                    ],
                  ),

                  // title: Text(user.username),
                  // subtitle: Text(user.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
