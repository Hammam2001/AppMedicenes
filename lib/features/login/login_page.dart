import 'package:flutter/material.dart';
import '../../core/app_text-form_filed.dart';
import '../../core/http_remote/http_remote.dart';
import '../add_medicine/admin.dart';
import '../register/register_page.dart';

class Login extends StatelessWidget {
   Login({
    super.key,
  });

 final  TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Medicine Warehouse',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key:formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/image/pharmacy.jpeg'),
                  const SizedBox(
                    height: 50,
                  ),
                   TextFiledApp(
                    controller: phoneController,
                    type: TextInputType.phone,
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
                    label: 'Password',
                    obscurePassword: true,
                    prefix: Icons.lock,
                    suffix: Icons.remove_red_eye_sharp,
                     validate: (String value){
                       if(value.isEmpty){
                         return 'password must be not empty';
                       }
                       return null;
                     },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: MaterialButton(
                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                        bool res = (await HttpRemote.login(phone: phoneController.text,
                        password:passwordController.text ,
                        context: context)) ;
                        if(res){
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddMedicine(),));
                        }
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                          },
                          child:  Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 18, color: Theme.of(context).primaryColor,),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
