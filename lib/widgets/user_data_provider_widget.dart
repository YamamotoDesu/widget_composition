import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserDataProviderWidget extends StatefulWidget {
  final Widget Function(BuildContext context, UserModel user) builder;

  const UserDataProviderWidget({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserDataProviderState();
}

class _UserDataProviderState extends State<UserDataProviderWidget> {
  UserModel? user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadUser();
  }

  Future<void> loadUser() async {
    // Load user from some places like network, database or
    // any place in memory.
    setState(() {
      user = const UserModel("1", "Mahdi", "Shahbazi");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      // show some loading
      return const SizedBox.shrink();
    } else {
      return widget.builder(context, user!);
    }
  }
}
