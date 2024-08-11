import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_task/core/utils/theming/colors.dart';
import 'package:kafiil_task/core/widgets/custom_text_field.dart';
import 'package:kafiil_task/features/auth/presentation/manger/Dependent/dependent_cubit.dart';
import 'package:kafiil_task/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/stepper.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/stepper2.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/user_type_widget.dart';

import '../../../../../../../core/utils/routers/routes.dart';
import '../../../../../../../core/utils/theming/styles.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../main.dart';
import '../../../../../data/models/auth_model/auth_model.dart';

class RegisterBody extends StatefulWidget {
  RegisterBody({
    super.key,
  });
  bool onClickNext = true;
  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;

final GlobalKey<FormState> globalKey2 = GlobalKey();
bool validation = false;

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController? controllerEmail = TextEditingController();

  TextEditingController? controllerFirstName = TextEditingController();
  TextEditingController? controllerLastName = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  TextEditingController? controllerConfirmPassword = TextEditingController();
  String type = "";
  AuthModel registerModel = AuthModel();
  @override
  void initState() {
    BlocProvider.of<DependentCubit>(context).fetchDependent();
    super.initState();
  }

  int? value;

  @override
  Widget build(BuildContext context) {
    registerModel =
        BlocProvider.of<AuthCubit>(context).authModel ?? registerModel;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 82.spMin, right: 20.w),
        child: Form(
          key: globalKey2,
          autovalidateMode: autoValidateMode,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  onPressed: () {
                    context.pop();
                  },
                  text: "Register",
                  back: true,
                ),
                validation
                    ? SizedBox(
                        height: 26.h,
                      )
                    : SizedBox(
                        height: 32.h,
                      ),
                validation
                    ? Container(
                        height: 32.h,
                        decoration: BoxDecoration(
                            color: ColorManager.red,
                            borderRadius: BorderRadius.circular(8.h)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 19.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/svg/Info.svg"),
                              Text(
                                "Fill the required fields",
                                style: TextStyles.font12secondRed500Weight,
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 52.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.w,
                      height: 2.h,
                      color: ColorManager.primary900,
                    ),
                    Stepper1(
                      onClickNext: widget.onClickNext,
                      textName: "Register",
                    ),
                    Stepper2(
                      onClickNext: widget.onClickNext,
                      textName: "Complete Data",
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: CustomTextField(
                      controller: controllerFirstName,
                      onChanged: (date) {},
                      validation: false,
                      height: 16.h,
                      textName: "First Name",
                      password: false,
                    )),
                    SizedBox(
                      width: 8.w,
                    ),
                    Flexible(
                        child: CustomTextField(
                      controller: controllerLastName,
                      onChanged: (p0) {},
                      validation: false,
                      height: 16.h,
                      textName: "Last Name",
                      password: false,
                    )),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextField(
                  controller: controllerEmail,
                  onChanged: (p0) {},
                  validation: false,
                  textName: "Email Address",
                  password: false,
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controllerPassword,
                  onChanged: (p0) {},
                  validation: false,
                  textName: "Password",
                  password: true,
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controllerConfirmPassword,
                  onChanged: (p0) {},
                  validation: false,
                  textName: "Confirm Password",
                  password: true,
                  height: 16.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                UserTypeWidgets(
                  onValueChange: (code) {
                    value = code;
                  },
                  type: type.toLowerCase(),
                  onChangedName: (p0) {
                    type = p0!;
                    setState(() {});
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: 160.w,
                        child: CustomButton(
                          text: "Next",
                          onClick: () {
                            print(type);
                            if (globalKey2.currentState!.validate()) {
                              {
                                setState(() {
                                  validation = false;
                                });
                           /*     if (controllerPassword!.text ==
                                        controllerConfirmPassword!.text &&
                                    controllerPassword != null &&
                                    controllerPassword!.text.isNotEmpty) */

                                {
                                  registerModel
                                    ..type = UserType(code: value)
                                    ..password = controllerPassword!.text
                                    ..lastName = controllerLastName!.text
                                    ..firstName = controllerFirstName!.text
                                    ..email = controllerEmail!.text
                                    ..confirmPassword =
                                        controllerConfirmPassword!.text
                                    ..userType = type;

                                  context.push(Routes.registerCompleteDataView,
                                      extra: registerModel);
                                }/* else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: ColorManager.primary900,
                                    content: const Text(
                                      "Passowrd must be same",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ));
                                }*/
                              }
                            } else {
                              autoValidateMode = AutovalidateMode.always;

                              setState(() {
                                validation = true;
                              });
                            }
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
