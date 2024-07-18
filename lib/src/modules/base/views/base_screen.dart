// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:pizza_app_admin/src/modules/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:user_repository/user_repository.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  
  const BaseScreen({required this.child, super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: kToolbarHeight,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => context.go('/home'),
                        child: Text(
                          'Pizza Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () => context.go('/create'),
                        child: Text(
                          'Create Pizza',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey
                              // fontSize: 17
                              ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // context.read<SignInBloc>().add(SignOutRequired());
                      FirebaseUserRepo().logOut();
                      html.window.location.reload();
                    },
                    child: Row(
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(CupertinoIcons.arrow_right_to_line)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'dart:html' as html;

// import '../../auth/blocs/sign_in_bloc/sign_in_bloc.dart';

// class BaseScreen extends StatefulWidget {
//   final Widget child;
//   const BaseScreen(this.child, {super.key});

//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }

// class _BaseScreenState extends State<BaseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SignInBloc, SignInState>(
//       listener: (context, state) {
//         if(state is SignOutSuccess) {
//           html.window.location.reload();
//         }
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: kToolbarHeight,
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             context.go('/home');
//                           },
//                           child: const Text(
//                             'Pizza Admin',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 30),
//                         InkWell(
//                           onTap: () {
//                             context.go('/create');
//                           },
//                           child: const Text(
//                             'Create Pizza',
//                             style: TextStyle(
//                               // fontWeight: FontWeight.w600,
//                               color: Colors.grey
//                               // fontSize: 20
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     InkWell(
//                       onTap: () {
//                         context.read<SignInBloc>().add(SignOutRequired());
//                       },
//                       child: const Row(
//                         children: [
//                           Text(
//                             'Logout',
//                             style: TextStyle(
//                             ),
//                           ),
//                           SizedBox(width: 5,),
//                           Icon(
//                             CupertinoIcons.arrow_right_to_line
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: widget.child
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }