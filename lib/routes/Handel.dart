import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:storeshop/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:storeshop/routes/ForgetPassword.dart';
import 'package:storeshop/routes/Login.dart';
import 'package:storeshop/routes/home.dart';



// ignore: must_be_immutable
class Handel extends StatelessWidget {
  Future Firebasetest = Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Firebasetest, builder: (context, snapshot) {
      if(snapshot.hasError){
        return  const Scaffold(
          body: 
          Center(
            child: Text("firebase is not conneted"),
          ),
        );
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return  StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, streamsnapshot) {
          if (streamsnapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${streamsnapshot.hasError}"),
              ),
            );
            
          }
          if (streamsnapshot.connectionState == ConnectionState.active) {
            User? username = streamsnapshot.data;
            if (username == null) {
              return const LoginPage();
              
            }else{
              return  HomePage();
            }

            
          }
          
          return const CircularProgressIndicator();

        },);
        
      }
     return const CircularProgressIndicator();
      
    }
    ,);
  }
}