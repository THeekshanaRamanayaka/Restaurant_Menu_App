import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetailScreen({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              foodItem.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildDetailsContent(context),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            foodItem.image,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: _buildDetailsContent(context),
        ),
      ],
    );
  }

  Widget _buildDetailsContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodItem.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            foodItem.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${foodItem.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    foodItem.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement order functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${foodItem.name} added to cart')),
                );
              },
              child: const Text('Order Now'),
            ),
          ),
        ],
      ),
    );
  }
}