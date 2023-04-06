import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/scoped_model/auth.dart';
import 'package:hook_up_rent/routs.dart';
import 'package:scoped_model/scoped_model.dart';
import 'pages/scoped_model/room_filter.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    return ScopedModel<AuthModel>(
      model: AuthModel(),
      // 1.application中添加Model
      child: ScopedModel<FilterBarModel>(
        model: FilterBarModel(),
        child: MaterialApp(
          theme: ThemeData(
              colorScheme: const ColorScheme(
                  primary: Colors.green, //上方标题栏颜色
                  secondaryContainer: Colors.white,
                  secondary: Colors.green,
                  background: Colors.white,
                  error: Colors.red,
                  brightness: Brightness.light,
                  onBackground: Colors.pink,
                  onError: Colors.yellow,
                  onPrimary: Colors.white, //字体颜色
                  onSecondary: Colors.redAccent,
                  onSurface: Colors.grey,
                  surface: Colors.redAccent
                  // all fields should have a value
                  )),
          home: const HomePage(),
          onGenerateRoute: router.generator,
          initialRoute: Routes.loading,
        ),
      ),
    );
  }
}
