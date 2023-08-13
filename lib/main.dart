import 'package:flutter/material.dart';
import 'package:widget_composition/widgets/grayed_widget.dart';
import 'package:widget_composition/widgets/user_data_provider_widget.dart';
import 'package:widget_composition/widgets/user_name_widget.dart';

import 'models/user_model.dart';

// Top to Down Composition
/*
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
*/

// Down to Top Composition
void main() {
  runApp(GrayedWidget(
    child: Image.network(
      "https://i.picsum.photos/id/1036/200/300.jpg?hmac=VF4u-vITiP0ezQiSbE3UBvxHDFf8ZqJDycaAIoffsCg",
    ),
  ));
}
