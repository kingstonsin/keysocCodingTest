import 'package:flutter/material.dart';
import 'package:keysoc_coding_test/view/screens/home_screen.dart';
import 'package:keysoc_coding_test/view_model/album_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AlbumViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KeySocCdingTest',
        theme: ThemeData(
          appBarTheme: AppBarTheme(),
          primarySwatch: Colors.green,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
