import 'package:get/get.dart';
import 'package:p6_mopro/data/services/omdb_service.dart';
import 'package:p6_mopro/data/repositories/movie_repository.dart';
import 'package:p6_mopro/routes/app_routes.dart';
import 'package:p6_mopro/view_models/movie_controller.dart';
import 'package:p6_mopro/view_models/movie_detail_controller.dart';
import 'package:p6_mopro/views/movie_detail_view.dart';
import 'package:p6_mopro/views/movie_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page:() => MovieView(),
      binding: BindingsBuilder((){
        Get.lazyPut(() => OmdbService());

        Get.lazyPut(()=> MovieRepository(omdbService: Get.find<OmdbService>()));

        Get.lazyPut(()=> MovieController(repository: Get.find<MovieRepository>()));
      }),
    ),
    GetPage(
      name: Routes.detail,
      page: () => MovieDetailView(),
      binding: BindingsBuilder((){
        Get.lazyPut(() => MovieDetailController(repository: Get.find<MovieRepository>()));
      }),
    ),
  ];
}