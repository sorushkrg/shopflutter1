import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:storeshop/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                          onTap: () {},
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
                        "Profile.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                    height: 230,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            width: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.asset("assets/avatar2.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            FirebaseAuth.instance.currentUser!.displayName
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height,
                      child: Column(
                        
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFF8F9FA),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                   ) )
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ]),
        ],
      )),
    );

    // Scaffold(
    //   body: Center(
    //    child:  Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
    //   ),
    // );
  }
}
