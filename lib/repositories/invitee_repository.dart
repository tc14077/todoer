import 'package:todoer/data/dao/invitee_dao.dart';
import 'package:todoer/data/models/invitees.dart';

import '../data/database/app_database.dart';
import 'base_repository.dart';

class InviteeRepository extends BasePersistRepository<Invitees, Invitee> {
  final InviteeDao inviteeDao;
  InviteeRepository(this.inviteeDao) : super(inviteeDao);

  Future<List<Invitee>> getInviteesInEvent({
    required Event event,
  }) {
    return inviteeDao.getInviteesInEvent(event);
  }
}
