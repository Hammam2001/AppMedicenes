import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/features/langouge/langouge.dart';
import '../../core/app_text_form/app_text-form_filed.dart';
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
        title:  Center(
          child: Text(
            'medicineWarehouse'.tr,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
          ),
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
                    label: 'phone'.tr,
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
                    label: 'password'.tr,
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
                        }else{
                          ScaffoldMessenger.of(context)
                               .showSnackBar(const SnackBar(
                             content: Text('The number or password is wrong'),
                             backgroundColor: Colors.red,
                          ));
                        }
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      child:  Text(
                        'login'.tr,
                        style: const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                       Text(
                         'donHaveAnAccount?'.tr,
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                          },
                          child:  Text(
                            'register'.tr,
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
