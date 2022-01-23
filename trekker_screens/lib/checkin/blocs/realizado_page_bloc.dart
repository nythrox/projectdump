import 'package:trekkers/checkin/repositories/checkin_participants_repository.dart';
import 'package:trekkers/events/models/lote.dart';

class RealizadoPageBloc {
  final CheckinParticipantsRepository _checkinParticipantsRepository;
  Future<List<Lote>> lotes;

  RealizadoPageBloc(int id, this._checkinParticipantsRepository) {
    lotes = getRealizadoUsers(id);
  }

  Future<List<Lote>> getRealizadoUsers(int id) async {
    List<Lote> res = await _checkinParticipantsRepository.getEventLotes(id);

    //pegar a lista de lotes, e para cada Lote na lista filtrar os LoteUser para que fiquem apenas os com status == 2
    List<Lote> lotes = res.map((Lote lote) {
      List<LoteUser> usersPendentes =
          lote.users.where((user) => user.status == 2);
      Lote newLote = lote;
      newLote.users = usersPendentes;
      return newLote;
    }).toList();

    return lotes;
  }
}
