import 'package:flutter/material.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/who_am_i/presentation/views/widgets/who_am_i_body.dart';

class WhoAmI extends StatelessWidget {
final  AuthModel authModel;
  const WhoAmI({super.key, required  this.authModel, });
  @override
  Widget build(BuildContext context) {
    return   Scaffold(body: WhoAmIBody(authModel:authModel));
  }
}

