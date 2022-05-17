import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id})
      : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetail.routeName, arguments: {'id': id});
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';

      case Complexity.hard:
        return 'Hard';

      case Complexity.challenging:
        return 'Challenging';

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';

      case Affordability.pricey:
        return 'Pricey';

      case Affordability.luxurious:
        return 'Luxurious';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 220,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
