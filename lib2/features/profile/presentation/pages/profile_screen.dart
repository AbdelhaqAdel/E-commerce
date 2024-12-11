import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/functions/log_out.dart';
import '../../../home/presentation/manager/home_cubit.dart';

class SettingsScreen extends StatelessWidget {
   const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          var nameController=TextEditingController();
          var emailController=TextEditingController();
          var phoneController=TextEditingController();
          ShopCubit cubit=ShopCubit.get(context);
          nameController.text=cubit.userData!.data!.name!;
          emailController.text=cubit.userData!.data!.email!;
          phoneController.text=cubit.userData!.data!.phone!;

          return Scaffold(
            appBar: AppBar(title: const Text('User Settings'),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType:TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name can\'t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText:'User Name',
                      prefixIcon:const Icon(Icons.person,),
                      suffixIcon:  IconButton(onPressed: (){
                      },
                        icon: const Icon(Icons.email_outlined,),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType:TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email can\'t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText:'Email Address',
                      prefixIcon:Icon(Icons.email,),
                      suffixIcon: IconButton(onPressed: (){
                      },
                        icon: Icon(Icons.email_outlined,),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType:TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'phone can\'t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText:'Phone',
                      prefixIcon:const Icon(Icons.person,),
                      suffixIcon: IconButton(onPressed: (){
                      },
                        icon: const Icon(Icons.email_outlined,),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
            
                      cubit.updateUser(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        token: AppConstants.kToken,
                      );
            
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Container(
                      width: double.infinity,
                      height: 55,
                      color: Colors.blue,
                      child: TextButton(onPressed:(){
            
                        logOut(context);
                      }, child: const Text('Logout',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      )),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
            
                ],
              ),
            ),
          );
        });
  }
}
