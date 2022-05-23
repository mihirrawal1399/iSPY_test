import 'package:flutter/material.dart';
import 'package:ispy/pages/onlinePlayersList.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);
  // static String get signinRoute => "/signin";

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = "",password = "";

    _sendtonextPage(){
      if(formkey.currentState!.validate()){
        formkey.currentState!.save();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>PlayersList(
              userName:name,
              // password:password,
            ))
        );

      }
    }

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("iSPY"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Image(
                image: AssetImage("./lib/assets/rooftop-logo.png"),
                width: 250.0,
                height: 250.0,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
                  maxLength: 15,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Enter Name";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 200.0),
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.white)),
                  onSaved: (input) => name = input!,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: TextFormField(
                  obscureText: true,
                  validator: (input) => input!.length < 6 ? 'Password too short.' : null,
                  decoration: const InputDecoration(labelText: "Password",labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder()),
                  // onSaved:(input)=>password=input!,
                ),
              ),
              RaisedButton(
                onPressed: _sendtonextPage,
                splashColor: Colors.redAccent,
                shape: const StadiumBorder(),
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );


  }
}
