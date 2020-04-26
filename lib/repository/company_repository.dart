import 'package:pinjollist/repository/company_api_provider.dart';
import 'package:pinjollist/model/company.dart';

class CompanyRepository {
  CompanyApiProvider _apiProvider = CompanyApiProvider();

  Future<CompaniesResponse> getCompanies() {
    return _apiProvider.getCompanies();
  }
}
