import 'package:flutter/material.dart';

class LoginPageTextField extends StatefulWidget {
  LoginPageTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    required this.isPaswordField,
    this.icon,
    this.iconColor,
    this.onChanged,
  }) : controller = controller;
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final Color? iconColor;
  final ValueChanged<String>? onChanged;
  bool? isDisabledButton;
  bool isPaswordField;

  @override
  State<LoginPageTextField> createState() => _LoginPageTextFieldState();
}

class _LoginPageTextFieldState extends State<LoginPageTextField> {
  bool clicked = true;
  Widget passWordView() {
    final icon = clicked ? Icons.visibility_off : Icons.visibility;
    final color = clicked ? Colors.grey : Colors.blue;
    return IconButton(
      splashColor: Colors.black,
      splashRadius: 20,
      onPressed: () => setState(() => clicked = !clicked),
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color.fromARGB(255, 69, 68, 68),
      obscureText: widget.isPaswordField ? clicked : false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: widget.isPaswordField,
          child: passWordView(),
        ),
        // suffixStyle: TextStyle(),
        fillColor: Color(0xFFF2F2F2),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      controller: widget.controller,
    );
  }
}
