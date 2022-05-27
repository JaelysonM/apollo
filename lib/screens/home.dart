import 'package:apollo/constants/colors.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _logged = false;

  int TelaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeBackground,
      body: SafeArea(
        child: Column(children: <Widget>[
          ScreenHeader(
              child: Container(
            width: 180,
            height: 85,
            decoration: BoxDecoration(
                color: kInterDarkBlue,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  title: Text(
                    "450 minutos foram economizados até agora",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text('+50% em relação a semana passada',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white70,
                      )),
                )),
          )),
          Flexible(child: renderBody())
        ]),
        bottom: false,
      ),
      extendBody: true,
      bottomNavigationBar:
          Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        FloatingNavbar(
          currentIndex: TelaSelecionada,
          backgroundColor: Color(0xff6171FF),
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          itemBorderRadius: 30,
          borderRadius: 30,
          elevation: 12,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          selectedBackgroundColor: Color(0xff8FA7FF),
          onTap: (index) {
            setState(() {
              TelaSelecionada = index;
            });
          },
          items: [
            FloatingNavbarItem(
              icon: (Icons.star_border_sharp),
              title: 'Assinaturas',
            ),
            FloatingNavbarItem(
              icon: (Icons.storefront),
              title: 'Início',
            ),
            FloatingNavbarItem(
              icon: (Icons.calendar_today_outlined),
              title: 'Sua agenda',
            ),
          ],
        )
      ]),
    );
  }

  Widget renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19),
            child: Text(
              'Do que você precisa?',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Container(
            height: 100,
            margin: EdgeInsets.only(left: 19, right: 19),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Color(0xff5a57fe),
                      child: ListTile(
                          leading: Icon(
                            Icons.watch_later_outlined,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Marcar um serviço",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    )),
                Container(
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Color(0xff5a57fe),
                      child: ListTile(
                          leading: Icon(
                            Icons.circle_sharp,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Acelerar meu negócio",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
                    )),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "ou",
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: kThemeBackground,
                      child: ListTile(
                          title: Text(
                        "tô só dando uma olhada",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                    )),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 19),
          child: Text(
            'Catálogo',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          color: kThemeBackground,
          height: 55,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 170,
                height: 30,
                margin: EdgeInsets.only(
                  left: 19,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color(0xffd9d9d9),
                ),
                child: TextField(
                  scrollPadding: EdgeInsets.all(5),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  decoration: InputDecoration(
                    hintText: "Do que você precisa?",
                    hintStyle: TextStyle(fontSize: 11),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 110,
                padding: EdgeInsets.only(top: 12, bottom: 5, left: 15),
                child: Card(
                  color: Color(0xff09579E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Barberia",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              Container(
                height: 35,
                width: 110,
                padding: EdgeInsets.only(top: 12, bottom: 5, left: 15),
                child: Card(
                  color: Color(0xff007ef2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Barberia",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              Container(
                height: 35,
                width: 110,
                padding: EdgeInsets.only(top: 12, bottom: 5, left: 15),
                child: Card(
                  color: Color(0xff09579E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Barberia",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
