import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:i_c_task/modules/profile/conteroller/edit_profile_controller.dart';

import 'package:i_c_task/routes.dart';

import 'core/constants/colors_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/profile/bindings/edit_profile_binding.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
       debugShowCheckedModeBanner: false,
         theme: ThemeData(
           scaffoldBackgroundColor: ColorsCore.whiteColor
         ),

        initialRoute: AppRoutes.profilePage,
        getPages: AppRoutes.routes,
      ),
    );
  }
}


