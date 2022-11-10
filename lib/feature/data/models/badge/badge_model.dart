import 'package:badge/feature/domain/entities/badge/badge_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BadgeModel {
  int ? id;
  int ? registeredBadgesCount;
  String ? title;
  String ? userId;

  BadgeModel({
    this.id,
    this.title,
    this.userId,
    this.registeredBadgesCount
  });

  
  Map < String, dynamic > toMap() {
    var map = < String, dynamic > {};
    map["title"] = title;
    map["userId"] = userId;
    map["id"] = id;
    return map;
  }

  BadgeModel.fromDocument(DocumentSnapshot document) :
    id = document.get('id'),
    userId = document.get('userId'),
    title = document.get('title');


  Badge toEntity() => Badge(
    id: id,
    title: title,
    userId: userId,
    registeredBadgesCount: registeredBadgesCount
  );

  void setRegisteredBadgesCount(int count) {
    registeredBadgesCount = count;
  }

}