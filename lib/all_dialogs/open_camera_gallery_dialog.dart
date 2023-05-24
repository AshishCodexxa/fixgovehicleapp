
import 'dart:io';
import 'package:fixgovehicleapp/common_file/common_color.dart';
import 'package:fixgovehicleapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class CameraGalleryDialog extends StatefulWidget {
  const CameraGalleryDialog({Key? key}) : super(key: key);

  @override
  State<CameraGalleryDialog> createState() => _CameraGalleryDialogState();
}

class _CameraGalleryDialogState extends State<CameraGalleryDialog> {


  File imageFile = File("");



  Future<File?> _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    return imageFile;
  }


  Future<File?> _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }

    return imageFile;

  }




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03,
            left: SizeConfig.screenWidth*0.07,
            right: SizeConfig.screenWidth*0.07),
            child: GestureDetector(
              onTap: () async {

                _getFromCamera().then((value){
                  if(value == null) return;
                  print("value $value");
                  Navigator.of(context).pop(value);
                });

              },
              child: Container(
                height: SizeConfig.screenHeight*0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Camera",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto_Bold',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockSizeHorizontal*5.0
                  ),),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.05,
                left: SizeConfig.screenWidth*0.07,
                right: SizeConfig.screenWidth*0.07),
            child: GestureDetector(

              onTap: (){
                _getFromGallery().then((value){
                  if(value == null) return;
                  print("value $value");
                  Navigator.of(context).pop(value);
                });
              },

              child: Container(
                height: SizeConfig.screenHeight*0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Gallery",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockSizeHorizontal*5.0
                    ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

