import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  // int _counter = 10;
  String _bmi_value = '';
  // double _sliderValue = 50.0;
  // String _selectedValue = '';
  
  int _calculateBMI(){
    //BMI formula is kg/m^2
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    return (weight / (height * height)).round();
  }
  void _bmiCategory(){
    int bmi = _calculateBMI();
    if(bmi < 18.5){
      setState(() {
      _bmi_value = 'Underweight';
    });
    } else if(bmi >= 18.5 && bmi <= 24.9){
      setState(() {
      _bmi_value = 'Normal weight';
    });
    } else if(bmi >= 25 && bmi <= 29.9){
      setState(() {
      _bmi_value = 'Overweight';
    });
    } else if(bmi >= 30){
      setState(() {
      _bmi_value = 'Obesity';
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              // SizedBox(
              //   width: 200,
              //   child: Slider(
              //   min: 0,
              //   max: 200,
              //   value: _sliderValue, 
              //   onChanged: (value){
              //     setState(() {
              //       _sliderValue = value;
              //     });
              //   },
              //   ),
              // ),
                // Text(
                //   '$_sliderValue',
                //   style: Theme.of(context).textTheme.headlineMedium,
                // ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: TextField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height in metres'
                    ),
                  )
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: TextField(
                    controller: _weightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight in kilograms'
                    ),
                  )
                ),
              // SizedBox(
              //   height: 60,
              //   width: 200,
              //   child:   RadioListTile<String>(
              //       title: const Text('Male'),
              //       value: 'Male',
              //       groupValue: _selectedValue,
              //       onChanged: (value) {
              //         setState(() {
              //           _selectedValue = value!;
              //     });
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 60,
              //   width: 200,
              //   child:   RadioListTile<String>(
              //       title: const Text('Female'),
              //       value: 'Female',
              //       groupValue: _selectedValue,
              //       onChanged: (value) {
              //         setState(() {
              //           _selectedValue = value!;
              //     });
              //     },
              //   ),
              // ),
              TextButton(
                  onPressed: _bmiCategory,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  child: const Text(
                    'Get BMI Value'
                  ),
              ),
              Text(
              'Your BMI category is: $_bmi_value',
              style: Theme.of(context).textTheme.headlineMedium,
              ),
          ],
        ),
      ), 
    );
  }
}
