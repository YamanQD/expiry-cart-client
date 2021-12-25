import 'package:expiry_cart/categories_helper/category.dart';
import 'package:expiry_cart/categories_helper/products.dart';

class Utils {
  // categories generator
  static List<Category> get() {
    return [
      Category(
        name: 'Canned Food',
        imgName: 'images/cat1.jpg',
        subCategories: [
          Products(
            name: 'category',
            imgName: 'images/cat1.jpg',
          ),
          Products(
            name: 'category',
            imgName: 'images/cat1.jpg',
          ),
          Products(
            name: 'category',
            imgName: 'images/cat1.jpg',
          ),
        ],
      ),
      Category(
        name: 'Dairy and Eggs',
        imgName: 'images/cat2.jpeg',
        subCategories: [],
      ),
      Category(
        name: 'Fruits and Vegetables',
        imgName: 'images/cat3.jpg',
        subCategories: [],
      ),
      Category(
        name: 'Meats, Fish and Poultry',
        imgName: 'images/cat4.jpg',
        subCategories: [],
      ),
      Category(
        name: 'Beverages',
        imgName: 'images/cat5.jpg',
        subCategories: [],
      ),
      Category(
        name: 'Bakery and Snacks',
        imgName: 'images/cat6.jpeg',
        subCategories: [],
      ),
      Category(
        name: 'Medicines and Personal Care',
        imgName: 'images/cat7.jpg',
        subCategories: [],
      ),
    ];
  }
}
