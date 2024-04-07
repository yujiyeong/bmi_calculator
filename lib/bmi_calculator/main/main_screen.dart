import 'package:bmi_calculator/bmi_calculator/result/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiMainScreen extends StatefulWidget {
  const BmiMainScreen({super.key});

  @override
  State<BmiMainScreen> createState() => _BmiMainScreenState();
}

class _BmiMainScreenState extends State<BmiMainScreen> {
  /// form의 상태를 가지고 있는 것
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: const Center(
          child: Text(
            'BMI 계산기',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
        child: Form(
          key: _formKey,

          /// 잘못된 정보를 입력했을 때, 에러를 처리하는 textformfield, 사용 위해서는 form 필요
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '키를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                keyboardType: TextInputType.number,

                /// 유효성 검사
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (ResultScreen(
                                height: double.parse(_heightController.text),
                                weight: double.parse(_weightController.text),
                              ))));
                },
                child: const Text('결과'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
