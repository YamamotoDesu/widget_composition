# [Widget Composition](https://medium.com/flutter-community/think-in-flutter-way-widget-composition-f8c4065de94b)
## ✨ Top to Down Composition
### Usage: To provide some data from parent to child.
Some of the well-known widgets that fit in this group are `StreamBuilder`, `InheritedWidget`, and `FutureBuilder`.

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


<blockquote>
Here you can see UserDataProviderWidget loads user’s data from some were and pass it using builder function to its child. Some of the good results are our widget doesn’t depend on its child and the child doesn’t have any clue where this data comes from.

So if in the future we want to get data from the database instead of the network we can modify this widget or create a separate widget for it. So its child doesn’t need to be modified.
</blockquote>

## ✨ Down to Top Composition
### Usage: To add something for all widgets which is a child of our main widget
Most of the Flutter built-in widgets use this type of composition for example `Container`, `Padding`, and `SizedBox`.

```dart
import 'package:flutter/material.dart';

class GrayedWidget extends StatelessWidget {
  final Widget child;

  const GrayedWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.grey,
        BlendMode.saturation,
      ),
      child: child,
    );
  }
}
```

```dart
void main() {
  runApp(GrayedWidget(
    child: Image.network(
      "https://i.picsum.photos/id/1036/200/300.jpg?hmac=VF4u-vITiP0ezQiSbE3UBvxHDFf8ZqJDycaAIoffsCg",
    ),
  ));
}
```
