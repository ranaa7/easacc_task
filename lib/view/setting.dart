import 'package:easacc_task/view/webview.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? selectedDevice;
  String? enteredURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter URL'),
              onChanged: (value) {
                setState(() {
                  enteredURL = value;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedDevice,
              items: <String>['Printer', 'Other Device']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDevice = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to web view page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>WebViewPage(initialUrl: enteredURL ??'',) ),
                );
              },
              child: Text('Go to Web View'),
            ),
          ],
        ),
      ),
    );
  }
}