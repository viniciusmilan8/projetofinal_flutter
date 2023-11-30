import 'package:get/get.dart';

import '../models/ParkingSpot.dart';
import '../services/ParkingStop.dart';

class ParkingSpotController extends GetxController {

    ParkingSpotService parkingSpotService = ParkingSpotService();
    var isLoading = false.obs;
    var listParkingSpotObs = <ParkingSpotModel>[].obs;

    static ParkingSpotController get parkingSpotController => Get.find();

    Future<dynamic> listParkingSpot()  async {
        isLoading.value = true;
        var list = await parkingSpotService.fetchListParkingSpot();
        listParkingSpotObs.value = list.listParkingSpotModel;
        isLoading.value = false;
        update();
        return listParkingSpotObs;
    }


    Future<dynamic> post(ParkingSpotModel objeto)  async {
        isLoading.value = true;
        var response = await parkingSpotService.fetchPostGarage(objeto);
        isLoading.value = false;
        update();
        return response;
    }

    Future<dynamic> deleteParkingSpot(ParkingSpotModel objeto)  async {
        isLoading.value = true;
        var response = await parkingSpotService.fetchDeleteGarage(objeto);
        isLoading.value = false;
        update();
        return response;
    }

    Future<dynamic> editParkingSpot(ParkingSpotModel objeto)  async {
        isLoading.value = true;
        var response = await parkingSpotService.fetchEditGarage(objeto);
        isLoading.value = false;
        update();
        return response;
    }
}

