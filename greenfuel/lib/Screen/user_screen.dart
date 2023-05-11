import 'package:flutter/material.dart';
import '../Screen/ingredient_screen.dart';
import 'package:provider/provider.dart';
import '../Provider/User_Provider.dart';
import '../Widgets/editable_profile.dart';
import '../Widgets/user_bottom.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user';

  UserScreen();

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.52,
          width: MediaQuery.of(context).size.width,
          child: Card(child: EditableProfile()),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            child: Card(child: UserBottom()),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(IngredientScreen.routeName, arguments: null);
            },
          ),
        ),
      ],
    ));
  }
}
