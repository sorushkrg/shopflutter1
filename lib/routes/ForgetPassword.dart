import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeshop/routes/Login.dart';
import 'package:storeshop/routes/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickalert/quickalert.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  void forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      
      
    } catch (FirebaceAuthException) {}
  }

  final _emailController = TextEditingController();
  String get email => _emailController.text.trim();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150),
                  child: const Text("Forget your password?",
                      style: TextStyle(
                          fontSize: 27,
                          color: Color.fromRGBO(26, 115, 232, 1),
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Your password will be reset by email.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "Enter your email address",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60, right: 60),
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 212, 210),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "example@gmail.com",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async{
                  forgetPassword(email);
                     QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Reset password massage send.',
                    );
                   
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 60, right: 60),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(26, 115, 232, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                        child: Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const LoginPage());
                  },
                  child: const Text(
                    "Back to log in",
                    style: TextStyle(color: Color.fromRGBO(26, 115, 232, 1)),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
