# [Widget Composition](https://medium.com/flutter-community/think-in-flutter-way-widget-composition-f8c4065de94b)
## ✨ Top to Down Composition
### Usage: This type of composition is normally used to provide some data from parent to child.
Some of the well-known widgets that fit in this group are StreamBuilder, InheritedWidget, and FutureBuilder.

```dart
void main() {
  runApp(
    UserDataProviderWidget(builder: (_, UserModel userModel) {
      return UserNameWidget(
        key: Key(userModel.id),
        userModel: userModel,
      );
    }),
  );
}
```

```dart
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
```

```dart
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
```
