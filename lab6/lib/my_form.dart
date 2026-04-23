import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  String _result = "Введите параметры";

  double? _parse(String value) => double.tryParse(value);

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Задайте ширину";
    }

    value = value.replaceAll(RegExp(r'\.*,.*'), '.');

    final number = _parse(value);
    if (number == null) {
      return "Введите число";
    }

    if (number <= 0) {
      return "Ширина должна быть больше 0";
    }

    return null;
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          TextFormField(
            controller: _widthController,
            decoration: const InputDecoration(
              labelText: "Ширина (мм)",
            ),
            keyboardType: TextInputType.number,
            validator: _validate,
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _heightController,
            decoration: const InputDecoration(
              labelText: "Высота (мм)",
            ),
            keyboardType: TextInputType.number,
            validator: _validate,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(70, 50),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();

              if (_formKey.currentState!.validate()) {
                final width = double.parse(_widthController.text.replaceAll(RegExp(r'\.*,\.*'), '.'));
                final height = double.parse(_heightController.text.replaceAll(RegExp(r'\.*,\.*'), '.'));
                final square = width * height;

                setState(() {
                  _result = "S = ${formatNumber(width)} * ${formatNumber(height)} = ${formatNumber(square)} (мм2)";
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Успешно"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Ошибка"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text(
              "Проверить",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Center(
            child: Text(
              _result,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


String formatNumber(double value) {
  return value.toString().replaceAll(RegExp(r'\.?0+$'), '');
}