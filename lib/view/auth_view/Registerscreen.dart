import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:salla/model/auth/auth_repo.dart';
import 'package:salla/shared/services/service_locator.dart';
import 'package:salla/shared/utils/constants.dart';
import 'package:salla/shared/utils/widgets/navigation.dart';
import 'package:salla/view/layout/layout_screen.dart';
import 'package:salla/view_model/auth/manager/login_cubit.dart';
import 'package:salla/view/auth_view/shop_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepository>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
          if (state.registerModel!.status!) {
            token = state.registerModel!.data!.token!;
            NavigationAndFinish(context, LayoutView());
          }  else{
            print(state.registerModel!.message);
          }
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'register',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'register now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text('email'),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email can not be empity';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            label: Text('name'),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'name can not be empity';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            label: Text('phone'),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'phone can not be empity';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: cubit.passVisibility ? false : true,
                          decoration: InputDecoration(
                            label: const Text('password'),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.cyan,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.passVisibility
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.cyan,
                              ),
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password can not be empity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.cyan,
                              ),
                              child: Center(
                                child: Text(
                                  'register',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' have an account ?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopLogin()),
                                    (route) => false);
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
