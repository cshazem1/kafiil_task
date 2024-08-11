

import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafiil_task/core/utils/theming/colors.dart';
import 'package:kafiil_task/features/auth/presentation/manger/Dependent/dependent_cubit.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/custom_skills.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/stepper.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/stepper2.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/routers/routes.dart';
import '../../../../../../../core/utils/theming/styles.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../data/models/auth_model/auth_model.dart';
import '../../../../manger/auth_cubit/auth_cubit.dart';
import 'custom_checkBox_favourite.dart';
import 'custom_circle_avatar.dart';
import 'custom_gender.dart';
import 'custom_salary.dart';
import 'fields.dart';

class RegisterCompleteDataBody extends StatefulWidget {
  RegisterCompleteDataBody({
    super.key,
    required this.registerModel,
  });

  bool onClickNext = true;
  final AuthModel registerModel;

  @override
  State<RegisterCompleteDataBody> createState() =>
      _RegisterCompleteDataBodyState();
}

class _RegisterCompleteDataBodyState extends State<RegisterCompleteDataBody> {
  TextEditingController? controllerAbout = TextEditingController();
  TextEditingController? controllerFavorite = TextEditingController();
  int salary = 0;
  DateTime? birthdate;
  int? userType;
  XFile? galleryFile;
  dynamic skills1 = "";
  dynamic skills2 = "";
  String? favorite;
  Set favoriteSelect = {};
  Map<String, bool> favoriteList = {
    "X": false,
    "FaceBook": false,
    "Instagram": false
  };
  bool isLoading = false;
@override
  void initState() {
  BlocProvider.of<DependentCubit>(context).fetchDependent();
  super.initState();
  }


  List<num> skillsListNum=[];
  List<TagsAuth>skillsList=[];

  @override

  @override
  Widget build(BuildContext context) {
    DateTimeFieldPickerPlatform platform = DateTimeFieldPickerPlatform.material;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 82.spMin, right: 20.w),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    onPressed: () {
                      context.pop();
                    },
                    text: "Register",
                    back: true,
                  ),
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
                        onClickNext: !widget.onClickNext,
                        textName: "Register",
                      ),
                      Stepper2(
                        onClickNext: !widget.onClickNext,
                        textName: "Complete Data",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomCircleAvatar(
                    registerModel: widget.registerModel,
                    onTap: (file) async {
                     galleryFile= file;

                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: controllerAbout,
                    onChanged: (p0) {},
                    height: 44.5.h,
                    textName: "About",
                    password: false,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Salary",
                    style: TextStyles.font12ColorGray500500Weight
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomSalary(
                    salary: salary,
                    onTapP: () {
                      if (salary <= 1000) {
                        salary += 10;
                        setState(() {});
                      }
                    },
                    onTapR: () {
                      if (salary < 1000&&salary>0) {
                        salary -= 10;
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Birth Date",
                    style: TextStyles.font12ColorGray500500Weight
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Fields(
                    selectedDate: birthdate,
                    platform: platform,
                    height: 25.h,
                    onChanged: (p0) {
                      setState(() {});
                      birthdate = p0;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Gender(
                    type: userType.toString(),
                    onChanged: (p0) {
                      print(p0);
                      userType = p0 == "Male" ? 0 : 1;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<DependentCubit, DependentState>(
                    builder: (context, state) {
                      if(state is DependentSuccess) {
                        return CustomSkills(
                          onSaved: (p0) {
                            skillsListNum=[];
                            skillsList=p0.toList();
                            skillsList.forEach( (element) {
                              skillsListNum.add(element.id);
                            },);

                          },
                        tags:state.dependenciesModels.data!.tags,

                      );
                      }
                      else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Favourite Social Media",
                    style: TextStyles.font12ColorGray500500Weight
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<DependentCubit, DependentState>(
                    builder: (context, state) {
                      if (state is DependentSuccess) {
                        return SizedBox(
                          height: 86.h,
                          child: ListView.builder(
                            itemCount: state
                                .dependenciesModels.data!.socialMedia!.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 30.h,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CustomCheckBoxFavourite(
                                    favoriteSelect: (favoriteName, isSelect) {
                                      isSelect
                                          ? favoriteSelect.add(favoriteName)
                                          : favoriteSelect.remove(favoriteName);
                                    },
                                    socialMedia: state.dependenciesModels.data!
                                        .socialMedia![index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        print("object");
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Register Success"),

                          ));
                          context.pushReplacement(Routes.loginView);
                        });
                      } else if (state is RegisterFailure) {
                        showAlertDialog(context, state.error);

                        isLoading = false;
                        setState(() {});
                      } else if(state is RegisterLoading){
                        setState(() {
                          isLoading = true;
                        });
                      }
                    },
                    child: CustomButton(
                      text: "Submit",
                      onClick: () async {
                        if(galleryFile!=null) {
                          MultipartFile    imageFile=   await MultipartFile.fromFile(
                            galleryFile!.path,
                            filename: "upload.jpg");

                           widget.registerModel
                               .multipartFile=imageFile;
                        }


                        print(widget.registerModel.galleryFile);
                        DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                        widget.registerModel.favoriteSocialMedia.clear();
                        widget.registerModel.favoriteSocialMedia = [];
                        widget.registerModel
                          ..about = controllerAbout!.text
                          ..salary = salary..galleryFile=galleryFile
                          ..gender = userType..tagsId=skillsListNum
                          ..favoriteSocialMedia.addAll(favoriteSelect)
                          ..birthDate = birthdate != null
                              ? dateFormat.format(birthdate!)
                              : null;
                        var formData =
                        FormData.fromMap(widget.registerModel.toJson());

                        var headers = {
                          'Accept': 'application/json',
                          'Accept-Language': 'ar',
                          'Content-Type': 'multipart/form-data',
                        };

                        BlocProvider.of<AuthCubit>(context)
                            .register(headers: headers, body: formData);
                        BlocProvider
                            .of<AuthCubit>(context)
                            .authModel =
                            widget.registerModel;

                      },
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                ]),
          )),
    );
  }

  showAlertDialog(BuildContext context, String text) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        context.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Icon(Icons.error,size: 40,color: Colors.red,),
      content: Text(text,style: TextStyles.font14black600Weight.copyWith(fontWeight: FontWeight.bold,),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
