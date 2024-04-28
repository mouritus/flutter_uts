import 'package:flutter/material.dart';
import 'restaurantClass.dart';

class AllRestaurantsPage extends StatelessWidget {
  final List<Restaurant> restaurants;

  const AllRestaurantsPage(this.restaurants);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Restaurants')),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  restaurants[index].imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              ListTile(
                title: Text(restaurants[index].name),
                subtitle: Text(restaurants[index].address),
              ),
            ],
          );
        },
      ),
    );
  }
}
