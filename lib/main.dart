import 'package:flutter/material.dart';
import 'package:string_inverter/colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inversor de String',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String invertedString = "";

  String inverter(String word) {
    String invertedWord = '';

    for (int i = word.length - 1; i >= 0; i--) {
      invertedWord += word[i];
    }


    return invertedWord;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsD.light_grey,
      appBar: AppBar(
        backgroundColor: ColorsD.white,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/soonTargetSistemas.png'),
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const Text(
              'Questão 5)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Inversor de String: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: null,
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorsD.red,
                          width: 20
                      )
                  ),
                  labelText: 'String',
                ),
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      String inputString = _controller.text;
                      invertedString = inverter(inputString);
                    });
                  },

                  child: Container(
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                      color: ColorsD.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Inverter String",
                        style: TextStyle(
                          color: ColorsD.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              invertedString != "" ? const Text(
                "Sua String invertida ficou assim: ",
                style: TextStyle(
                  color: ColorsD.black,
                  fontSize: 18,
                ),
              ) : Container(),
              const SizedBox(height: 10),

              invertedString != "" ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsD.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '"$invertedString"',
                          style: const TextStyle(
                            color: ColorsD.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ) : Container(),

            ],
          ),
        ),
      ),
    );
  }
}
