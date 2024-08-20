import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_task/core/utils/routers/routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/auth/data/models/auth_model/LoginModels.dart';
import '../widgets/custom_button.dart';

Future<void> showCustomDialog(BuildContext context, LoginModels data,VoidCallback call) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Welcome Again',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: data.data!.avatar!,
                  placeholder: (context, url) => Shimmer(
                      gradient: const LinearGradient(
                          colors: [Colors.white70, Colors.blue]),
                      child: Container(
                        color: Colors.black,
                      )),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "${data.data!.firstName} ${data.data!.lastName}",
                style: const TextStyle(fontSize: 30),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: CustomButton(
                      text: "Forget Me",
                      onClick:call,
                      buttonColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: CustomButton(
                      text: "Login ->",
                      onClick: () {
                        context.go(Routes.navBottomBarView, extra: data.data);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
