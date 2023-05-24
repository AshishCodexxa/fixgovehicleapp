
import 'dart:io';
import 'package:fixgovehicleapp/all_dialogs/open_camera_gallery_dialog.dart';
import 'package:fixgovehicleapp/all_dialogs/register_success_dialog.dart';
import 'package:fixgovehicleapp/common_file/common_color.dart';
import 'package:fixgovehicleapp/common_file/size_config.dart';
import 'package:fixgovehicleapp/login_registration/sign_up_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class VehicleOwnerRegistration extends StatefulWidget {
  const VehicleOwnerRegistration({Key? key}) : super(key: key);

  @override
  State<VehicleOwnerRegistration> createState() => _VehicleOwnerRegistrationState();
}

class _VehicleOwnerRegistrationState extends State<VehicleOwnerRegistration> {


  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  final _userNameFocus = FocusNode();
  final _emailIdFocus = FocusNode();

  int phoneNumberCount = 1;

  File? images;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Container(
            color: CommonColor.WHITE_COLOR,
            height: SizeConfig.safeUsedHeight * .88,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                getAllRegisterLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget getTopText(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.05, left: parentWidth*0.035, right: parentWidth*0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new,
                  color: Colors.transparent,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Registration",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*5.5,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }

  Widget getAllRegisterLayout(double parentHeight, double parentWidth){
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(left: parentWidth*0.1,
          top: parentHeight*0.03),
          child: Row(
            children: [

              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  images != null ?
                  Container(
                    height: parentHeight*0.12,
                    width: parentWidth*0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(2, 3)),
                      ],
                      image: DecorationImage(image: FileImage(File(images!.path)),
                        fit: BoxFit.fill
                      )
                    ),
                   )
                  : Container(
                    height: parentHeight*0.12,
                    width: parentWidth*0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(2, 3)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: parentHeight*0.017),
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet<File>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            elevation: 10,
                            isScrollControlled: true,
                            isDismissible: true,
                            builder: (BuildContext bc) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: const CameraGalleryDialog(),
                              );
                            }).then((value) {
                          if(value == null) {
                            return;
                          }
                          setState(() {
                            print("imagesss ${File(value.path)} ");

                            images = File(value.path);
                            print("image $images");
                          });

                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Image(image: AssetImage("assets/images/camera.png"),
                          color: Colors.black,),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: parentWidth*0.1),
                child: Text("Upload your photo",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400,
                      color: CommonColor.BLACK_COLOR
                  ),),
              ),

            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.05,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.11,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 3)),
              ],
            ),
            child:  Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: parentWidth*0.03,
                    right: parentWidth*0.03,
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    focusNode: _userNameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person,
                        color: Colors.black,),
                      label: RichText(
                        text: TextSpan(
                            text: 'User Name',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            ),
                            children: [
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      labelStyle: TextStyle(
                          color: CommonColor.REGISTER_HINT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          fontFamily: 'Roboto_Regular'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.04, top: parentHeight*0.01),
                      child: Text("( Write User Full Name )",
                        style: TextStyle(
                            color: CommonColor.REGISTER_HINT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 6)),
              ],
            ),
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: emailController,
                focusNode: _emailIdFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Email Id',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),


        for(int i = 1; i <= phoneNumberCount; i++)

          Padding(
            padding: EdgeInsets.only(
              top: parentHeight*0.02,
              left: parentWidth*0.03,
              right: parentWidth*0.03,
            ),
            child: Container(
              height: parentHeight*0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(2, 6)),
                ],
              ),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: parentWidth*0.03,
                          ),
                          child: TextFormField(
                            // controller: companyAddressController,
                            // focusNode: _companyAddressFocus,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              prefixIcon: const Icon(Icons.phone_android_outlined, color: Colors.black,),
                              label: RichText(
                                text: TextSpan(
                                    text: 'Phone No. $i',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                              labelStyle: TextStyle(
                                  color: CommonColor.REGISTER_HINT_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                  fontFamily: 'Roboto_Regular'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: parentWidth*0.03),
                        child: Container(
                          width: parentWidth*0.16,
                          height: parentHeight*0.067,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            // border: Border(
                            //   bottom: BorderSide(width: 0.9, color: CommonColor.REGISTER_HINT_COLOR,),
                            // ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: CommonColor.REGISTER_HINT_COLOR,
                                height: parentHeight*0.06,
                                width: parentWidth*0.001,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: parentWidth*0.03),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:i == 1 ? GestureDetector(
                                      onTap: (){

                                        if(phoneNumberCount != 3){
                                          phoneNumberCount++;
                                          if(mounted){
                                            setState(() {

                                            });
                                          }
                                        }

                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Icon(Icons.add_circle_outline_rounded,
                                          color: Colors.black,),
                                      ),
                                    )
                                        : GestureDetector(
                                          onTap: (){
                                            phoneNumberCount--;
                                            if(mounted){
                                              setState(() {

                                              });
                                            }
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Icon(Icons.remove_circle_outline_rounded,
                                      color: Colors.black,),
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                        left: parentWidth*0.03,
                        right: parentWidth*0.03),
                    child: Container(
                      height: SizeConfig.screenWidth*0.003,
                      color: Colors.black38,
                      child: Row(
                        children: const [
                          Text("hii",
                            style: TextStyle(
                                color: Colors.transparent
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),



        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.07,
            left: SizeConfig.screenWidth*0.05,
            right: SizeConfig.screenWidth*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return const AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(seconds: 2),
                          child: RegisterSuccessDialog());
                    },
                  );
                },
                child: Container(
                  height: SizeConfig.screenHeight*0.057,
                  width: SizeConfig.screenWidth*0.75,
                  decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Register",
                      style: TextStyle(
                          color: CommonColor.WHITE_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*5.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Medium'
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01,
                  top: SizeConfig.screenHeight*0.02),
              child: GestureDetector(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpDialog()));

                },
                child: Container(
                  color: Colors.transparent,
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an Account? ",
                          style: TextStyle(
                              color: CommonColor.BLACK_COLOR,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto-Regular',
                              fontSize: 13),
                          children: [
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto-Regular',
                                  fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  decoration: TextDecoration.underline,)),
                          ])),
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }

}
