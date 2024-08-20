import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/user_type_widget.dart';

import '../../../../../../../../core/utils/assets.dart';
import '../../../../../../../../core/utils/theming/styles.dart';
import '../../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../../../main.dart';
import '../../../../auth/presentation/manger/Dependent/dependent_cubit.dart';
import '../../../../auth/presentation/views/register_view/views/widgets/custom_checkBox_favourite.dart';
import '../../../../auth/presentation/views/register_view/views/widgets/custom_circle_avatar.dart';
import '../../../../auth/presentation/views/register_view/views/widgets/custom_gender.dart';
import '../../../../auth/presentation/views/register_view/views/widgets/custom_skills.dart';
import '../../../../auth/presentation/views/register_view/views/widgets/fields.dart';

class WhoAmIBody extends StatefulWidget {
  final AuthModel authModel;

  WhoAmIBody({
    super.key,
    required this.authModel,
  });

  @override
  State<WhoAmIBody> createState() => _WhoAmIBodyState();
}

class _WhoAmIBodyState extends State<WhoAmIBody> {
  @override
  void initState() {
    BlocProvider.of<DependentCubit>(context).fetchDependent();

    super.initState();
  }

  XFile? galleryFile;

  @override
  Widget build(BuildContext context) {
    widget.authModel.favoriteSocialMedia;
    log(widget.authModel.birthDate.toString());
    DateTimeFieldPickerPlatform platform = DateTimeFieldPickerPlatform.material;
    Set favoriteSelect = {};

    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 82.spMin, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              text: "Who Am I",
              onPressed: () {},
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomCircleAvatar(
              registerModel: widget.authModel,
              onTap: (file) async {
                galleryFile = file;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: CustomTextField(
                  onChanged: (p0) {
                    widget.authModel.firstName = p0;
                  },
                  initialValue: widget.authModel.firstName,
                  height: 16.h,
                  textName: "First Name",
                  password: false,
                )),
                SizedBox(
                  width: 8.w,
                ),
                Flexible(
                    child: CustomTextField(
                  onChanged: (p0) {
                    widget.authModel.lastName = p0;
                  },
                  initialValue: widget.authModel.lastName,
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
              onChanged: (p0) {
                widget.authModel.email = p0;
              },
              initialValue: widget.authModel.email,
              textName: "Email Address",
              password: false,
              height: 16.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              onChanged: (p0) {
                widget.authModel.password = p0;
              },
              initialValue: widget.authModel.password,
              textName: "Password",
              password: true,
              height: 16.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            UserTypeWidgets(
              onValueChange: (p0) {},
              type: widget.authModel.type!.name!.toLowerCase(),
              onChangedName: (p0) {
                print(p0);
                widget.authModel.type!.name = p0;
                setState(() {});
              },
            ),
            CustomTextField(
              onChanged: (p0) {
                widget.authModel.about = p0;
              },
              initialValue: widget.authModel.about ?? "",
              height: 44.5.h,
              textName: "About",
              password: false,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              onChanged: (p0) {
                widget.authModel.salary = int.parse(p0);
              },
              initialValue: "SAR ${widget.authModel.salary ?? 1000}",
              textName: "Salary",
              password: false,
              height: 16.h,
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
              onChanged: (p0) {
                widget.authModel.birthDate = p0.toString();
                setState(() {
                  print(widget.authModel.birthDate);
                });
              },
              platform: platform,
              height: 25.h,
              selectedDate: DateTime.parse(widget.authModel.birthDate!),
            ),
            SizedBox(
              height: 16.h,
            ),
            Gender(
              type: widget.authModel.gender.toString(),
              onChanged: (p0) {
                widget.authModel.gender = p0 == "Male" ? 0 : 1;
                print(p0);
                setState(() {});
                print("lolo");
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder<DependentCubit, DependentState>(
              builder: (context, state) {
                if (state is DependentSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSkills(
                        tagsSelected: widget.authModel.tags,
                        tags: state.dependenciesModels.data!.tags,
                        onSaved: (p0) {},
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Favourite Social Media",
                        style: TextStyles.font12ColorGray500500Weight
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                          height: 86.h,
                          child: SizedBox(
                            height: 86.h,
                            child: ListView.builder(
                              itemCount: state
                                  .dependenciesModels.data!.socialMedia!.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 30.h,
                                  child: CustomCheckBoxFavourite(
                                    select:
                                        widget.authModel.favoriteSocialMedia,
                                    favoriteSelect: (favoriteName, isSelect) {
                                      isSelect
                                          ? favoriteSelect.add(favoriteName)
                                          : favoriteSelect.remove(favoriteName);
                                    },
                                    socialMedia: state.dependenciesModels.data!
                                        .socialMedia![index],
                                  ),
                                );
                              },
                            ),
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  );
                } else if (state is DependentFailure) {
                  return Text(state.message);
                } else
                  return const CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
