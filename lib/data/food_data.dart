import '../models/food_item.dart';

final List<FoodItem> sampleFoodItems = [
  FoodItem(
    image: 'assets/images/pizza.jpg',
    name: 'Margherita Pizza',
    price: 12.99,
    rating: 4.5,
    description: 'Classic pizza with fresh mozzarella, tomatoes, and basil',
  ),
  FoodItem(
    image: 'assets/images/burger.jpg',
    name: 'Cheeseburger',
    price: 8.99,
    rating: 4.2,
    description: 'Juicy beef patty with melted cheese on a brioche bun',
  ),
  // Add more items to match categories
  FoodItem(
    image: 'assets/images/salad.jpg',
    name: 'Caesar Salad',
    price: 7.99,
    rating: 4.3,
    description: 'Fresh romaine lettuce with Caesar dressing and croutons',
  ),
  FoodItem(
    image: 'assets/images/dessert.jpg',
    name: 'Chocolate Cake',
    price: 5.99,
    rating: 4.7,
    description: 'Rich chocolate cake with creamy frosting',
  ),
  FoodItem(
    image: 'assets/images/drink.jpg',
    name: 'Iced Tea',
    price: 2.99,
    rating: 4.0,
    description: 'Refreshing cold-brewed iced tea',
  ),
];

final List<String> foodCategories = [
  'Pizza',
  'Burgers',
  'Salads',
  'Desserts',
  'Drinks',
];