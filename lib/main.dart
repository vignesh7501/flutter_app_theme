import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      data: (brightness) {
        return ThemeData(primaryColor: Colors.blue, brightness: brightness);
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Flutter app theme',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      },
      loadBrightnessOnStart: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello",
                style: TextStyle(
                    color: ThemeManager.of(context).brightness.name == "light"
                        ? Colors.red
                        : Colors.green,
                    fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  ThemeManager.of(context)
                      .setBrightnessPreference(BrightnessPreference.light);
                },
                child: Text("Light")),
            ElevatedButton(
                onPressed: () {
                  ThemeManager.of(context)
                      .setBrightnessPreference(BrightnessPreference.dark);
                },
                child: Text("Dark")),
            ElevatedButton(
                onPressed: () {
                  ThemeManager.of(context)
                      .setBrightnessPreference(BrightnessPreference.system);
                },
                child: Text("System")),
          ],
        ),
      ),
    );
  }
}
