import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../data/auth_repo/auth_repo.dart';
import '../../../../core/services/cache_services.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/navigation.dart';
import '../../../layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register.dart';
import '../manager/login_cubit.dart';

class LoginScreen extends StatelessWidget {
 
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(getIt.get<AuthRepository>()),
      child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state is LoginSuccessState){
              if(state.loginModel.status!){
                  AppConstants.kToken = state.loginModel.data!.token!;
                  CacheHelper.saveData(key:'token', value:AppConstants.kToken);
                  NavigationAndFinish(context, LayoutView());
              }
              else{
                print(state.loginModel.message);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Login now to browse a hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            SizedBox(
                              height: 40,
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
                                prefixIcon:const Icon(Icons.email_outlined,),
                                suffixIcon:IconButton(onPressed: (){},
                                  icon: const Icon(Icons.email_outlined,),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType:TextInputType.emailAddress,
                              obscureText: LoginCubit.get(context).passVisibility,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password can\'t be empty';
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                labelText:'Password',
                                prefixIcon:Icon(LoginCubit.get(context).suffix,),
                                suffixIcon:IconButton(onPressed: (){
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                  icon: Icon(LoginCubit.get(context).suffix,),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).login(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'login',
                                isUPpercase: true,
                              ),
                              fallback: (context) =>
                                  const Center(child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                ),
                                defaultTextButton(
                                    function: () {
                                      NavigateTo(context, RegisterScreen());
                                    },
                                    text: 'register now'),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
