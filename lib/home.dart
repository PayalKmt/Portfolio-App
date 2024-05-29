import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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

  mySkills(num, type) {
    return Row(
      children: <Widget>[
        Text(
          num,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = overallTextGradient,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(type),
        ),
      ],

    );
  }

  mySpecialization(icon , text){
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color.fromARGB(255, 30, 31, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon,color: Colors.white,),
              SizedBox(height: 10,),
              Text(
                text,
                style: TextStyle(
                  foreground: Paint()..shader = highlightGradient,
                  fontSize: 16,
                ),
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: Icon(
            Icons.menu,
          ),
          color: Colors.black,
          itemBuilder: (context) => <PopupMenuItem>[
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'project');
                },
                child: Text(
                  'Projects',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'about');
                },
                child: Text(
                  'About Me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 19, 16, 16),
                Color.fromARGB(255, 0, 0, 0)
              ]),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(60),
                  child: ShaderMask(shaderCallback: (bound){
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black,Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, bound.width, bound.height));
                  },
                    blendMode: BlendMode.dstIn,
                    child: Image(
                      image: AssetImage('images/img.png'),
                      height: 400,
                      fit: BoxFit.contain,
                    )
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.49
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Payal Kumawat',
                        style: TextStyle(
                          foreground: Paint()..shader = headerGradient,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          'Flutter Developer',
                          style: TextStyle(
                              foreground: Paint()..shader = highlightGradient,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
              height: 650,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      mySkills('15+', 'Skills'),
                      mySkills('10+', 'Projects'),
                      mySkills('5+', 'Achievements'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Specialized In',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.android, 'Android'),
                          mySpecialization(FontAwesomeIcons.github, 'Github'),
                          mySpecialization(FontAwesomeIcons.python, 'Python'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.f, 'Flutter'),
                          mySpecialization(FontAwesomeIcons.d, 'Dart'),
                          mySpecialization(FontAwesomeIcons.database, 'My SQl'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.k, 'Kotlin'),
                          mySpecialization(FontAwesomeIcons.html5, 'HTML'),
                          mySpecialization(FontAwesomeIcons.css3, 'CSS'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontAwesomeIcons.js, 'JavaScript'),
                          mySpecialization(FontAwesomeIcons.nodeJs, 'Node Js'),
                          mySpecialization(FontAwesomeIcons.figma, 'Figma'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// SlidingUpPanel(
// minHeight: 60.0,
// panel: Center(
// child: Icon(
// Icons.arrow_drop_down,
// ),
// ),
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(25.0),
// topRight: Radius.circular(25.0),
// ),
// ),
