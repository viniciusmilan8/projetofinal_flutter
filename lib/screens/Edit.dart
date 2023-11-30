import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import '../components/Header.dart';
import '../components/Menu.dart';
import '../controllers/ParkingSpot.dart';
import '../models/ParkingSpot.dart';

class Edit extends StatefulWidget {
  Edit({Key? key, required this.objeto}) : super(key: key);

  final ParkingSpotModel objeto;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _parkingSpotNumberController = TextEditingController();
    final _licensePlateCarController = TextEditingController();
    final _brandCarController = TextEditingController();
    final _modelCarController = TextEditingController();
    final _colorCarController = TextEditingController();
    final _responsibleNameController = TextEditingController();
    final _apartmentController = TextEditingController(); // Corrigi o nome do controller
    final _blockController = TextEditingController();

    _parkingSpotNumberController.text = widget.objeto.parkingSpotNumber;
    _licensePlateCarController.text = widget.objeto.licensePlateCar;
    _brandCarController.text = widget.objeto.brandCar;
    _modelCarController.text = widget.objeto.modelCar;
    _colorCarController.text = widget.objeto.colorCar;
    _responsibleNameController.text = widget.objeto.responsibleName;
    _apartmentController.text = widget.objeto.apartment;
    _blockController.text = widget.objeto.block;

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
        widget.objeto.id,
        _parkingSpotNumberController.text,
        _licensePlateCarController.text,
        _brandCarController.text,
        _modelCarController.text,
        _colorCarController.text,
        "",
        _responsibleNameController.text,
        _apartmentController.text,
        _blockController.text,
      );

      var response = await controller.editParkingSpot(parkingSpot);

      if (response != false) {
        Get.snackbar(
          "Sucesso",
          "Alterações salvas com sucesso!",
          icon: Icon(Icons.check, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
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
    }

    return Scaffold(
      key: _scaffoldKey,
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
                  controller: _apartmentController,
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
                  child: Text('Salvar Alterações'),
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
