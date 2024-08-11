import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/features/auth/presentation/manger/Dependent/dependent_cubit.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/radio_label.dart';

import '../../../../../../../core/utils/theming/styles.dart';


class UserTypeWidgets extends StatefulWidget {
  String? type;
  UserTypeWidgets({super.key,required this.onChangedName,required this.onValueChange,this.type});
  @override
  State<UserTypeWidgets> createState() => _UserTypeWidgetsState();
 void Function(String?) onChangedName;
  void Function(int?) onValueChange;

}
class _UserTypeWidgetsState extends State<UserTypeWidgets> {

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "User Type",
            style: TextStyles.font12ColorGray500500Weight
                .copyWith(fontSize: 12.sp),
          ),
          BlocBuilder<DependentCubit, DependentState>(
            builder: (context, state) {
          if(state is DependentSuccess) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 8.h,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.dependenciesModels.data!.types!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                    return  SizedBox(

                      child: LinkedLabelRadio(

                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            value: state.dependenciesModels.data!.types![index].label!,
                            groupValue: widget.type!,
                            onChanged: (value) {
                              widget.onChangedName(value);
                              widget.onValueChange( state.dependenciesModels.data!.types![index].value!);
                              print( state.dependenciesModels.data!.types![index].value!);
                            },
                        ),
                    );

                    },

                    ),
                  ),
                ],
              ),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
            },
          ),
        ],
      ),
    );
  }
}