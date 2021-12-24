import 'package:expiry_cart/categories_helper/category.dart';

class Utils {
  // categories generator
  static List<Category> get() {
    return [
      Category(
        name: 'Canned Food',
        imgName: 'images/cat1.jpg',
      ),
      Category(
        name: 'Dairy and Eggs',
        imgName: 'images/cat2.jpeg',
      ),
      Category(
        name: 'Fruits and Vegetables',
        imgName: 'images/cat3.jpg',
      ),
      Category(
        name: 'Meats, Fish and Poultry',
        imgName: 'images/cat4.jpg',
      ),
      Category(
        name: 'Beverages',
        imgName: 'images/cat5.jpg',
      ),
      Category(
        name: 'Bakery and Snakes',
        imgName: 'images/cat6.jpeg',
      ),
      Category(
        name: 'Medicines and Personal Care',
        imgName: 'images/cat7.jpg',
      ),
    ];
  }
}
