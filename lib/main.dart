import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './plants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<String> categories = ['Indoor', 'Outdoor', 'Succulent', 'Desk Plant'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.sort,
                    size: 35,
                    color: Color(0xff6bc58e),
                  ),
                  Text(
                    "PlantsAura",
                    style: GoogleFonts.montserrat(
                        color: Color(0xff6bc58e),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.shopping_basket_outlined,
                    size: 35,
                    color: Color(0xff6bc58e),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffffffff),
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      labelText: 'Search Plants',
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.grey.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Color(0xff6bc58e),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = i;
                                  });
                                },
                                child: Text(
                                  categories[i],
                                  style: GoogleFonts.montserrat(
                                      color: i == selectedIndex
                                          ? Color(0xff6bc58e)
                                          : Colors.grey.shade700,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: i == selectedIndex
                                        ? Color(0xff6bc58e)
                                        : Color(0xfff5f5f5)),
                              )
                            ],
                          ),
                        )),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                    itemCount: plants.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) => list(context, i)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget list(context, i) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: Container(
        height: 185,
        width: size.width - 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 10, bottom: 10, right: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffe8f6ee)),
                child: Image.network(
                  plants[i].imgUrl,
                  width: 130,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: size.width / 2.3,
                    child: Text(
                      plants[i].name,
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                          color: Color(0xff6bc58e),
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width / 2.3,
                    height: 40,
                    child: Text(
                      plants[i].desc,
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                        plants[i].price,
                        style: GoogleFonts.montserrat(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      TextButton(
                          onPressed: null,
                          child: Material(
                            color: Colors.greenAccent,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 30,
                              width: 60,
                              child: Center(
                                child: Text(
                                  'Buy',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
