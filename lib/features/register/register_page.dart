// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/core/http_remote/http_remote.dart';

import '../../core/constant.dart';
import '../../core/app_text-form_filed.dart';
import '../add_medicine/admin.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final TextEditingController phoneController =TextEditingController();
 final TextEditingController passwordController =TextEditingController();
 final TextEditingController firstNameController =TextEditingController();
final  TextEditingController lastNameController=TextEditingController();
final  TextEditingController confirmPasswordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFiledApp(
                  controller: firstNameController,
                  type: TextInputType.name,
                  label: 'First Name',
                  obscurePassword: false,
                  prefix: Icons.abc,
                  validate: (String value){
                    if(value.isEmpty){
                      return 'first name must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: lastNameController,
                  type: TextInputType.name,
                  label: 'Last Name',
                  obscurePassword: false,
                  prefix: Icons.abc,
                  validate: (String value){
                    if(value.isEmpty){
                      return 'last name must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: phoneController,
                  type: TextInputType.name,
                  label: 'Phone',
                  obscurePassword: false,
                  prefix: Icons.numbers,
                  validate: (String value){
                    if(value.isEmpty){
                      return 'phone must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock,
                  label: 'Password',
                  obscurePassword: true,
                  suffix: Icons.remove_red_eye_sharp,
                  validate: (String value){
                    if(value.isEmpty){
                      return 'password must be not empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () async {
                      if(formKey.currentState!.validate()) {
                        bool res = await HttpRemote.register(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            context: context
                        );
                        if (res) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMedicine()));
                        }
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
