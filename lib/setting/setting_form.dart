import 'package:firebasse_firestore/modals/userdata.dart';
import 'package:firebasse_firestore/modals/usermodals.dart';
import 'package:firebasse_firestore/service/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  //Form Valuses
  String? _currentname;
  String? _currentSugars;
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;
          return Form(
            key: formKey,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Text(
                  'Update Your Setting',
                  style: const TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: userData!.name,
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Your Name' : null,
                  onChanged: (val) => setState(() => _currentname = val),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _currentSugars ?? userData.sugar,
                  items: sugars
                      .map((sugar) => DropdownMenuItem(
                            child: Text('$sugar sugars'),
                            value: sugar,
                          ))
                      .toList(),
                  onChanged: (val) =>
                      setState(() => _currentSugars = val.toString()),
                ),
                //Sliders
                Slider(
                  activeColor:
                      Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor:
                      Colors.brown[_currentStrength ?? userData.strength],
                  value: (_currentStrength ?? userData.strength).toDouble(),
                  max: 900,
                  min: 100,
                  divisions: 8,
                  onChanged: (val) => setState(
                    () => _currentStrength = val.round(),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () async {},
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          );
        } else {
          Center(child: CircularProgressIndicator());
        }
        return Text('data');
      },
    );
  }
}
