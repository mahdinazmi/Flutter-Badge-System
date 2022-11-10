import 'package:badge/feature/data/datasources/remote/badge/badge_remote_data_source.dart';
import 'package:badge/feature/data/models/badge/badge_model.dart';
import 'package:badge/feature/domain/entities/badge/badge_entity.dart';
import '../../../domain/repositories/badge/badge_repository.dart';

class BadgeRepositoryImpl implements BadgeRepository {
  final BadgeRemoteDataSource remoteDataSource;

  BadgeRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<void> registerBadge(BadgeModel badge) async {
    await remoteDataSource.registerBadge(badge);
  }

  @override
  Future<List<Badge>> fetchBadges(String userId) async {
    return await remoteDataSource.fetchBadges(userId);
  }
  

}