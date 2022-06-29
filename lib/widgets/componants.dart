import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color textColor;
  final VoidCallback onClick;

  const MyButton(
      {Key? key,
      required this.text,
      required this.onClick,
      required this.width,
      this.height = 52,
      this.color = Colors.teal,
      this.radius = 15,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: color),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

class MyTextFormField extends StatelessWidget {
  String? hint;
  String? label;
  String? textValidator;
  double radius;
  bool isPassword;
  IconData? suffixIcon;
  final TextEditingController controller;
  final TextInputType type;

  MyTextFormField(
      {Key? key,
      required this.controller,
      required this.type,
      this.isPassword = false,
      this.hint,
      this.label,
      this.suffixIcon,
      this.textValidator,
      this.radius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return textValidator;
        }
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade50,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black,
        ),
      ),
    );
  }
}

Stack divider() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 0.8,
        color: Colors.grey,
      ),
      Container(
          color: Colors.white,
          width: 50,
          child: const Text(
            'Or',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          )),
    ],
  );
}
