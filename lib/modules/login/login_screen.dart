// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:udemy_new/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //email field
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      label: 'Email',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      onSubmit: (String value) {},
                      onChange: (String value) {},
                      validate: (String value)
                      {
                        if(value.isEmpty){
                          return "email must not be empty ";
                        }
                        return null;

                      }),


                  SizedBox(
                    height: 20.0,
                  ),
                  // password field
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword
                      , validate: (String value){
                        if(value.isEmpty){
                          return 'password must not be empty';
                        }
                        return null;
                  },
                      label: "password",
                      prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    onChange: (String value){},
                    onSubmit: (String value){},
                    suffixPressed: ()
                    {
                      setState(()
                      {
                        isPassword = !isPassword;

                      });

                    }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: "login",
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Register text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                          onPressed: () {}, child: (Text('Register Now'))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
