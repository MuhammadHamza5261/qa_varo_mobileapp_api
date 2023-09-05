import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa_vero_mobileapp_api/bloc/login_bloc/login_bloc_screen.dart';
import 'package:qa_vero_mobileapp_api/bloc/login_bloc/login_state.dart';

import '../bloc/login_bloc/login_event.dart';
import 'listview.dart';
// import 'package:form_field_validator/form_field_validator.dart';
class SmartPgxLogin extends StatelessWidget {
  const SmartPgxLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: signin1STF(),
    );
  }
}

///stf
class signin1STF extends StatefulWidget {
  const signin1STF({Key? key})
      : super(
    key: key,
  );

  @override
  State<signin1STF> createState() => _signin1STFState();
}

class _signin1STFState extends State<signin1STF> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // int id =40;

  late double width;
  late double height;

  bool _obscureText = true;

  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // String token;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    var obscureText = true;

    return SafeArea(
      child: BlocConsumer<LoginTaskBloc,LoginTaskState>(
        builder: (context,state){
          return Container(
            child: Column(
              children: [
                Form(
                  key: _FormKey,
                  child: Column(
                    children: [
                      ///ICON
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(),
                              child: IconButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                  size: 25.0,
                                  color: Color.fromRGBO(52, 107, 33, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Signin text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 23.0,
                              left: 15.0,
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(20, 20, 20, 1),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///btns row

                      /// Horizontal lines row
                      Container(
                        margin: EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 19.0,
                              ),
                              width: width * 0.38,
                              child: Divider(
                                color: Color.fromRGBO(210, 209, 209, 1),
                                height: 5,
                                thickness: 1,
                                indent: 1,
                                endIndent: 3,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Or',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20.0,
                              ),
                              width: width * 0.38,
                              child: Divider(
                                color: Color.fromRGBO(210, 209, 209, 1),
                                height: 5,
                                thickness: 1,
                                indent: 1,
                                endIndent: 3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Email input field
                      Container(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 17.0,
                              ),
                              width: width * 0.93,
                              height: height * 0.053,
                              child: TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                     return 'Please enter your email';
                                  }
                                },
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                cursorColor: Color.fromRGBO(100, 100, 100, 1),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 17.0,
                                    top: 10.0,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(0, 173, 25, 1),
                                        width: 1.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(100, 100, 100, 1),
                                        width: 1.2),
                                  ),
                                  hintText: 'Email',
                                ),
                              ),
                              // validator: (password) {
                              //   if (isPasswordValid(password)) return null;
                              //   else
                              //     return 'Enter a valid password';
                              // },
                            ),

                            ///password
                            Container(
                              margin: EdgeInsets.only(
                                top: 17.0,
                              ),
                              width: width * 0.93,
                              height: height * 0.053,
                              child: TextFormField(
                                controller: password,
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                obscureText: _obscureText,
                                cursorColor: Color.fromRGBO(100, 100, 100, 1),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      top: 10.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(0, 173, 25, 1),
                                          width: 1.2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(100, 100, 100, 1),
                                          width: 1.2),
                                    ),
                                    hintText: 'Password',
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: new Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    )),
                                // validator: MultiValidator(
                                //     [
                                //       RequiredValidator(
                                //           errorText: 'Please enter email')
                                //     ]
                                //
                                // ),
                              ),
                              // validator: (password) {
                              //   if (isPasswordValid(password)) return null;
                              //   else
                              //     return 'Enter a valid password';
                              // },
                            ),
                          ],
                        ),
                      ),

                      ///forgot password
                      Container(
                        margin: EdgeInsets.only(
                          right: 14.5,
                          top: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => forgotpassword()));
                              },
                              child: Container(
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                    color: Color.fromRGBO(20, 20, 20, 1),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      ///SIGN IN btn
                      SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(),
                        width: MediaQuery.of(context).size.width * 0.93,
                        height: MediaQuery.of(context).size.height * 0.053,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink.shade200
                          ),
                          onPressed: () async {


                              BlocProvider.of<LoginTaskBloc>(context).add(
                                SetDataToLoginTaskEvent(
                                  email: email.text,
                                  password: password.text,
                                ),
                              );

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => SmartPgxSTF()));



                            // loginUser;
                            // _handleLogin();

                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => mylist()));
                          },
                          child: state is LoginTaskInProgressState ?
                          const  CircularProgressIndicator(color: Colors.white): const Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255,255,255,1),
                            ),
                          ),
                        ),
                      ),

                      //account text container
                      const SizedBox(
                        height: 16.0,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => getstarted()));
                        },
                        child: const Center(
                          child: Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Color.fromRGBO(20, 20, 20, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },listener: (context,state){
          if(state is LoginTaskDataIsLoadedState){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>   ListViewSTF()),
            );
          }
          else if(state is LoginTaskErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.error,
                ),
              ),
            ) ;
          }


    },

      ),
    );
  }
}