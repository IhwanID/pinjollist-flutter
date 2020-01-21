// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesResponse _$CompaniesResponseFromJson(Map<String, dynamic> json) {
  return CompaniesResponse(
    json['status'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Companies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CompaniesResponseToJson(CompaniesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Companies _$CompaniesFromJson(Map<String, dynamic> json) {
  return Companies(
    registration: json['registration'] as String,
    companyName: json['company_name'] as String,
    website: json['website'] as String,
    platformName: json['platform_name'] as String,
    registrationType: json['registration_type'] as String,
    badanHukum: json['badan_hukum'] as String,
    isSyariah: json['is_syariah'] as bool,
    alamat: json['alamat'] as String,
  );
}

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'registration': instance.registration,
      'company_name': instance.companyName,
      'website': instance.website,
      'platform_name': instance.platformName,
      'registration_type': instance.registrationType,
      'badan_hukum': instance.badanHukum,
      'is_syariah': instance.isSyariah,
      'alamat': instance.alamat,
    };
