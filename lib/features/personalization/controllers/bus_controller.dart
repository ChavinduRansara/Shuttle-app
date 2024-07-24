import 'package:get/get.dart';
import 'package:shuttle_app/commons/widgets/loaders/loaders.dart';
import 'package:shuttle_app/data/repositories/bus/bus_repository.dart';
import 'package:shuttle_app/features/personalization/model/bus_model.dart';
import 'package:shuttle_app/utils/constants/text.dart';

class BusController extends GetxController {
  static BusController get instance => Get.find();

  final busRepository = Get.put(BusRepository());
  RxList<BusModel> buses = <BusModel>[].obs;
  final busLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBusRecords();
  }

  Future<void> fetchBusRecords() async {
    try{
      busLoading.value = true;
      final buses = await busRepository.fetchBusDetails();
      this.buses(buses);
    }catch(e){
      buses(<BusModel>[]);
    }finally{
      busLoading.value = false;
    }
  }

  Future<void> saveBusRecords(BusModel busModel) async {
    try{
      await fetchBusRecords();

      if(buses.isEmpty){
        await busRepository.saveBusDetails(busModel);
      }else{
        await busRepository.updateBusDetails(busModel);
      }
    }catch(e){
      AppLoader.warnningSnackBar(title: AppText.dataNotSave, message: AppText.notSave);
    }
  }
}