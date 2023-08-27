import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsiusOutput = 0.0;
  double _fahrenheitOutput = 0.0;

  void _convertCelsiusToFahrenheit(double value) => setState(() => _fahrenheitOutput = ((value * 9 / 5) + 32));

  void _convertFahrenheitToCelsius(double value) => setState(() => _celsiusOutput = (value - 32) * 5 / 9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Temperature Converter'), backgroundColor: Color(0xFF700CE8), elevation: 6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF38229),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Celsius to Fahrenheit', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Celsius',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 1.5, color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 1.5, color: Colors.black),
                            ),
                            labelStyle: TextStyle(fontSize: 18),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          textAlign: TextAlign.center,
                          enabled: true,
                          style: TextStyle(fontSize: 18),
                          onChanged: (value) {
                            if (value.isNotEmpty) _convertCelsiusToFahrenheit(double.parse(value));
                          },
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.swap_horiz, size: 46, color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        'Fahrenheit: ${_fahrenheitOutput.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16, child: Divider(thickness: 3)),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Fahrenheit to Celsius', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Fahrenheit',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 1.5, color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(width: 1.5, color: Colors.black),
                            ),
                            labelStyle: TextStyle(fontSize: 18),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                          onChanged: (value) {
                            if (value.isNotEmpty) _convertFahrenheitToCelsius(double.parse(value));
                          },
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.swap_horiz, size: 46, color: Color(0xffF38229)),
                      ),
                      Text(
                        'Celsius: ${_celsiusOutput.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
