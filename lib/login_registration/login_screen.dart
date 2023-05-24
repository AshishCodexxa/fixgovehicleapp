
import 'package:fixgovehicleapp/common_file/common_color.dart';
import 'package:fixgovehicleapp/common_file/size_config.dart';
import 'package:fixgovehicleapp/login_registration/otp_put_screen.dart';
import 'package:fixgovehicleapp/login_registration/vehicle_owner/vehicle_owner_registration.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';




class LoginScreen extends StatefulWidget {

  final String isType;

  const LoginScreen({Key? key, required this.isType}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isChecked = false;

  TextEditingController phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.APP_BAR_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: CommonColor.WHITE_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign In",
                        style: TextStyle(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*6.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight*0.03,
                    left: SizeConfig.screenWidth*0.03,
                    right: SizeConfig.screenWidth*0.03,
                  ),
                  child: Container(
                    height: SizeConfig.screenHeight*0.11,
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth*0.03,
                            right: SizeConfig.screenWidth*0.03,
                          ),
                          child: IntlPhoneField(
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26)
                              ),
                            ),
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.04,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Column(
                          children: <Widget>[
                            Checkbox(

                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
                            child: RichText(
                                text: const TextSpan(
                                    text: "I have read and agree to Fix Go",
                                    style: TextStyle(
                                        color: CommonColor.BLACK_COLOR,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 13),
                                    children: [
                                      TextSpan(
                                          text: " Privacy Policy ",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 13)),
                                      TextSpan(
                                          text: "and\n",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 13)),
                                      TextSpan(
                                        text: "Terms of Service.\n",
                                        style: TextStyle(
                                            color: CommonColor.BLACK_COLOR,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 13),
                                      )
                                    ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPutScreen()));
                        },
                        child: Container(
                          height: SizeConfig.screenHeight*0.055,
                          width: SizeConfig.screenWidth*0.7,
                          decoration: BoxDecoration(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Send OTP",
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

                          if(widget.isType == "1"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleOwnerRegistration()));
                          }

                        },
                        child: Container(
                          color: Colors.transparent,
                          child: RichText(
                              text: TextSpan(
                                  text: "New User?",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 13),
                                  children: [
                                    TextSpan(
                                        text: " Create an account",
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

                SizedBox(
                  height: SizeConfig.screenHeight*0.03,
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
