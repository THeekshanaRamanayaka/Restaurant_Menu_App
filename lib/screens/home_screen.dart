import 'package:flutter/material.dart';
import '../widgets/category_list.dart';
import '../widgets/food_item_card.dart';
import '../models/food_item.dart';
import 'food_detail_screen.dart';
import '../data/food_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Pizza';

  List<FoodItem> _getFilteredFoodItems() {
    return sampleFoodItems.where((item) {
      switch (_selectedCategory) {
        case 'Pizza':
          return item.name.toLowerCase().contains('pizza');
        case 'Burgers':
          return item.name.toLowerCase().contains('burger');
        case 'Salads':
          return item.name.toLowerCase().contains('salad');
        case 'Desserts':
          return item.name.toLowerCase().contains('cake') ||
              item.name.toLowerCase().contains('dessert');
        case 'Drinks':
          return item.name.toLowerCase().contains('drink') ||
              item.name.toLowerCase().contains('tea');
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              CategoryList(
                categories: foodCategories,
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _getFilteredFoodItems().length,
                  itemBuilder: (context, index) {
                    final foodItem = _getFilteredFoodItems()[index];
                    return FoodItemCard(
                      foodItem: foodItem,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailScreen(foodItem: foodItem),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}