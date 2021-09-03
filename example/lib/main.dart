import 'dart:async';
import 'dart:collection';

import 'package:dengage_flutter/dengage_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  DengageFlutter.setFirebaseIntegrationKey(
  //      'FEYl27JxJfay6TxiYCdlkP2FXeuhNfEoI8WkxI_p_l__s_l_5sLbzKmc9c88mSZxRCrLuqMK4y0e8nHajQnBt8poBNDMvNtIytYKZ6byBQZOE8kqkkgDnlye2Lb5AcW3tuIWQjYz');
  // DengageFlutter.setLogStatus(true);

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String contactKey = '';
  var contactKeyController = TextEditingController();
  

  void _onEvent(Object event) {
    print("in on Event object is: ");
    print(event);
  }

  void _onError(Object error) {
    print("in on Error Object is: ");
    print(error);
  }

  @override
  void initState() {
    DengageFlutter.getContactKey().then((value) {
      print("dengageContactKey: $value");
      contactKeyChanged(value);
    });
    // print("setting screen name.");
    // DengageFlutter.setNavigationWithName('MainScreen');

    DengageFlutter.eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);

    super.initState();
  }

  contactKeyChanged(String value) {
    if (value.isNotEmpty) {
      print("$value is not empty.");
      contactKeyController.value = TextEditingValue(
        text: value,
        selection: TextSelection.fromPosition(
          TextPosition(offset: value.length),
        ),
      );
      setState(() {
        contactKey = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text('Flutter Sample App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Enter Your Contact Key'),
            TextFormField(
              controller: contactKeyController,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.input,
                  color: Colors.black54,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
              ),
              cursorColor: Colors.black54,
              keyboardType: TextInputType.text,
              maxLines: 1,
              onChanged: contactKeyChanged,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  String msg = contactKey;
                  if (contactKey.isEmpty) {
                    msg = 'Please enter proper value.';
                  } else {
                    DengageFlutter.setContactKey(contactKey);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(msg),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                child: Text('Set Contact Key'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  String msg = await DengageFlutter.getContactKey();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(msg),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                child: Text('Get & Show Contact Key'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  String token = await DengageFlutter.getToken();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('token: $token'),
                      action: SnackBarAction(
                        label: 'copy token',
                        onPressed: () {
                          Clipboard.setData(new ClipboardData(text: token));
                          },
                      ),
                    ),
                  );
                },
                child: Text('Get & Show Token'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  Map data = new HashMap<String, dynamic>();
                  data["name"] = "Nawaz";
                  await DengageFlutter.sendDeviceEvent("tableName", data);
                },
                child: Text('Send Device Event'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  var subscription = await DengageFlutter.getSubscription();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(subscription.toString()),
                      action: SnackBarAction(
                        label: 'copy',
                        onPressed: () {
                          Clipboard.setData(
                              new ClipboardData(text: subscription.toString()));
                        },
                      ),
                    ),
                  );
                },
                child: Text('Get & Show subscription'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                    DengageFlutter.setNavigationWithName('MainScreen');
                },
                child: Text('Set Screen Name as "MainScreen"'),
              ),
            ),
                        Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Navigate to "SecondScreen"'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  SecondRoute () {
    print("setting screen name as SecondScreen");
    setScreenName();
  }

  setScreenName () async {
    DengageFlutter.setNavigationWithName("SecondScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text('Flutter Sample App, "Second Screen"'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}