import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'dashboard_menu.dart';
import 'menuboardlogin/registrationcc.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Social Food"
        ),
        centerTitle: true,
      ),
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? SingleChildScrollView(child: ContentArea())
          : ContentArea(),
    );
  }
}

class ContentArea extends StatefulWidget {
  // const ContentArea({
  //   Key? key,
  // }) : super(key: key);

  @override
  _ContentAreaState createState() => _ContentAreaState();
}

class _ContentAreaState extends State<ContentArea> {
  bool isChecked = false;
  TextEditingController myUsernameController = TextEditingController();
  TextEditingController myPasswordController = TextEditingController();


  @override
  void dispose() {
    myUsernameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Flexible(
          flex: 2,
          child: Stack(
            children: <Widget>[
              // SET CONTAINER SEBAGAI BACKGROUND
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              // Set CONTAINER kedua isi penjelasan dari Case sebelumnya
              Container(
                height: MediaQuery.of(context).size.height / 2.4,
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  image: DecorationImage(
                    image: AssetImage('assets/image/loginUser.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ------ bagian mengatur sudut
              Positioned(
                top: MediaQuery.of(context).size.height/3.6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin: const EdgeInsets.all(20.0),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Login Form",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          // inputan E-Mail
                          TextField(
                            keyboardType: TextInputType.multiline,
                            controller: myUsernameController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              // ketika inputan di klik membuat underline
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pinkAccent,
                                ),
                              ),

                              labelText: "E-Mail",
                              // SET Style dari label
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //Text field password
                          TextField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: myPasswordController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.security,
                                color: Colors.black,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              labelText: "Password : ",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // FORGOT PASSWORD
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 5, right: 15.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  color: Colors.blue[400],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // PART 2
        Flexible(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(20),

            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),

                    const Text(
                        "Remember Me",
                        style: TextStyle(color: Colors.white)
                    ),

                    const Spacer(
                      flex: 2,
                    ),

                    GestureDetector(
                      onTap: ()  {
                        if (myUsernameController.text == 'tajul' && myPasswordController.text =='123'){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
                        } else {
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Username dan Password SALAH",
                            buttons: [
                              DialogButton(
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                      },


                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0)
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0A174E),
                                Color(0xFF5D74E2)
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(80.0)
                            ),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                              minWidth: 150.0,
                              minHeight: 36.0,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    )
                  ],
                ),
                // TAMPIL TEXT SOCIAL BUTTON
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "Social Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //MEMBUAT GARIS
                const Divider(),
                const SocialButton(),
              ],
            ),
          ),
        )
        //CLASS BARU

      ],
    );
  }
}

class SocialButton extends StatelessWidget{
  const SocialButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/menu/dashboard_menu');
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/Facebook.png')
                  )
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {

            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/Twitter.png')
                  )
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/Google.png')
                  )
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Registrationcc()));
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/LinkedIn.png')
                  )
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Registrationcc()));
            },
            child: Container(
              width: 75,
              height: 60,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/Commons.png')
                  )
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}