import 'package:flutter/material.dart';
import '../Models/User.dart';
import 'package:provider/provider.dart';

import '../Provider/User_Provider.dart';
import 'BuildField/build_TextField.dart';

class EditableProfile extends StatefulWidget {
  EditableProfile() {}

  @override
  State<EditableProfile> createState() => _EditableProfileState();
}

class _EditableProfileState extends State<EditableProfile> {
  String _tempName = '';
  String _tempSurname = '';
  String _tempAge = '';
  String _tempWeight = '';
  String _tempKCal = '';
  String _tempCO2xKm = '';

  void _updateData(String placeholder, String retText) {
    if (placeholder == 'Name')
      _tempName = retText;
    else if (placeholder == 'Surname')
      _tempSurname = retText;
    else if (placeholder == 'Age')
      _tempAge = retText;
    else if (placeholder == 'Weight')
      _tempWeight = retText;
    else if (placeholder == 'Target KCal')
      _tempKCal = retText;
    else if (placeholder == 'CO2xKm') _tempCO2xKm = retText;
  }

  void _submitData(User _user) {
    UserItem _newuser = UserItem(
      Name: _tempName == '' ? _user.item.Name : _tempName,
      Surname: _tempSurname == '' ? _user.item.Surname : _tempSurname,
      Age: _tempAge == '' ? _user.item.Age : int.parse(_tempAge),
      Weight: _tempWeight == '' ? _user.item.Weight : double.parse(_tempWeight),
      TotKcal: _tempKCal == '' ? _user.item.TotKcal : double.parse(_tempKCal),
      CO2xKm: _tempCO2xKm == '' ? _user.item.CO2xKm : double.parse(_tempCO2xKm),
    );

    _user.updateUser(_newuser);
  }

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);

    return Container(
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.transparent),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.4))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg'))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4),
                            color: Colors.white),
                        child: IconButton(
                          onPressed: () {
                            _submitData(_user);
                          },
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.save,
                            color: Colors.black,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:
                        BuildTextField(_user.item.Name, "Name", _updateData)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: BuildTextField(
                        _user.item.Surname, "Surname", _updateData)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: BuildTextField(
                        _user.item.Age.toString(), "Age", _updateData)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: BuildTextField(
                        _user.item.Weight.toString(), "Weight", _updateData)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: BuildTextField(_user.item.TotKcal.toString(),
                        "Target KCal", _updateData)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: BuildTextField(
                        _user.item.CO2xKm.toString(), "CO2xKm", _updateData)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
