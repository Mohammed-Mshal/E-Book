import 'package:flutter/material.dart';
import 'package:my_project/Componeants/myButton.dart';
import 'package:my_project/Componeants/my_Textfield.dart';
import 'package:my_project/Pages/Home.dart';

//MyHomePage(title: "E-Book")
class Login extends StatelessWidget {
  BuildContext context;

  Login({super.key, required this.context});
  //Sign User In
  void SingInUser() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            //  Logo
            const Icon(
              Icons.lock,
              size: 70,
            ),
            //  Welcome Back, you've been missed!
            Text(
              "Welcome Back, you've been missed!",
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            //  userName textField
            const MyTextField(
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(
              height: 25,
            ),

            //  Password textField
            const MyTextField(
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            //  forgot Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //  sign in button
            MyButton(
              onTap: SingInUser,
            ),
            //  Or Continue With
            const SizedBox(
              height: 50,
            ),

            const SizedBox(
              height: 25,
            ),

            //not a member? Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("not a member?"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  " Register Now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
