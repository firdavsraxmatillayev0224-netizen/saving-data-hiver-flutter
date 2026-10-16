import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter33/model/player_model.dart';
import 'package:flutter33/service/player_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayerService service = PlayerService();

  late Future<List<PlayersModel>> players;

  @override
  void initState() {
    super.initState();

    players = service.getPlayers();
  }

  void refreshPlayer() async {
    setState(() {
      players = service.getPlayers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online/Ofline Player Shop"),
        actions: [
          IconButton(
            onPressed: () {
              refreshPlayer();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: FutureBuilder(
        future: players,
        builder: (context, snapshot) {
          // Loading holati
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          }

          // Error
          if (snapshot.hasError) {
            return Center(child: Text("404"));
          }

          List<PlayersModel> oyinchilar = snapshot.data!;

          return GridView.builder(
            itemCount: oyinchilar.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 3),
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    Text(oyinchilar[index].name ?? ""),
                    SizedBox(height: 30),
                    Text(oyinchilar[index].surname ?? ""),
                    SizedBox(height: 30),
                    Text(oyinchilar[index].age.toString()),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}