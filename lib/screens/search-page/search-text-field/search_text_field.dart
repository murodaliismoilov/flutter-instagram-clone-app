import 'package:flutter/material.dart';

class SearchTextFIeld extends StatelessWidget {
  const SearchTextFIeld({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      color: Colors.transparent,
      height: size.height * 0.09,
      width: size.width * 1,
      child: Center(
        child: TextField(
          cursorColor: Colors.black,
          cursorWidth: 0.7,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 3.0),
            hintText: 'Поиск',
            fillColor: Color.fromARGB(255, 188, 184, 184),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
