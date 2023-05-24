import 'dart:async';
import 'package:fixgovehicleapp/common_file/common_color.dart';
import 'package:fixgovehicleapp/common_file/size_config.dart';
import 'package:fixgovehicleapp/login_registration/sign_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FixGo Vehicle App",
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/frame': (BuildContext context) => const SignUpDialog(),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    startTimer();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.APP_BAR_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            // Image(image: AssetImage("assets/images/app_logo.png")),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
              child: Text("FixGo",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal*9.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Robot_Bold',
                    color:CommonColor.WHITE_COLOR
                ),),
            )
          ],
        ),
      ),
    );
  }

  void navigateParentPage() {
    Navigator.of(context).pushReplacementNamed('/frame');
  }

  startTimer() {
    var durtaion = new Duration(seconds: 5);
    return Timer(durtaion, navigateParentPage);
  }

}
