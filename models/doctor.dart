class Doctor {
  final int id;
  final String fullName;
  final BasicInfo basicInfo;
  final String url;
  final String slug;
  final double? averageRating;

  Doctor({
    required this.id,
    required this.fullName,
    required this.basicInfo,
    required this.url,
    required this.slug,
    this.averageRating,
  });

  // Factory method to parse JSON into a Doctor object
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      fullName: json['full_name'],
      basicInfo: BasicInfo.fromJson(json['basic_info']),
      url: json['url'],
      slug: json['slug'],
      averageRating: json['average_rating'] != null
          ? double.tryParse(json['average_rating'].toString())
          : null,
    );
  }
}

class BasicInfo {
  final int id;
  final String profilePic;
  final String degreeToDisplay;
  final int experienceNumYear;
  final String professionalFee;
  final String? clinicHospitalName;
  final String? clinicHospitalLogo;
  final Specialty specialty;
  final List<Language> languages;

  BasicInfo({
    required this.id,
    required this.profilePic,
    required this.degreeToDisplay,
    required this.experienceNumYear,
    required this.professionalFee,
    this.clinicHospitalName,
    this.clinicHospitalLogo,
    required this.specialty,
    required this.languages,
  });

  // Factory method to parse JSON into a BasicInfo object
  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      id: json['id'],
      profilePic: json['profile_pic'],
      degreeToDisplay: json['degree_to_display'],
      experienceNumYear: json['experience_num_year'],
      professionalFee: json['professional_fee'],
      clinicHospitalName: json['clinic_hospital_name'],
      clinicHospitalLogo: json['clinic_hospital_logo'],
      specialty: Specialty.fromJson(json['specialty']),
      languages: (json['languages'] as List)
          .map((lang) => Language.fromJson(lang))
          .toList(),
    );
  }
}

class Specialty {
  final int id;
  final String name;

  Specialty({
    required this.id,
    required this.name,
  });

  // Factory method to parse JSON into a Specialty object
  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Language {
  final int id;
  final String name;

  Language({
    required this.id,
    required this.name,
  });

  // Factory method to parse JSON into a Language object
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      name: json['name'],
    );
  }
}
