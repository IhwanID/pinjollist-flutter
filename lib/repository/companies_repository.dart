import 'package:pinjollist/repository/companies_api_provider.dart';
import 'package:pinjollist/model/companies.dart';

class CompaniesRepository {
  CompaniesApiProvider _apiProvider = CompaniesApiProvider();

  Future<CompaniesResponse> getCompanies() {
    return _apiProvider.getCompanies();
  }
}
