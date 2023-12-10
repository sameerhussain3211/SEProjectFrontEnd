import 'package:app7/widgets/propertydetails.dart';
import 'package:flutter/material.dart';

class viewproperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: propertyDetails(
          image1: Image.asset('assects/images/sunflower.jpg'),
          image2: Image.asset('assects/images/sunflower.jpg'),
          image3: Image.asset('assects/images/sunflower.jpg'),
          image4: Image.asset('assects/images/sunflower.jpg'),
          image5: Image.asset('assects/images/sunflower.jpg'),
          addressOfHouse: "Punjab,xyz,uyg,iii",
          roomsInHouse: 15,
          areaInSqFeet: 1000,
          priceOfHouseInMillions: 30,
          descriptionOfHouse:
              """In the quietude of the early morning, the sun began to cast its gentle glow over the sleepy town. The streets, adorned with quaint houses and blooming gardens, started to stir with the first signs of life. Birds fluttered from tree to tree, their melodic chirps harmonizing with the distant hum of awakening civilization.
          As the aroma of freshly brewed coffee wafted through the air, a sense of anticipation lingered, promising a day filled with possibilities.

In the heart of the town, a bustling marketplace came alive with vendors arranging their stalls, 
displaying an array of vibrant fruits, vegetables, and artisan crafts. The laughter of children echoed as they played near a bubbling fountain, their innocent joy contagious to all who passed by. The local bakery, 
known for its mouthwatering pastries, emanated an irresistible scent, drawing in passersby with promises of delectable treats."""),
    );
  }
}
