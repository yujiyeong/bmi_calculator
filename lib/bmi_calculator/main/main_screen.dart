import 'package:flutter/material.dart';

class BmiMainScreen extends StatelessWidget {
  /// form의 상태를 가지고 있는 것
  final _formKey = GlobalKey<FormState>();

  BmiMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: Center(
          child: Text(
            'BMI 계산기',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.green.shade900,
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
                decoration: InputDecoration(
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
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
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
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {}
                },
                child: Text('결과'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
