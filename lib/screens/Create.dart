import 'package:estacionamento/components/Messages.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/Menu.dart';
import '../controllers/ParkingSpot.dart';
import '../models/ParkingSpot.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _parkingSpotNumberController = TextEditingController();
    final _licensePlateCarController = TextEditingController();
    final _brandCarController = TextEditingController();
    final _modelCarController = TextEditingController();
    final _colorCarController = TextEditingController();
    final _responsibleNameController = TextEditingController();
    final _apartamentController = TextEditingController();
    final _blockController = TextEditingController();

    var controller = ParkingSpotController.parkingSpotController;

    // Create TextFormField validators
    String? validateFormField(String value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    // Create a handle to submit the form
    void handleSubmit() async {
      ParkingSpotModel parkingSpot = ParkingSpotModel(
        "",
        _parkingSpotNumberController.text,
        _licensePlateCarController.text,
        _brandCarController.text,
        _modelCarController.text,
        _colorCarController.text,
        "",
        _responsibleNameController.text,
        _apartamentController.text,
        _blockController.text,
      );

      var response = await controller.post(parkingSpot);

      if (response != false) {
        Messages.showSnackbar(
          "Sucesso",
          "Sucesso ao criar nova vaga",
          Icons.check,
          Colors.lightGreen,
          Colors.white,
        );
      } else {
        Messages.showSnackbar(
          "Erro",
          "Erro ao criar nova vaga",
          Icons.error,
          Colors.red,
          Colors.white,
        );
      }
    }

    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Número da Vaga',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _parkingSpotNumberController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Placa do Carro',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _licensePlateCarController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Marca do Carro',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _brandCarController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Modelo do Carro',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _modelCarController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cor do Carro',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _colorCarController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do Responsável',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _responsibleNameController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Apartamento',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _apartamentController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Bloco',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) => validateFormField(value!),
                  controller: _blockController,
                )
                .padding(all: 8)
                .backgroundColor(Colors.grey[200] ?? Colors.grey)
                .borderRadius(all: 8),
                SizedBox(height: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: handleSubmit,
                  child: Text('Criar'),
                )
                .padding(all: 8)
                .width(double.infinity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
