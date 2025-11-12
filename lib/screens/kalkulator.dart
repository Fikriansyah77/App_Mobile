import 'package:flutter/material.dart';
import 'dart:math';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String _result = "0";
  String _expression = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";
  bool _shouldReset = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _result = "0";
        _expression = "";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
        _shouldReset = false;
      } else if (buttonText == "⌫") {
        if (_result.length > 1) {
          _result = _result.substring(0, _result.length - 1);
        } else {
          _result = "0";
        }
      } else if (buttonText == "=") {
        _num2 = double.parse(_result);

        switch (_operator) {
          case "+":
            _result = (_num1 + _num2).toString();
            break;
          case "-":
            _result = (_num1 - _num2).toString();
            break;
          case "×":
            _result = (_num1 * _num2).toString();
            break;
          case "÷":
            _result = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
            break;
          case "%":
            _result = (_num1 % _num2).toString();
            break;
        }

        // Remove .0 if it's an integer
        if (_result.endsWith('.0')) {
          _result = _result.substring(0, _result.length - 2);
        }

        _expression = "";
        _operator = "";
        _shouldReset = true;
      } else if (buttonText == "x²") {
        // Kuadrat
        double currentValue = double.parse(_result);
        _result = (currentValue * currentValue).toString();
        if (_result.endsWith('.0')) {
          _result = _result.substring(0, _result.length - 2);
        }
        _shouldReset = true;
      } else if (buttonText == "√") {
        // Akar kuadrat
        double currentValue = double.parse(_result);
        if (currentValue >= 0) {
          _result = sqrt(currentValue).toString();
          if (_result.endsWith('.0')) {
            _result = _result.substring(0, _result.length - 2);
          }
        } else {
          _result = "Error";
        }
        _shouldReset = true;
      } else if (["+", "-", "×", "÷", "%"].contains(buttonText)) {
        if (_operator.isNotEmpty && !_shouldReset) {
          _buttonPressed("=");
        }
        _num1 = double.parse(_result);
        _operator = buttonText;
        _expression = "$_result $buttonText ";
        _shouldReset = true;
      } else if (buttonText == ".") {
        if (!_result.contains(".")) {
          _result += ".";
        }
      } else {
        if (_result == "0" || _shouldReset) {
          _result = buttonText;
          _shouldReset = false;
        } else {
          _result += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String text, Color color,
      {Color textColor = Colors.white,
      bool isWide = false,
      bool isSpecial = false}) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: () => _buttonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: isWide ? const Size(160, 60) : const Size(60, 60),
          elevation: 4,
          shadowColor: const Color(0x33000000),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: isSpecial ? 18 : 20,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Kalkulator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7C4DCF),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF7C4DCF),
                Colors.black,
                Colors.black,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              // Display Area
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _expression,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xCCFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _result,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Buttons Area
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1AFFFFFF),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // baris pertama
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: _buildButton(
                                    "x²", const Color(0xFF7C4DCF),
                                    isSpecial: true)),
                            Expanded(
                                child: _buildButton(
                                    "√", const Color(0xFF7C4DCF),
                                    isSpecial: true)),
                            Expanded(
                                child: _buildButton(
                                    "%", const Color(0xFF7C4DCF),
                                    isSpecial: true)),
                            Expanded(
                                child:
                                    _buildButton("C", const Color(0xFFEF5350))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),

                      // baris kedua
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: _buildButton(
                                    "7", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child: _buildButton(
                                    "8", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child: _buildButton(
                                    "9", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child:
                                    _buildButton("÷", const Color(0xFF7C4DCF))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),

                      // baris ketiga
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: _buildButton(
                                    "4", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child: _buildButton(
                                    "5", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child: _buildButton(
                                    "6", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child:
                                    _buildButton("×", const Color(0xFF7C4DCF))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),

                      // baris keempat
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: _buildButton(
                                    "1", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child: _buildButton(
                                    "2", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child: _buildButton(
                                    "3", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child:
                                    _buildButton("-", const Color(0xFF7C4DCF))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),

                      // baris kelima
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildButton("0", const Color(0xFF424242),
                                  textColor: Colors.white, isWide: true),
                            ),
                            Expanded(
                                child: _buildButton(
                                    ".", const Color(0xFF424242),
                                    textColor: Colors.white)),
                            Expanded(
                                child:
                                    _buildButton("⌫", const Color(0xFFFF9800))),
                            Expanded(
                                child:
                                    _buildButton("+", const Color(0xFF7C4DCF))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),

                      // baris keenam - Equals button
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          child: ElevatedButton(
                            onPressed: () => _buttonPressed("="),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C4DCF),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              minimumSize: const Size(double.infinity, 60),
                              elevation: 4,
                              shadowColor: const Color(0x33000000),
                            ),
                            child: const Text(
                              "=",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
