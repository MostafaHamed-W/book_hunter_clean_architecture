import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
  List<BookEntity> fetchSimilarBooks({String? category});
}

class HomeLocalDataSourceIml extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 20;
    var box = Hive.box<BookEntity>(kFeaturebBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    } else {
      return box.values.toList().sublist(startIndex, endIndex);
    }
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIdex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIdex >= length || endIndex > length) {
      return [];
    } else {
      return box.values.toList().sublist(startIdex, endIndex);
    }
  }

  @override
  List<BookEntity> fetchSimilarBooks({String? category}) {
    throw UnimplementedError();
  }
}
