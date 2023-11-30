import 'package:estacionamento/components/Header.dart';
import 'package:estacionamento/components/Menu.dart';
import 'package:estacionamento/controllers/ParkingSpot.dart';
import 'package:estacionamento/models/ParkingSpot.dart';
import 'package:estacionamento/screens/Edit.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadData() async {
    await controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text('Recarregar'),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: controller.listParkingSpotObs.length,
              itemBuilder: (context, index) {
                return _buildParkingSpotItem(controller.listParkingSpotObs[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildParkingSpotItem(ParkingSpotModel parkingSpot) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Text(
            parkingSpot.licensePlateCar,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Número da Vaga: ${parkingSpot.parkingSpotNumber}',
          ),
        ),
      ),
    );
  }
}
