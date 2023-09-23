import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "dart:math";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weight = TextEditingController();
  final bool _validate1 = false;
  final _height = TextEditingController();
  final bool _validate2 = false;
  double finalBmi = 0;

  void bmiCalculator() {
    int var1 = int.parse(_weight.text);
    int var2 = int.parse(_height.text);
    setState(() {
      finalBmi = (var1 / pow((var2 / 100), 2));
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(finalBmi: finalBmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb2d8d8),
      appBar: AppBar(
        backgroundColor: const Color(0xff008080),
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff66b2b2),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter Weight (in kg)",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      controller: _weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Enter the Value',
                        errorText: _validate1 ? "Value Can't Be Empty" : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff66b2b2),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter Height (in cm)",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Enter the Value',
                        errorText: _validate2 ? "Value Can't Be Empty" : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  bmiCalculator();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "COMPUTE",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double finalBmi;

  const ResultPage({super.key, required this.finalBmi});

  Color _textColor() {
    if (finalBmi < 18.5) {
      return const Color.fromARGB(255, 10, 14, 176);
    } else if (finalBmi < 24.9) {
      return const Color.fromARGB(255, 9, 115, 63);
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb2d8d8),
      appBar: AppBar(
        backgroundColor: const Color(0xff008080),
        title: Text(
          "BMI Result",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI is",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: _textColor(), // Set text color based on BMI value
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "$finalBmi",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: _textColor(),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            finalBmi<18.4 ? Text(
              "\nUnderweight",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: _textColor(),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : Container( ),
            (finalBmi>18.4 && finalBmi<24.9)? Text(
              "\nNormal weight",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: _textColor(),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : Container( ),
            finalBmi>24.9 ? Text(
              "\nOverweight",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: _textColor(),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : Container( ),
          ],
      ),
    ));
  }
}

