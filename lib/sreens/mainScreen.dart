import 'package:dotted_border/dotted_border.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

const background = Color(0xff343434);

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int TelaSelecionada = 0;
  bool islogged = false;

  @override
  Widget build(BuildContext context) {
    List<Card> barbearias = [
      Card(),
      Card(),
      Card(),
      Card(),
      Card(),
    ];
    print('${barbearias.length}');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        foregroundColor: Color(0xffe1e1e1),
        title: Text('Olá visitante'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: background,
                      child: ListTile(
                        title: Text(
                          "01 de maio de 2022, Domigo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 19),
              child: Text(
                'Do que você precisa?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
                height: 100,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
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
                          color: background,
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
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
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
                        margin: EdgeInsets.all(5),
                        child: Card(
                            color: background,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: Colors.white70,
                              radius: Radius.circular(20),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                  color: Colors.white,
                                                  fontSize: 8),
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
                                                  color: Colors.white,
                                                  fontSize: 8),
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
                                                  color: Colors.white,
                                                  fontSize: 8),
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
                                        padding:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: CircleAvatar(
                                          radius: 20,
                                          child: Icon(Icons.add_task),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, top: 5),
                                        child: Text(
                                          "5 horários disponíveis paras as próximas 5 horas",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
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
      ),
    );
  }
}
