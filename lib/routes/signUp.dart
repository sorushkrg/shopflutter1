import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeshop/routes/Login.dart';
import 'package:storeshop/routes/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   bool _obscureText = true;
  void signup(String email , String password , String username) async {
  
           try {

    UserCredential result =  await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          User? user = result.user;
          user?.updateDisplayName(username);
          
      if (FirebaseAuth.instance.currentUser!.email != null) {
        Get.offAll(HomePage());
      }
    } catch (FirebaceAuthException) {}   
    
    
  }
  bool loading = false;

  final _username = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();
  String get username => _username.text.trim();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff497fff),
          ),
          ListView(children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: InkWell(
                          onTap: () {
                            Get.to(const LoginPage());
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Sign Up.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: const EdgeInsets.only(top: 16),
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.height * 0.19,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Image.asset("assets/login.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Username",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 214, 212, 210),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: TextField(
                                  controller: _username,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      hintText: "username",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "E-mail",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 214, 212, 210),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      hintText: "example@gmail.com",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                              Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 214, 212, 210),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:const EdgeInsets.only(left: 10, top: 10),
                                child: TextField(
                                  controller: _passwordController,
                                  obscuringCharacter: "*",
                                  obscureText: _obscureText,
                                  decoration:  InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                            _obscureText =!  _obscureText;    
                                        });
                                      },

                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: Icon( _obscureText ? Icons.visibility_off : Icons.visibility),
                                      ),

                                    ),
                                      hintText: "Password",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  loading =true;
                                  signup(email, password, username);
                                });
                                
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: loading ? false : true,
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Visibility(
                                      visible: loading ? true : false,
                                      child: const SizedBox(
                                        height: 20,
                                        width: 20,
                                        
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ))
                                    ),
                                  ],),
                              ),
                            )
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Dont have an account ?"),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(const LoginPage());
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ]),
        ],
      )),
    );
  }
}
