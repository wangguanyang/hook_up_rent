import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/scoped_model/auth.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
    Timer.run(() {
      ScopedModelHelper.getModel<AuthModel>(context).initApp(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('static/images/loading.jpg'))),
    );
  }
}
