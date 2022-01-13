import 'package:beercoin/entity/beer.dart';
import 'package:beercoin/entity/user.dart';

class Offer {
  Beer beer;
  User seller;
  int amount;
  double price;

  Offer({
    required this.beer,
    required this.seller,
    required this.amount,
    required this.price,
  });
}
