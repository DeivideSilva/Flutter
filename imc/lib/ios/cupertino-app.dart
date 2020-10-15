import 'package:flutter/cupertino.dart';
import 'package:imc/ios/pages/home.page.dart';


class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Imc",
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}