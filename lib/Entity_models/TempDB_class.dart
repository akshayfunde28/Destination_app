import 'package:turisamapp/Entity_models/package_search.dart';

class TempDB {
  static List<Place> getPlaces() {
    return [
// Done
      Place(
          filter: "Food",
          title: "south Indian",
          address: "upsouth Karvenagar, Pune",
          city: "Karvenagar",
        description:
        "Famous for serving authentic South Indian dishes full of rich flavors.Known for quick and tasty snacks that delight food lovers.A perfect spot to enjoy freshly brewed traditional filter coffee.Popular among students and travelers for its warm and vibrant atmosphere."  ,
        price: 180.0,
          rating: 4.1,
          imagePath: "assets/images/southIndian.jpg",
         ),
// Done
      Place(
        filter: "Adventure",
        title: "Indoor rock climbing ",
        address: "Rocksport Indoor Climbing, Karve Nagar, Pune",
        city: "Karvenagar",
        description: "Rocksport Indoor Climbing in Karve Nagar is the ultimate destination for adventure seekers and fitness lovers who want to experience the thrill of climbing in a safe and fun environment. Designed with world-class facilities, the center offers multiple climbing walls of varying heights and difficulty levels, making it suitable for beginners as well as seasoned climbers. Each session is guided by professional trainers who ensure safety while helping participants improve their strength, flexibility, and technique. The facility is equipped with harnesses, ropes, and other safety gear, so you can focus purely on the adventure. Whether you’re looking for a unique weekend activity, an exciting workout alternative, or a group outing with friends, Rocksport provides a perfect blend of adrenaline, challenge, and enjoyment right in the heart of Karve Nagar.",
        price: 800.0,
        rating: 3.5,
        imagePath: "assets/images/RockClimbing.jpg",
      ),


      // Done
      Place(
        filter: "Food",
        title: "Spicy Curray",
        address: "Khandeshi katta ,Karvenagar-411052, Pune",
        city: "Karvenagar",
        description:
        "A rich and flavorful dish made with a perfect blend of traditional spices Slow-cooked to bring out deep aromas and authentic taste.Thick, creamy gravy pairs perfectly with rice or bread.A must-try for those who love bold and spicy Indian flavors.",
        price: 150.0,
        rating: 4.6,
        imagePath: "assets/images/SpiceCurry.png",
      ),
// Done
      Place(
          filter: "Food",
          title: "North indian dishes",
          address: "Joy hotel Karvenagar-411052, Pune",
          city: "Karvenagar",
        description: "Joy’s Veg and Non-Veg Restaurant in Karve Nagar offers authentic Marathwada chicken and mutton thalis, a wide range of vegetarian and non-vegetarian dishes, and a special offer of a free chicken tandoor on the purchase of 5 thalis.",
        price: 250.0,
          rating: 3.2,
          imagePath: "assets/images/North_indian_dishes.jpg",
          ),

      //
      Place(
        filter: "Culture",
        title: "Jogging Park",
        address: "Karvenagar, Pune",
        city: "Karvenagar",
        description:
        "A peaceful public park popular for morning walks, jogging, and yoga.",
        price: 0.0,
        rating: 4.3,
        imagePath: "assets/images/SpiceCurry.png",
      ),

      // Kothrud
      Place(
        filter: "OutDoors",
        title: "Wadeshwar",
        address: "Kothrud, Pune",
        city: "Kothrud",
        description:
        "Popular spot for Maharashtrian food, misal pav, and thalipeeth.",
        price: 200.0,
        rating: 4.7,
        imagePath: "assets/images/SpiceCurry.png",
      ),
      Place(
        filter: "Food",
        title: "MIT College Campus",
        address: "Kothrud, Pune",
        city: "Kothrud",
        description:
        "One of Pune's famous educational campuses with greenery and student vibes.",
        price: 0.0,
        rating: 4.5,
        imagePath: "assets/images/SpiceCurry.png",
      ),

      // Shivajinagar
      Place(
        filter: "Culture",
        title: "Goodluck Café",
        address: "Shivajinagar, Pune",
        city: "Shivajinagar",
        description:
        "Famous Irani café serving bun maska, chai, and keema pav.",
        price: 250.0,
        rating: 4.8,
        imagePath: "assets/images/SpiceCurry.png",
      ),
      Place(
        filter: "Adventure",
        title: "Shivaji Nagar Market",
        address: "Shivajinagar, Pune",
        city: "Shivajinagar",
        description:
        "Bustling market known for shopping, street food, and local culture.",
        price: 0.0,
        rating: 4.2,
        imagePath: "assets/images/SpiceCurry.png",
      ),

      // Deccan
      Place(
        filter: "Food",
        title: "Fergusson College Road",
        address: "Deccan, Pune",
        city: "Deccan",
        description:
        "A vibrant street filled with eateries, shopping, and youth hangouts.",
        price: 300.0,
        rating: 4.6,
        imagePath: "assets/images/SpiceCurry.png",
      ),
      Place(
        filter: "Culture",
        title: "Deccan Gymkhana",
        address: "Deccan, Pune",
        city: "Deccan",
        description:
        "Famous sports and cultural hub in Pune with strong heritage.",
        price: 0.0,
        rating: 4.4,
        imagePath: "assets/images/SpiceCurry.png",
      ),

      // Hinjewadi
      Place(
        filter: "Food",
        title: "Xion Mall",
        address: "Hinjewadi, Pune",
        city: "Hinjewadi",
        description:
        "Popular mall for shopping, food courts, and entertainment in IT hub.",
        price: 500.0,
        rating: 4.3,
        imagePath: "assets/images/SpiceCurry.png",
      ),
      Place(
        filter: "Food",
        title: "Rajiv Gandhi Infotech Park",
        address: "Hinjewadi, Pune",
        city: "Hinjewadi",
        description:
        "Major IT hub of Pune with offices of top tech companies.",
        price: 0.0,
        rating: 4.7,
        imagePath: "assets/images/SpiceCurry.png",
      ),
    ];
  }
}
