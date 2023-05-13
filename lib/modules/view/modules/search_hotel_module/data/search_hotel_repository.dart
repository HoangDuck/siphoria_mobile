
import 'package:final_project_hcmute/core/models/hotel_model.dart';
import 'package:final_project_hcmute/modules/view/modules/search_hotel_module/data/search_hotel_api_provider.dart';
import '../domain/adapters/repository_adapter.dart';

class SearchHotelRepository implements ISearchHotelRepository {
  SearchHotelRepository({required this.provider});
  final ISearchHotelProvider provider;

  @override
  Future<List<Hotel>> getListHotelMobile() async {
    final response = await provider.getListHotelMobile();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

}

