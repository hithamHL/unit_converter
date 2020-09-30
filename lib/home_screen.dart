import 'package:flutter/material.dart';

// ignore: camel_case_types
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _unitController =
      TextEditingController(); //handel text from texfield in any where , _ mean this var con't use outside class
  var _result = '';
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  String _startMeasure;
  String _convertedMeasure;
  void _handleSubmitted() {
    setState(() {
      _result = '${int.parse(_unitController.text) / 1000} Km';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter Unit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Text(
                'Convert from m to Km',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //to connect between textfield and button
                controller: _unitController,
                onSubmitted: (value) {
                  _handleSubmitted();
                },
                maxLength: 19,
                decoration: InputDecoration(
                    hintText: 'Enter Value',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide())),
              ),
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  'From',
                ),
                Spacer(),
                DropdownButton(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value;
                    });
                  },
                  value: _startMeasure,
                ),
                Spacer(),
                Text(
                  'To',
                ),
                Spacer(),
                DropdownButton(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    value = _convertedMeasure;
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: 130,
                        height: 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            'Convert',
                            style: (TextStyle(color: Colors.white)),
                          ),
                          color: Theme.of(context).accentColor,
                          onPressed: _handleSubmitted,
                        ),
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side:
                              BorderSide(color: Theme.of(context).accentColor)),
                      child: Text(
                        'Clear',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      onPressed: () {
                        setState(() {
                          _result = '';
                          _unitController.clear();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                _result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
