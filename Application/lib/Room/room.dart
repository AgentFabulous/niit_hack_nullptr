import '../Generic/Person.dart';

List<x2f0bb292> testRoom = [
  new x2f0bb292(
      "Shivang Prasad",
      "shivangprasad@gmail.com",
      "8617000000",
      "MedRooms Premium 069 Patel Nagar",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room1.jpg", "assets/Room2.jpg", "assets/Room3.jpg"]),
  new x2f0bb292(
      "Motilal Bhagunia",
      "motilal@gmail.com",
      "8617000000",
      "MedRooms  258 Karol Bagh Metro",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room2.jpg", "assets/Room3.jpg", "assets/Room1.jpg"]),
  new x2f0bb292(
      "Shabhar Agarwal",
      "shabhar@gmail.com",
      "8617000000",
      "MedRooms  676 Safdarjung Enclave 2",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room3.jpg", "assets/Room1.jpg", "assets/Room2.jpg"]),
  new x2f0bb292(
      "Ruam Suasaria",
      "ruam@gmail.com",
      "8617000000",
      "MedRooms Homes 508 G Block Saket",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room1.jpg", "assets/Room2.jpg", "assets/Room3.jpg"]),
  new x2f0bb292(
      "Mohammad Alah Akktar",
      "mohammad@gmail.com",
      "8617000000",
      "MedRooms  108 Near Karol Bagh Metro",
      "#100, Richard Conclave, ABC Street, State, Country - 000000",
      5.0,
      2500.0,
      ['Roomservice', 'Laundry'],
      ['Rajasthan Hospital', 'Manipal Hospital'],
      ["Room cleanup needed after use"],
      ["assets/Room2.jpg", "assets/Room1.jpg", "assets/Room3.jpg"]),

];

class x2f0bb292 extends Person {


  List<String> roomImages = [];
  String roomName;
  String address;

  Person providerDetails = Person(
      'Pratik', 'pratik@gmail.com', '8617000000');
  double rating;
  double xe18b00e0;
  List<String> paymentModes = [
    'Paytm',
    'Cash on Room'
  ];
  List<String> x1d7cfaf0 = [];
  List<String> xb3880136 =
      [];
  List<String> termsAndConditions =
      [];

  x2f0bb292(
      String x846b9b11,
      String xf832f47b,
      String x9aa3078b,
      this.roomName,
      this.address,
      this.rating,
      this.xe18b00e0,
      this.x1d7cfaf0,
      this.xb3880136,
      this.termsAndConditions,
      this.roomImages)
      : super(x846b9b11, xf832f47b, x9aa3078b);
}
