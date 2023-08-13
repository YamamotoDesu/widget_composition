import 'package:flutter/material.dart';
import 'package:widget_composition/widgets/user_data_provider_widget.dart';
import 'package:widget_composition/widgets/user_name_widget.dart';

import 'models/user_model.dart';

// Top to Down Composition
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
