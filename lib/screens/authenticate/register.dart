import 'package:flutter/material.dart';
import 'package:books_app/services/auth.dart';

class Register extends StatefulWidget {
  //const Register({Key key}) : super(key: key);

  final Function toggleView;
  Register({this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'TO BOOKS APPLICATION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Enter Email & Password to Register',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Password must more than 6 character'
                                : null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: RaisedButton(
                            color: Colors.pink[400],
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() => error =
                                      'please enter a valid email & password');
                                }
                              }
                            }),
                      ),
                    ),
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text(
                          'Login now?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
