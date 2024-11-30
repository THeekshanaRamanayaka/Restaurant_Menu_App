import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;
  final VoidCallback onTap;

  const FoodItemCard({
    super.key,
    required this.foodItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                foodItem.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${foodItem.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          Text(
                            foodItem.rating.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}