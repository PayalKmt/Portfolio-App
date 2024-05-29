import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final Shader headerGradient = LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 0, 242, 255),
      Color.fromARGB(255, 38, 170, 97),
    ],
  ).createShader(Rect.fromLTWH(0, 0, 200, 70));

  final Shader highlightGradient = LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 43, 255, 1),
      Color.fromARGB(255, 255, 255, 0),
    ],
  ).createShader(Rect.fromLTWH(0, 0, 200, 70));

  final Shader overallTextGradient = LinearGradient(
    colors: <Color>[
      Color(0xff1f005c),
      Color(0xff5b0060),
      Color(0xff870160),
      Color(0xffac255e),
      Color(0xffca485c),
      Color(0xffe16b5c),
      Color(0xfff39060),
      Color.fromARGB(255, 255, 89, 0),
    ],
  ).createShader(Rect.fromLTWH(0, 0, 200, 70));
  
  myPro(lang, title, desc, star){
    return Container(
      margin: EdgeInsets.only(top: 17.0),
      height: 253,
      width: MediaQuery.of(context).size.width*0.95,
      child: Card(
        color: Color(0xff262628),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = headerGradient,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = highlightGradient,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    star,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(163, 0, 0, 0),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Projects',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myPro('FLUTTER', 'Weather_App', 'Real-time weather updates app, user-friendly, beautiful UI', '4.7'),
              myPro('FLUTTER', 'BMI_Calculator', 'BMI tracker, easy-to-use, intuitive interface, user-friendly', '4.8'),
              myPro('FLUTTER', 'Bit_Coin_App', 'Accurate Bitcoin updates, attractive, clean design, seamless experience', '4.5'),
              myPro('FLUTTER', 'Dice_Building App', 'Interactive dice, clean interface, elegant UI, user-friendly app', '4.6'),
              myPro('FLUTTER', 'Quizzer_App', 'An attractive, user-centric quiz app providing a variety of quizzes', '4.7'),
              myPro('FLUTTER', 'Sign_In_Page', 'Beautiful Sign In Page, user-friendly, attractive, clean design', '4.8'),
              myPro('WEB DEVELOPMENT', 'Amazon Clone', 'Seamless Amazon clone platform with intuitive interface and extensive catalog', '4.8'),
              myPro('ANDROID', 'AttendiFy App', 'Intuitive attendance app for Android offering streamlined tracking and reporting', '4.7')
            ],
          ),
        ),
      ),
    );
  }
}
