import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_data_uyga/account.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('ravshan');
  await Hive.openBox('ravshann');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => const MyHomePage(),
        'account': (context) => const Account()
      },
      initialRoute: 'home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final passwordController = TextEditingController();
  final userController = TextEditingController();

  void doLogin() async {
    String username = userController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('ravshan');
    box.put('username', username);
    box.put('password', password);

    String user = box.get('username');
    String pasw = box.get('password');

    print(user);
    print(pasw);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 23, 28, 55),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/1.jpeg'))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Sign in to continuo',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: userController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: 'User name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                ),
                SizedBox(
                  height: 60,
                ),
                MaterialButton(
                  onPressed: () {
                    doLogin();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                            image: AssetImage('assets/images/3.png'))),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'nt have an account?',
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('account');
                      },
                      child: Text(
                        '  SIGN UP',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
