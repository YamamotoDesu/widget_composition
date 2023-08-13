import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserNameWidget extends StatelessWidget {
  final UserModel userModel;

  const UserNameWidget({
    required this.userModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("${userModel.name} ${userModel.family}");
  }
}
