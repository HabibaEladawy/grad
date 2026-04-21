import '../datasources/parent_profile_remote_data_source.dart';
import '../models/parent_profile_model.dart';

class ParentProfileRepository {
  final ParentProfileRemoteDataSource remote;

  ParentProfileRepository(this.remote);

  Future<ParentProfileModel> getMe() => remote.getMe();

  Future<ParentChildModel> addChild({
    required String childName,
    required String gender,
    required DateTime birthDate,
  }) =>
      remote.addChild(childName: childName, gender: gender, birthDate: birthDate);
}

