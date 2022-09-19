import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/screens/registration_page/registration_page_text_fields.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String loginTextForListener = '';
  String passwordTextForListener = '';
  bool isDisabledButton = false;

  @override
  void initState() {
    super.initState();
    loginController.addListener(textFieldListener);
    passwordController.addListener(textFieldListener);
  }

  void textFieldListener() {
    if (loginController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isDisabledButton = true;
    } else {
      isDisabledButton = false;
    }
    setState(() {});
  }

  void logIn() async {
    if (loginController.text == 'admin' && passwordController.text == 'admin') {
      Navigator.pushReplacementNamed(context, '/home-page');
    } else {
      return;
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 330,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Instagram',
                  style: GoogleFonts.norican(
                    textStyle: Theme.of(context).textTheme.headline3,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LoginPageTextField(
                  isPaswordField: false,
                  controller: loginController,
                  hintText: 'Номер телефона, эл. адрес или имя пользователя',
                ),
                SizedBox(
                  height: 15,
                ),
                LoginPageTextField(
                  isPaswordField: true,
                  controller: passwordController,
                  hintText: 'Пароль',
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      disabledBackgroundColor:
                          Colors.blue[800]?.withOpacity(0.5),
                    ),
                    onPressed: isDisabledButton ? logIn : null,
                    child: Text(
                      'Вход',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Забыли свои учетные данные? ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 66, 65, 65),
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'Получить помощь со входом в систему.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 18, 10, 76),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'ИЛИ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 88, 88, 86),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Продолжить как Murodali Ismailov',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(text: 'У вас ещё нет аккаунта? '),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Зарегистрируйтесь.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 18, 10, 76),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
