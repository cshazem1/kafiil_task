import 'package:flutter/material.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/auth/presentation/views/register_view/views/widgets/register_complete_data_body.dart';


class RegisterCompleteDataView extends StatelessWidget {
   const RegisterCompleteDataView({super.key,required this.registerModel});
  final AuthModel registerModel;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        resizeToAvoidBottomInset: true,
        body: RegisterCompleteDataBody(registerModel:registerModel,));
  }
}



