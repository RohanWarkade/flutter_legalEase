import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_legalease/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() {
// //     return _SplashScreenState();
// //   }
// // }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(body: Center());
// //   }
// // }

// class AuthRegisterScreen extends StatefulWidget {
//   const AuthRegisterScreen({super.key});

//   @override
//   State<StatefulWidget> createState() => _AuthRegisterScreenState();
// }

// class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   final _formkey = Key('form');
//   bool isLogin = true;
//   AuthBloc authBloc = AuthBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(),
//         title: SizedBox(
//           height: 40,
//           width: 120,
//           child: SvgPicture.asset(""),
//         ),
//       ),
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Form(
//             key: _formkey,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (!isLogin)
//                     const SizedBox(
//                       height: 28,
//                     ),
//                   if (!isLogin) Text("Enter Your Name"),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   if (!isLogin)
//                     TextFormField(
//                       controller: nameController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter Your Name";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Your Name',
//                         hintText: 'Enter your name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                           borderSide:
//                               BorderSide(color: Colors.blue, width: 2.0),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                           borderSide:
//                               BorderSide(color: Colors.grey, width: 1.0),
//                         ),
//                       ),
//                     ),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   Text("Enter Your Email"),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   TextFormField(
//                     controller: emailController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter Your Email";
//                       } else {
//                         return null;
//                       }
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Your Email',
//                       hintText: 'Enter your Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                         borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                         borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   Text("Enter Your Password"),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   TextFormField(
//                     controller: passwordController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter Your Pass";
//                       } else {
//                         return null;
//                       }
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Your Pass',
//                       hintText: 'Enter your Pass',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                         borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                         borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: double.maxFinite,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text(isLogin ? "Login" : "Register"),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(isLogin
//                           ? "Don't have an account?  "
//                           : "Already have an account?  "),
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             isLogin = !isLogin;
//                           });
//                         },
//                         child: Text(
//                           !isLogin ? "Login" : "Register",
//                           style: const TextStyle(color: Colors.purpleAccent),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Correct form key initialization
  bool isLogin = true;
  AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: SizedBox(
          height: 40,
          width: 120,
          child: SvgPicture.asset(""),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Form(
            key: _formKey, // Correct form key usage
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isLogin)
                    const SizedBox(
                      height: 28,
                    ),
                  if (!isLogin) Text("Enter Your Name"),
                  const SizedBox(
                    height: 12,
                  ),
                  if (!isLogin)
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text("Enter Your Email"),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Your Email',
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text("Enter Your Password"),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Pass";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Your Pass',
                      hintText: 'Enter your Pass',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login or registration
                        }
                      },
                      child: Text(isLogin ? "Login" : "Register"),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isLogin
                          ? "Don't have an account?  "
                          : "Already have an account?  "),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          !isLogin ? "Login" : "Register",
                          style: const TextStyle(color: Colors.purpleAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
