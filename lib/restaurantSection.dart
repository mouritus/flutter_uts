import 'package:flutter/material.dart';
import 'package:flutter_uts/restaurantClass.dart';
import 'allRestaurantPage.dart';

class RestaurantSection extends StatelessWidget {
  final String title;
  final List<Restaurant> restaurants;

  const RestaurantSection(this.title, this.restaurants);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextButton(
                  child: Text('See All'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllRestaurantsPage(restaurants)),
                    );
                  },
                ),
              ],
            ),
          ),

          
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length > 5 ? 5 : restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              restaurants[index].imageUrl,
                              fit: BoxFit.cover, 
                            ),
                          ),
                        ),
                        Text(
                          restaurants[index].name.length > 15 
                            ? '${restaurants[index].name.substring(0, 15)}...' 
                            : restaurants[index].name,
                        ),
                        Text(
                          restaurants[index].address.length > 20 
                            ? '${restaurants[index].address.substring(0, 20)}...' 
                            : restaurants[index].address,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
