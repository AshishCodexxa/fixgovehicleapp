import 'dart:io';

import 'package:fixgovehicleapp/all_dialogs/open_camera_gallery_dialog.dart';
import 'package:fixgovehicleapp/common_file/common_color.dart';
import 'package:fixgovehicleapp/common_file/size_config.dart';
import 'package:flutter/material.dart';



class VehicleRegistrationScreen extends StatefulWidget {
  const VehicleRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationScreen> createState() => _VehicleRegistrationScreenState();
}

class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {


  File? images;

  bool showVehicleType = false;
  int vehicleType = 0;
  String vehicleName = "";

  int tyreTypes = 0;
  String tyreName = "";
  int trailerTyreTypes = 0;
  String trailerTyreName = "";
  int trailerType = 0;

  bool showAllTyresType = false;

  bool showTrailerSubType = false;

  String trailerSubType = "";


  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController chassisNoController = TextEditingController();
  TextEditingController engineNoController = TextEditingController();
  TextEditingController rlwKgsController = TextEditingController();
  TextEditingController vehicleLengthController = TextEditingController();

  final _vehicleNoFocus = FocusNode();
  final _chassisNoFocus = FocusNode();
  final _engineNoFocus = FocusNode();


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
      padding: EdgeInsets.only(top: parentHeight * 0.05,
          left: parentWidth * 0.035,
          right: parentWidth * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new,
                  color: Colors.transparent,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Vehicle Registration",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.5,
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
                child: Text("Upload Vehicle photo",
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
          padding: EdgeInsets.only(left: parentWidth*0.03,
              right: parentWidth*0.03,
              top: parentHeight*0.02),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: const Offset(3, 3)),
              ],
            ),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.only(left: parentHeight * 0.02,
                      top: parentHeight*0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Vehicle Owner Details",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*5.0,
                            fontFamily: "Roboto_Medium",
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.011),
                  child: TextFormField(
                    controller: vehicleNoController,
                    focusNode: _vehicleNoFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Vehicle No.*",
                        style: TextStyle(
                          color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),),
                      contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black12,
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

                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.012),
                  child: TextFormField(
                    controller: chassisNoController,
                    focusNode: _chassisNoFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Chassis No.*",
                        style: TextStyle(
                          color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),),
                      contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black12,
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

                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.01),
                  child: TextFormField(
                    controller: engineNoController,
                    focusNode: _engineNoFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Engine No.*",
                        style: TextStyle(
                          color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),),
                      contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black12,
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
                
                ////////////////////////////////////////////////////////////

                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.05,
                      top: parentHeight*0.02),
                  child: GestureDetector(
                    onDoubleTap: (){},
                    onTap: (){
                      showVehicleType = !showVehicleType;
                      if(mounted){
                        setState(() {

                        });
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: vehicleType == 0 ? 'Type of Vehicle' : "$vehicleName ${vehicleType == 3 ? trailerSubType : ""}",
                              style: TextStyle(
                                color: vehicleType == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0)
                                    : Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: parentWidth*0.05),
                            child: const Icon(Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Visibility(
                  visible: showVehicleType,
                  child: Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.02,),
                    child: Column(
                      children: [

                        Padding(
                          padding:  EdgeInsets.only(left: parentWidth*0.05),
                          child: GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              showVehicleType = !showVehicleType;
                              vehicleType = 1;
                              showTrailerSubType = false;
                              if(mounted){
                                setState(() {
                                  vehicleName = "Open body";
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [

                                  Container(
                                    height: parentHeight*0.03,
                                    width: parentWidth*0.06,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                        color:vehicleType == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                    ),
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(left: parentWidth*0.03),
                                    child: Text("Open body",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                          fontFamily: 'Roboto_Regular'
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                              left: parentWidth*0.03,
                              right: parentWidth*0.03),
                          child: Container(
                            height: SizeConfig.screenWidth*0.003,
                            color: Colors.black12,
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
                        Padding(
                          padding:  EdgeInsets.only(
                              left: parentWidth*0.05,
                              top: parentHeight*0.01),
                          child: GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              showVehicleType = !showVehicleType;
                              vehicleType = 2;
                              showTrailerSubType = false;
                              if(mounted){
                                setState(() {
                                  vehicleName = "Closed body";
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [

                                  Container(
                                    height: parentHeight*0.03,
                                    width: parentWidth*0.06,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                        color:vehicleType == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                            : CommonColor.WHITE_COLOR
                                    ),
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(left: parentWidth*0.03),
                                    child: Text("Closed body",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                          fontFamily: 'Roboto_Regular'
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                              left: parentWidth*0.03,
                              right: parentWidth*0.03),
                          child: Container(
                            height: SizeConfig.screenWidth*0.003,
                            color: Colors.black12,
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
                        Padding(
                          padding:  EdgeInsets.only(left: parentWidth*0.05,
                              top: parentHeight*0.01),
                          child: GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              showVehicleType = !showVehicleType;
                              vehicleType = 3;
                              if(mounted){
                                setState(() {
                                  vehicleName = "Trailer";
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [

                                  Container(
                                    height: parentHeight*0.03,
                                    width: parentWidth*0.06,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                        color:vehicleType == 3 ? CommonColor.SIGN_UP_TEXT_COLOR
                                            : CommonColor.WHITE_COLOR
                                    ),
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.only(left: parentWidth*0.03),
                                    child: Text("Trailer",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                          fontFamily: 'Roboto_Regular'
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),




                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                  child: Container(
                    height: SizeConfig.screenWidth*0.003,
                    color: Colors.black12,
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


                Visibility(
                  visible: vehicleType == 3 ? !showTrailerSubType : showTrailerSubType,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: parentHeight*0.02,
                            left: parentWidth*0.05,
                            right: parentWidth*0.05
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: (){
                                trailerType = 1;
                                trailerSubType = "(Semi)";
                                showTrailerSubType = !showTrailerSubType;
                                if(mounted){
                                  setState(() {

                                  });
                                }
                              },
                              child: Container(
                                  height: parentHeight*0.04,
                                  width: parentWidth*0.2,
                                  decoration: BoxDecoration(
                                      color:trailerType == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : Colors.white,
                                      border: Border.all(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(
                                    child: Text("Semi",
                                      style: TextStyle(
                                          color:trailerType == 1 ? CommonColor.WHITE_COLOR : CommonColor.BLACK_COLOR ,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                  )
                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                trailerType = 2;
                                trailerSubType = "(Half Body)";
                                showTrailerSubType = !showTrailerSubType;
                                if(mounted){
                                  setState(() {

                                  });
                                }

                              },
                              child: Container(
                                  height: parentHeight*0.04,
                                  width: parentWidth*0.22,
                                  decoration: BoxDecoration(
                                      color:trailerType == 2 ? CommonColor.SIGN_UP_TEXT_COLOR : Colors.white,
                                      border: Border.all(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(
                                    child: Text("Half Body",
                                      style: TextStyle(
                                          color:trailerType == 2 ? CommonColor.WHITE_COLOR : CommonColor.BLACK_COLOR ,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                  )
                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                trailerType = 3;
                                trailerSubType = "(Car Trailer)";
                                showTrailerSubType = !showTrailerSubType;
                                if(mounted){
                                  setState(() {

                                  });
                                }

                              },
                              child: Container(
                                  height: parentHeight*0.04,
                                  width: parentWidth*0.22,
                                  decoration: BoxDecoration(
                                      color:trailerType == 3 ? CommonColor.SIGN_UP_TEXT_COLOR : Colors.white,
                                      border: Border.all(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(
                                    child: Text("Car Trailer",
                                      style: TextStyle(
                                          color:trailerType == 3 ? CommonColor.WHITE_COLOR : CommonColor.BLACK_COLOR ,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                  )
                              ),
                            )

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                        child: Container(
                          height: SizeConfig.screenWidth*0.003,
                          color: Colors.black12,
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
                
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.05,
                          top: parentHeight*0.02),
                      child: GestureDetector(
                        onDoubleTap: (){},
                        onTap: (){
                          showAllTyresType = !showAllTyresType;
                          if(mounted){
                            setState(() {

                            });
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: trailerTyreTypes == 0 ? 'Type of Tyre' : trailerTyreName,
                                  style: TextStyle(
                                    color: trailerTyreTypes == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0)
                                        : Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: parentWidth*0.05),
                                child: const Icon(Icons.keyboard_arrow_down_outlined,
                                  color: Colors.black,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Visibility(
                      visible: showAllTyresType,
                      child: Padding(
                        padding: EdgeInsets.only(top: parentHeight*0.02,),
                        child: Column(
                          children: [


                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 1;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "6 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("6 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: parentWidth*0.03,
                                  right: parentWidth*0.03),
                              child: Container(
                                height: SizeConfig.screenWidth*0.003,
                                color: Colors.black12,
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

                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05,
                                  top: parentHeight*0.01),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 2;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "10 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 2 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("10 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: parentWidth*0.03,
                                  right: parentWidth*0.03),
                              child: Container(
                                height: SizeConfig.screenWidth*0.003,
                                color: Colors.black12,
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

                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05,
                                  top: parentHeight*0.01),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 3;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "12 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 3 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("12 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: parentWidth*0.03,
                                  right: parentWidth*0.03),
                              child: Container(
                                height: SizeConfig.screenWidth*0.003,
                                color: Colors.black12,
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


                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 4;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "14 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 4 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("14 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: parentWidth*0.03,
                                  right: parentWidth*0.03),
                              child: Container(
                                height: SizeConfig.screenWidth*0.003,
                                color: Colors.black12,
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

                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05,
                                  top: parentHeight*0.01),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 5;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "16 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 5 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("16 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: parentWidth*0.03,
                                  right: parentWidth*0.03),
                              child: Container(
                                height: SizeConfig.screenWidth*0.003,
                                color: Colors.black12,
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

                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05,
                                  top: parentHeight*0.01),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 6;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "18 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 6 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("18 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                  left: parentWidth*0.03,
                                  right: parentWidth*0.03),
                              child: Container(
                                height: SizeConfig.screenWidth*0.003,
                                color: Colors.black12,
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

                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.05,
                                  top: parentHeight*0.01),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  showAllTyresType = !showAllTyresType;
                                  trailerTyreTypes = 7;
                                  if(mounted){
                                    setState(() {
                                      trailerTyreName = "22 Tyre";
                                    });
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [

                                      Container(
                                        height: parentHeight*0.03,
                                        width: parentWidth*0.06,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                            color:trailerTyreTypes == 7 ? CommonColor.SIGN_UP_TEXT_COLOR
                                                : CommonColor.WHITE_COLOR
                                        ),
                                      ),

                                      Padding(
                                        padding:  EdgeInsets.only(left: parentWidth*0.03),
                                        child: Text("22 Tyre",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                      child: Container(
                        height: SizeConfig.screenWidth*0.003,
                        color: Colors.black12,
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

                Container(
                  color: Colors.transparent,
                  height: parentHeight*0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.05),
                        child:Text(trailerTyreTypes == 0 ? "Carrying Capacity" :
                        trailerTyreTypes == 1 ? "18,500" :
                        trailerTyreTypes == 2 ? "28,000" :
                        trailerTyreTypes == 3 ? "35,000" :
                        trailerTyreTypes == 4 ? "42,000" :
                        trailerTyreTypes == 5 ? "47,500" :
                        trailerTyreTypes == 6 ? "45,500" :
                        trailerTyreTypes == 7 ? "55,000" :
                        "50,000",
                          style: TextStyle(
                              color:tyreTypes == 0 ? Colors.black26 : CommonColor.BLACK_COLOR,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontFamily: 'Roboto_Regular'
                          ),)
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: parentWidth*0.0),
                        child: Container(
                          width: parentWidth*0.31,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: parentHeight*0.025,
                                width: parentWidth*0.15,
                                decoration: BoxDecoration(
                                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Text("RLW (kg)",
                                    style: TextStyle(
                                        color: CommonColor.WHITE_COLOR,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        fontFamily: 'Roboto_Regular'
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),

                ),

                SizedBox(
                  height: parentHeight*0.025,
                )

              ],
            ),
          ),
        ),

      ],
    );
  }



}