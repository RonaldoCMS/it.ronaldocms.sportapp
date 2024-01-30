import 'package:bloc/bloc.dart';
import 'package:football/http/http_request.dart';
import 'package:football/http/response_leagues.dart';
import 'package:meta/meta.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<Response_Leagues?> {
  LeaguesCubit() : super(null);

  onFetch() async {
    var leagues = await HttpRequest.getLeagues();
    emit(leagues);
  }
}
