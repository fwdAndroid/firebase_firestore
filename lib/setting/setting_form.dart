import 'package:flutter/material.dart';

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
            validator: (val) => val!.isEmpty ? 'Please Enter Your Name' : null,
            onChanged: (val) => setState(() => _currentname = val),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            value: _currentSugars ?? '0',
            items: sugars
                .map((sugar) => DropdownMenuItem(
                      child: Text('$sugar sugars'),
                      value: sugar,
                    ))
                .toList(),
            onChanged: (val) => setState(() => _currentSugars = val.toString()),
          ),
          //Sliders
          Slider(
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            value: (_currentStrength ?? 100).toDouble(),
            max: 900,
            min: 100,
            divisions: 8,
            onChanged: (val) => setState(
              () => _currentStrength = val.round(),
            ),
          ),
        ],
      ),
    );
  }
}
