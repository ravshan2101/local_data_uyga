import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void dologin() async {
    String user = usernamecontroller.text.toString().trim();
    String email = emailcontroller.text.toString().trim();
    String phone = phonecontroller.text.toString().trim();
    String password = passwordcontroller.text.toString().trim();

    var box = Hive.box('ravshann');
    box.put('user', user);
    box.put('email', email);
    box.put('phone', phone);
    box.put('password', password);

    var us = box.get('user');
    var em = box.get('email');
    var ph = box.get('phone');
    var pw = box.get('password');

    print(us);
    print(em);
    print(ph);
    print(pw);
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
                Text(
                  'Create',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Account',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
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
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            hintText: 'E-Mail',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: phonecontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: Colors.grey,
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.key_outlined,
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
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade800),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    MaterialButton(
                      onPressed: () {
                        dologin();
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
                          'Already have an account?',
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 17),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            '  SIGN IN',
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
