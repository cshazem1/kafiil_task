import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/main.dart';

import '../../../../../../../core/utils/assets.dart';
import '../../../../../../../core/utils/theming/colors.dart';

class CustomCircleAvatar extends StatefulWidget {
 final AuthModel registerModel;
final void Function(XFile?) onTap;
  const CustomCircleAvatar({
   required this.onTap,
required this.registerModel,
    super.key, required,
  });
  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  final picker = ImagePicker();
  File? galleryFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 115.h,
            width: 115.w,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.primary900, width: 3.w),
            ),
            child: Container(
              height: 115.h,
              width: 115.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: widget.registerModel.avatar != null
                      ? CachedNetworkImageProvider(widget.registerModel.avatar!)
                      : widget.registerModel.galleryFile == null
                      ? AssetImage('assets/images/cavatar.png')
                      : FileImage(File(widget.registerModel.galleryFile!.path)),
                ),
                color: ColorManager.primary100,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: CircleAvatar(
              backgroundColor: ColorManager.primary900,
              radius: 13.w,
              child: GestureDetector(
                onTap: () {
                  _showPicker(context: context);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);

    XFile? xFilePicked = pickedFile;
    widget.registerModel.avatar=null;
    setState(
      () {

        galleryFile = File(pickedFile!.path);
        widget.registerModel.galleryFile = pickedFile;
        widget.onTap(pickedFile);

      },
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      backgroundColor: ColorManager.gray200,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
