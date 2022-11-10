import 'package:badge/feature/data/models/badge/badge_model.dart';
import 'package:badge/feature/domain/entities/badge/badge_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BadgeRemoteDataSource {
  Future < void > registerBadge(BadgeModel user);
  Future < List < Badge >> fetchBadges(String userId);
}

class BadgeRemoteDataSourceImpl implements BadgeRemoteDataSource {
  
  /// Register badge for a user
  @override
  Future < void > registerBadge(BadgeModel badge) async {
    await FirebaseFirestore.instance.collection('badge').add(badge.toMap());
  }

  @override
  Future < List < Badge >> fetchBadges(String userId) async {

    // Final user badges which user see
    List < Badge > finalBadges = [];

    // Get user badges by user id from firestore
    var tempBadges = await FirebaseFirestore.instance.collection('badge').where('userId', isEqualTo: userId).get();

    // Store badges id and count as map
    var map = {};
    for (var element in tempBadges.docs) {
      if (!map.containsKey(element.get('id'))) {
        map[element.get('id')] = 1;
      } else {
        map[element.get('id')] += 1;
      }
    }

    // Make distinct user badges by badge id
    var badgesId = < int > {};
    var distinctDocs = tempBadges.docs.where((b) => badgesId.add(b.get('id'))).toList();

    // Make user badges final list
    for (var badge in distinctDocs) {
      BadgeModel tempBadge = BadgeModel.fromDocument(badge);
      tempBadge.setRegisteredBadgesCount(map[badge.get('id')]);
      finalBadges.add(tempBadge.toEntity());
    }
    return finalBadges;
  }

}