import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  // final void Function(PickedFile pickedImage)imagePickFn;
  //
  // const UserImagePicker({Key? key, required this.imagePickFn}) : super(key: key);
  //

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
   PickedFile? _pickedImage;

  Future<void>_takePicture() async {
    final ImagePicker picker = ImagePicker();
    final pickedImageFile = await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    // widget.imagePickFn(pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            CircleAvatar(
             // backgroundColor: Colors.grey,
              backgroundImage:_pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
              radius: 50,
            ),
            Positioned(
              right: -4,
              bottom: -1,
              child:IconButton(
                  onPressed: _takePicture,
                  icon:Icon(
                    Icons.photo_camera_back_sharp,
                    size: 30,
                  ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
