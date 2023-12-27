import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:km_test/data/models/user_model.dart';
import 'package:km_test/data/services/api_service.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late List<User> users;
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    users = [];
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final UserModel userModel = await ApiService().fetchUsers(page);
      setState(() {
        users.addAll(userModel.data);
        page++;
      });
    } catch (error) {
      log("Error: $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo is ScrollEndNotification &&
                scrollInfo.metrics.extentAfter == 0) {
              fetchUsers();
            }
            return false;
          },
          child: ListView.separated(
            itemCount: users.length + 1,
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemBuilder: (context, index) {
              if (index < users.length) {
                var items = users[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(child: Image.network(items.avatar)),
                    ),
                    title: Text("${items.firstName} ${items.lastName}"),
                    subtitle: Text(items.email),
                    trailing: Text(items.id.toString()),
                    onTap: () {
                      Navigator.pop(context,
                          '${users[index].firstName} ${users[index].lastName}');
                    },
                  ),
                );
              } else if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Third Screen",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
