import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './landing_page.dart';
import './login_page.dart';
import '../models/auth_service.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    pwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/petshop_logo.png'),
              fit: BoxFit.contain,
            ),
            gradient: LinearGradient(
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
              colors: <Color>[
                Colors.pink.shade100,
                Colors.pink.shade100,
              ],
            ),
          ),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: 'Acme',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Create your account ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'FjallaOne',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        maxLines: 1,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.email_rounded),
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'FjallaOne',
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        maxLines: 1,
                        controller: pwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock_rounded),
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'FjallaOne',
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const LandingPage(),
                            ),
                          );
                        },
                        // onPressed: () async {
                        //   bool result = await context
                        //       .read<AuthService>()
                        //       .signUpUsingEmailPassword(
                        //         email: emailController.text,
                        //         pword: pwordController.text,
                        //         showSnackbar: (message) {
                        //           ScaffoldMessenger.of(context).showSnackBar(
                        //             SnackBar(content: Text(message)),
                        //           );
                        //         },
                        //       );
                        //   if (result) {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (_) => const LandingPage(),
                        //       ),
                        //     );
                        //   }
                        // },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Acme',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 60,
                            height: 1,
                            color: Colors.black,
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Acme',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 60,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Do you have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'FjallaOne',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: const EdgeInsets.only(top: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) {
                              return const LoginPage();
                            }),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Acme',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
