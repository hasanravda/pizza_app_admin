// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_repository/pizza_repository.dart';

import '../../../components/my_text_field.dart';

class CreatePizzaScreen extends StatefulWidget {
  const CreatePizzaScreen({super.key});

  @override
  State<CreatePizzaScreen> createState() => _CreatePizzaScreenState();
}

class _CreatePizzaScreenState extends State<CreatePizzaScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String? _errorMsg;
  late Pizza pizza;

  @override
  void initState() {
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create a new Pizza',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  
                },
                child: Ink(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.cloud_upload,
                        size: 60,
                      ),
                      Text("Upload an image",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 400,
                        child: MyTextField(
                          controller: emailController,
                          hintText: 'Name',
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          errorMsg: _errorMsg,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 400,
                        child: MyTextField(
                          controller: emailController,
                          hintText: 'Description',
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          errorMsg: _errorMsg,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 400,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                controller: emailController,
                                hintText: 'Price',
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                errorMsg: _errorMsg,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please fill in this field';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: MyTextField(
                                controller: emailController,
                                hintText: 'Discount',
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                errorMsg: _errorMsg,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please fill in this field';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Is Veg'),
                          Checkbox(
                            value: false,
                            onChanged:(value) { },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('Is spicy'),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2
                                  ),
                                  color: Colors.green
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2
                                  ),
                                  color: Colors.green
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2
                                  ),
                                  color: Colors.green
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}