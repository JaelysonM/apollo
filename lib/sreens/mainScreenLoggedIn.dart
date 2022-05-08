import 'package:dotted_border/dotted_border.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

const background = Color(0xff343434);

class MainScreenLogado extends StatefulWidget {
  const MainScreenLogado({Key? key}) : super(key: key);

  @override
  State<MainScreenLogado> createState() => _MainScreenLogadoState();
}

class _MainScreenLogadoState extends State<MainScreenLogado> {
  int telaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    var welcomeBar = Container(
      padding: EdgeInsets.all(20),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text(
                    "Olá Mateus",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 2),
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_arrow_up,
                          color: Colors.red, size: 15),
                      Text(
                        '4.99',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.laptop_mac,
                        color: Colors.white,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Selo Apolo",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.white,
                    ))
              ],
            )
          ]),
    );

    var todayBar = Container(
      margin: EdgeInsets.only(top: 15, left: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '15 de janeiro,',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text('Sexta-feira',
              style: TextStyle(color: Colors.white, fontSize: 20))
        ],
      ),
    );

    var statusBar = Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Card(
                    color: background,
                    child: ListTile(
                      title: Text(
                        "01 de maio de 2022, Segunda",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        print('450 minutos');
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Color(0xff003b80),
                          elevation: 6,
                          shadowColor: Colors.black,
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: ListTile(
                                title: Text(
                                  "450 minutos foram economizados até agora",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle:
                                    Text('+50% em relação a semana passada',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                        )),
                              ))),
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 200,
                    height: 100,
                    padding: EdgeInsets.all(2),
                    child: CircularPercentIndicator(
                      radius: 45,
                      lineWidth: 10,
                      percent: 0.85,
                      progressColor: Color(0xff78AEFF),
                      center: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.keyboard_arrow_up,
                                color: Colors.green, size: 15),
                            Text(
                              '85%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
            Container(
                width: 240,
                child: GestureDetector(
                  onTap: () {
                    print('450 minutos');
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Color(0xff003b80),
                      elevation: 6,
                      shadowColor: Colors.black,
                      child: Padding(
                          padding: EdgeInsets.all(0),
                          child: ListTile(
                            title: Text(
                              "450 minutos foram economizados até agora",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text('+50% em relação a semana passada',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                )),
                          ))),
                )),
          ],
        ));

    var catalogBar = Container(
      padding: EdgeInsets.only(left: 30),
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Catálogo',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            welcomeBar,
            todayBar,
            statusBar,
            catalogBar,
            Container(
              color: background,
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
            Container(
              height: 600,
              margin: EdgeInsets.only(top: 10),
              child: Scrollbar(
                showTrackOnHover: true,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    print(index);
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Card(
                        color: background,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Colors.white70,
                          radius: Radius.circular(20),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Barbearia Dom Castro",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.keyboard_arrow_down,
                                            color: Colors.red, size: 10),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 8),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.watch_later_outlined,
                                            color: Colors.white, size: 10),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.place,
                                            color: Colors.white, size: 10),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8, top: 17),
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Icon(Icons.add_task),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 12),
                                    child: Text(
                                      "5 horários disponíveis paras as próximas 5 horas",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: telaSelecionada,
        backgroundColor: Color(0xff6171FF),
        margin: EdgeInsets.all(10),
        itemBorderRadius: 30,
        borderRadius: 30,
        elevation: 12,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedBackgroundColor: Color(0xff8FA7FF),
        fontSize: 8,
        onTap: (index) {
          setState(() {
            telaSelecionada = index;
          });
        },
        items: [
          FloatingNavbarItem(
            icon: (Icons.bar_chart_sharp),
            title: 'Estatísticas',
          ),
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
          FloatingNavbarItem(
            icon: (Icons.face),
            title: 'Você',
          ),
        ],
      ),
    );
  }
}
