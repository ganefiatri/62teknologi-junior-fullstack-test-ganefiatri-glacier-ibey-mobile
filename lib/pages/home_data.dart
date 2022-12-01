import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentalhealthapp/apiservices.dart';
import 'package:mentalhealthapp/dataclases.dart';

class HomeData extends StatefulWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  State<HomeData> createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  Service serviceApi = Service();
  late Future<List<cData>> listData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceApi.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
      ),
      body: Container(
        child: FutureBuilder<List<cData>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<cData> isiData = snapshot.data!;
              return ListView.builder(
                itemCount: isiData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isiData[index].name),
                      subtitle: Text(isiData[index].address),
                      
                    ),
                  );
                },
              );
            } else {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ));
  }
}
