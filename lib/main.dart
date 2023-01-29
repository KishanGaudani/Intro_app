import 'package:flutter/material.dart';
import 'package:intro_app/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      routes: {
        'home': (context) => const home(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List intro = [
    {
      'text': "Order your Food",
      'text1': "Now you can order food any time right from your mobile.",
      'image': "assets/images/1.jpg",
    },
    {
      'text': "Cooking Safe Food",
      'text1': "We are maintain safty and we keep clean while making food.",
      'image': "assets/images/2.jpg",
    },
    {
      'text': "Quick Delivery",
      'text1': "orders your favorite meals will be immediately deliver",
      'image': "assets/images/3.jpg",
    },
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: intro
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'home');
                        },
                        child: const Text(
                          "SKIP",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${intro[index]['text']}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${intro[index]['text1']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Image(
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        height: 300,
                        width: 300,
                        image: AssetImage("${intro[index]['image']}"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (index < 2) {
                              index++;
                            } else {
                              Navigator.pushNamed(context, 'home');
                            }
                            if (index > 2) {
                              index == 2;
                            }
                          });
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
