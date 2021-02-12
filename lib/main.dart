import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bill Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tipPercentage = 15;
  int _billAmt = 0;

  double get _totalAmount => _billAmt + _tipAmount;
  double get _tipAmount => _billAmt * (_tipPercentage / 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onChanged: (newValue) {
                  setState(() {
                    _billAmt = int.parse(newValue);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Bill Amount',
                  hintText: 'Enter your bill amount',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                onChanged: (newValue) {
                  setState(() {
                    _tipPercentage = int.parse(newValue);
                  });
                },
                initialValue: _tipPercentage.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tip (%)',
                  hintText: 'Enter your Tip percentage',
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Tip Amount: \$$_tipAmount',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Total Amount: \$$_totalAmount',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
