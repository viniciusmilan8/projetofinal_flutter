import 'package:estacionamento/components/Messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/Header.dart';
import '../components/Menu.dart';
import '../controllers/ParkingSpot.dart';
import 'Edit.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
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
                    MaterialPageRoute(builder: (context) => ListaPage()),
                  );
                },
                child: Text('Recarregar'),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.listParkingSpotObs.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3, // Adiciona uma sombra sutil
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      controller.listParkingSpotObs[index].licensePlateCar,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Número da Vaga: ${controller.listParkingSpotObs[index].parkingSpotNumber}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(Edit(
                              objeto: controller.listParkingSpotObs[index],
                            ));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            var response = await controller.deleteParkingSpot(controller.listParkingSpotObs[index]);
                            if (response != false) {
                              Get.snackbar(
                                "Sucesso",
                                "Alterações salvas com sucesso!",
                                icon: Icon(Icons.check, color: Colors.white),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.lightGreen,
                                colorText: Colors.white,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListaPage()),
                              );
                            } else {
                              Get.snackbar(
                                "Erro ao salvar alterações",
                                response,
                                icon: Icon(Icons.error, color: Colors.white),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
