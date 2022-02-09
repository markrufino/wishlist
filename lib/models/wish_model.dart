import 'package:cloud_firestore/cloud_firestore.dart';

class WishModel {
  final String details;
  final bool checked;
  final Timestamp timestamp;
  WishModel(this.details, this.checked, this.timestamp);
}
