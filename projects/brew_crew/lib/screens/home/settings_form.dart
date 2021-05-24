import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser>(context);

    return StreamBuilder<AppUserData>(
      stream: DatabaseService(
        uid: user.uid,
      ).appUserData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        }

        AppUserData appUserData = snapshot.data;
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Bottom Sheet title
              Text(
                'Update your brew settings.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                initialValue: appUserData.name,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty?'Please enter a name':null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20.0),
              //dropdown
              DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentSugars ?? appUserData.sugars,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentSugars = val),
              ),
              //slider
              Slider(
                value: (_currentStrength ?? appUserData.strength).toDouble(),
                activeColor: Colors.brown[_currentStrength ?? appUserData.strength],
                inactiveColor: Colors.brown[_currentStrength ?? appUserData.strength],
                min: 100.0,
                max: 900.0,
                divisions: 8,
                onChanged: (val) => setState(() => _currentStrength = val.round()),
              ),
              // Update button
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => Colors.pink[400])
                ),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid,).updateUserData(
                      _currentSugars ?? appUserData.sugars,
                      _currentName ?? appUserData.name,
                      _currentStrength ?? appUserData.strength,
                    );
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        );
      }
    );
  }
}
