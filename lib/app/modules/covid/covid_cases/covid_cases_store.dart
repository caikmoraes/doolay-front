import 'package:doolay_front/app/shared/model/covid_data.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CovidCasesStore extends NotifierStore<Exception, int> {
  final CovidRepository covidRepository;

  CovidCasesStore(this.covidRepository) : super(0);

  Future fetchCases() async {
    setLoading(true);
    try {
      CovidData covid = await covidRepository.fetchCovidCases();
      await Future.delayed(const Duration(seconds: 1));
      if (covid.confirmed != null) {
        update(covid.confirmed!);
      } else {
        update(0);
      }
    } catch (e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }
}

class CovidRepository {
  Future<CovidData> fetchCovidCases() async {
    var url =
        Uri.parse('https://covid19-brazil-api.now.sh/api/report/v1/brazil');
    WebClient client = WebClient();
    var json = await client.fetchCovidCases(url);
    return CovidData.fromJson(json['data']);
  }
}
