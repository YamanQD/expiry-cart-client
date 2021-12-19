import 'package:expiry_cart/categories_helper/category.dart';

class Utils {
  // categories generator
  static List<Category> get() {
    return [
      Category(
        name: 'Canned Food',
        imgName: 'imgName',
      ),
      Category(
        name: 'Dairy and Eggs',
        imgName: 'imgName',
      ),
      Category(
        name: 'Fruits and Vegetables',
        imgName: 'imgName',
      ),
      Category(
        name: 'Meats, Fish and Poultry',
        imgName: 'imgName',
      ),
      Category(
        name: 'Beverages',
        imgName: 'imgName',
      ),
      Category(
        name: 'Bakery and Snakes',
        imgName: 'imgName',
      ),
      Category(
        name: 'Medicines and Personal Care',
        imgName: 'imgName',
      ),
    ];
  }
}
