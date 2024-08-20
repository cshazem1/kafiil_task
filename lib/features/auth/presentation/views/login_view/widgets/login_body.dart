import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_task/core/utils/assets.dart';
import 'package:kafiil_task/core/utils/routers/app_routes.dart';
import 'package:kafiil_task/core/utils/theming/colors.dart';
import 'package:kafiil_task/core/utils/theming/styles.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/LoginModels.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:kafiil_task/features/auth/presentation/views/login_view/login_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/methods.dart';
import '../../../../../../core/utils/routers/routes.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../main.dart';
import 'login_helper.dart';

class LoginBody extends StatefulWidget {
  bool isRemember = false;

   LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  bool isLoading =false;
  String? tokn1;
  @override
  void initState() {

    getToken();
    print("object");


    super.initState();
  }

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 82.spMin, right: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  onPressed: () => SystemNavigator.pop(),
                  text: "Account Login",
                  back: true,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Center(
                  child: SvgPicture.asset(
                    width: 225.w,
                    height: 225.h,
                    fit: BoxFit.fill,
                    AssetsData.loginImage,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  controller: emailController,
                  onChanged: (p0) {},
                  textName: "Email Address",
                  password: false,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: passwordController,
                  onChanged: (p0) {},
                  textName: "Password",
                  password: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                LoginHelper(
onClickCheckBox: widget.isRemember,
                  onChanged: (p0) {
  setState(() {

  });
                    widget.isRemember = p0!;
                    print(widget.isRemember);
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) async {
                    log(state.toString());
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.error),
                      ));
                      isLoading = false;
                      setState(() {});
                    } else if (state is LoginSuccess) {
                      if (widget.isRemember) {
                        storeToken(state.loginModels.accessToken!);
                        print("sdfsfsf${state.loginModels.accessToken!}");
                      }

                      isLoading = false;
                      setState(() {});
                      context.go(Routes.navBottomBarView,
                          extra: state.loginModels.data);
                    } else if (state is LoginLoading) {
                      isLoading = true;
                      setState(() {});
                    } else if (state is RegisterFailure) {
                      print(state.error);
                    } else if (state is WhoAmIFailure) {
                      isLoading = false;
                      setState(() {});
                    } else if (state is WhoAmISuccess) {

                      context.go(Routes.navBottomBarView, extra: state.loginModels.data);

                    }
                  },
                  child: Builder(
                    builder: (context) {
                      return CustomButton(
                        onClick: () {
                          if (globalKey.currentState!.validate()) {
                            {
                              print("${emailController!.text}: : : ${passwordController!.text}");
BlocProvider.of<AuthCubit>(context).login(

                                  email: emailController!.text,
                                  password: passwordController!.text);
                            }
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        text: "Login",
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account ?",
                      style: TextStyles.font16Color600gray600Weight,
                    ),
                    GestureDetector(
                        onTap: () {
                          context.push(Routes.registerView);
                        },
                        child: Text(
                          " Register",
                          style: TextStyles.font14Color900Primary600Weight,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> storeToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  storeRemove() async {
    await storage.delete(key: "access_token");
  }

  void getToken() async {
    String? token = await storage.read(key: 'access_token');
    token != null
        ? BlocProvider.of<AuthCubit>(context).whoAmI(token: token)
        : print("wow");
  }

}
