// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/app_export.dart';

/// This class defines the variables used in the [favorite_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FavoriteModel {
  Rx<String>? quoteText;

  Rx<String>? authorName;

  Rx<String>? id;
  FavoriteModel({
    this.quoteText,
    this.authorName,
    this.id,
  });
}
