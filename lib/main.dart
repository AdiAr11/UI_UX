import 'package:flutter/material.dart';
import 'package:tezure/match_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget>? cardList;
  late int cardsCount;

  @override
  void initState() {
    super.initState();
    cardList = _getMatchCard();
    cardsCount = cardList!.length;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: cardsCount != 0 ?
                MediaQuery.of(context).size.height * 0.46 : MediaQuery.of(context).size.height * 0.3,
                curve: Curves.linear,
                child: Container(
                  color: const Color(0xff252525),
                ),
              ),

              Container(
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                margin: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
                height: MediaQuery.of(context).size.height * 0.2 + 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white)
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        RichText(
                          text: const TextSpan(
                            text: 'Portfolio Balance ',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\n\$46.78",
                                style: TextStyle(color: Colors.yellow, fontSize: 22.0)
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          // behavior: HitTestBehavior,
                          onTap: (){showSnackBar("Button Pressed");},
                          child: Container(
                            width: 119.0,
                            height: 43.0,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.circle),
                                Text("John Ben"),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        circularButton(Icons.arrow_upward_rounded),
                        circularButton(Icons.call_received),
                        const SizedBox(width: 55.0),
                        circularButton(Icons.qr_code_scanner),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Send", style: TextStyle(color: Colors.white),),
                        Text("Receive", style: TextStyle(color: Colors.white),),
                        SizedBox(width: 54.0),
                        Text("Scan", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Stack(
                    children: cardList!,
                  ),
                ),
              )

            ],
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All tokens",
                      style: TextStyle(color: Colors.white, fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      // behavior: HitTestBehavior,
                      onTap: (){showSnackBar("Sorting");},
                      child: Container(
                        width: 80.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.sort),
                            Text(" Sort"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0,),
                oneTokenRow(),
                const Divider(color: Colors.grey,height: 40.0,),
                oneTokenRow(),
                const Divider(color: Colors.grey,height: 40.0,),
                oneTokenRow(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xff252525),
              builder: (context) {
                return bottomSheet(context);
              });
        },
        tooltip: 'Increment',
        elevation: 4.0,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.sort, color: Colors.black),
      ),
    //   bottomNavigationBar: Stack(
    //   alignment: const FractionalOffset(.5, 1.5),
    //   children: [
    //     BottomNavigationBar(
    //       backgroundColor: const Color(0xff252525),
    //       selectedItemColor: const Color(0xffF8DF00),
    //       unselectedItemColor: Colors.white,
    //       items: const [
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.home),
    //           label: 'Home',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.business),
    //           label: 'Business',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.school),
    //           label: 'School',
    //         ),
    //       ],
    //       // currentIndex: _selectedIndex,
    //       // onTap: _onItemTapped,
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(bottom: 12.0),
    //       child: FloatingActionButton(
    //         onPressed: () => print('hello world'),
    //         child: const Icon(Icons.arrow_back),
    //       ),
    //     ),
    //   ],
    // ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70.0,
          color: const Color(0xff252525),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    IconButton(icon: const Icon(Icons.wallet, color: Colors.yellow,),
                    onPressed: (){},),
                    const Text("Wallet", style: TextStyle(color: Colors.yellow),)
                  ],
                ),),
              Expanded(
                  child: Column(
                    children: [
                      IconButton(icon: const Icon(Icons.image_outlined,color: Colors.white,),
                onPressed: (){},),
                      const Text("Gallery", style: TextStyle(color: Colors.white),)
                    ],
                  )),
              const Expanded(child: Text('')),
              Expanded(
                  child: Column(
                    children: [
                      IconButton(icon: const Icon(Icons.star_border,color: Colors.white,),
                      onPressed: (){}),
                      const Text("Favorites", style: TextStyle(color: Colors.white),)
                    ],
                  )),
              Expanded(
                child: Column(
                  children: [
                    IconButton(icon: const Icon(Icons.settings_outlined,color: Colors.white,),
                    onPressed: (){},),
                    const Text("Settings", style: TextStyle(color: Colors.white),)
                  ],
                ),),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget bottomSheet(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Sort By",
                style: TextStyle(color: Colors.white,
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text("Done", style: TextStyle(color: Colors.yellow,
                  fontWeight: FontWeight.bold, fontSize: 18.0),)
            ],
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 1.0,
        ),
        const SizedBox(height: 10.0),
        ListTile(
          tileColor: Colors.yellow,
          title: const Text('Price: Lowest to High',
            style: TextStyle(color: Colors.black),),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Price: Highest to Lowest',
            style: TextStyle(color: Colors.white),),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 40.0,)
      ],
    );
  }

  Widget oneTokenRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset("assets/images/token_icon.png"),
            const SizedBox(width: 8.0),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Tezos',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  TextSpan(
                    text: '\nXTZ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: '64',
                style: TextStyle(color: Colors.yellow,
                    fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              TextSpan(
                text: '\n\$255.21',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _removeCard(index) {
    setState(() {
      cardList?.removeAt(index);
      cardsCount--;
    });
  }

  List<Widget> _getMatchCard() {
    List<MatchCard> cards = [];
    cards.add(MatchCard("assets/images/banner_card1.png", 30));
    cards.add(MatchCard("assets/images/banner_card2.png", 20));
    cards.add(MatchCard("assets/images/banner_card3.png", 10));

    List<Widget> cardList = [];

    for (int x = 0; x < 3; x++) {
      cardList.add(Positioned(
        top: cards[x].margin,
        right: cards[x].margin,
        child: Draggable(
          onDragEnd: (drag){
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Image.asset(cards[x].filePath)
          ),
          child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Image.asset(cards[x].filePath)
          ),
        ),
      ));
    }

    return cardList;
  }

  Widget circularButton(IconData icon){
    return Container(
      height: 35,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }

  void showSnackBar(String message){
    var snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(message),
      backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}