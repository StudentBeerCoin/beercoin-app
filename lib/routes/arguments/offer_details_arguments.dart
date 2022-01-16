import 'package:beercoin/entity/offer.dart';
import 'package:beercoin/entity/user.dart';

class OfferDetailsArguments {
  final Offer offer;
  final User user;

  OfferDetailsArguments(this.offer, this.user);
}