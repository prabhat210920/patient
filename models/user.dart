class UserModel {
  final int id;
  final String mobile;
  final String email;
  final DoctorProfile? doctorProfile;
  final PartnerProfile? partnerProfile;
  final List<PatientProfile> patientProfiles;
  final DefaultProfile defaultProfile;

  UserModel({
    required this.id,
    required this.mobile,
    required this.email,
    this.doctorProfile,
    this.partnerProfile,
    required this.patientProfiles,
    required this.defaultProfile,
  });

  // Factory method to create an instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      mobile: json['mobile'],
      email: json['email'],
      doctorProfile: json['doctor_profile'] != null
          ? DoctorProfile.fromJson(json['doctor_profile'])
          : null,
      partnerProfile: json['partner_profile'] != null
          ? PartnerProfile.fromJson(json['partner_profile'])
          : null,
      patientProfiles: (json['patient_profiles'] as List)
          .map((e) => PatientProfile.fromJson(e))
          .toList(),
      defaultProfile: DefaultProfile.fromJson(json['default_profile']),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mobile': mobile,
      'email': email,
      'doctor_profile': doctorProfile?.toJson(),
      'partner_profile': partnerProfile?.toJson(),
      'patient_profiles': patientProfiles.map((e) => e.toJson()).toList(),
      'default_profile': defaultProfile.toJson(),
    };
  }
}

// Define the DoctorProfile class if it has specific fields
class DoctorProfile {
  DoctorProfile();

  factory DoctorProfile.fromJson(Map<String, dynamic> json) {
    return DoctorProfile();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

// Define the PartnerProfile class if it has specific fields
class PartnerProfile {
  PartnerProfile();

  factory PartnerProfile.fromJson(Map<String, dynamic> json) {
    return PartnerProfile();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PatientProfile {
  final int profileId;
  final String fullName;
  final bool isPrimary;
  final String url;

  PatientProfile({
    required this.profileId,
    required this.fullName,
    required this.isPrimary,
    required this.url,
  });

  factory PatientProfile.fromJson(Map<String, dynamic> json) {
    return PatientProfile(
      profileId: json['profile_id'],
      fullName: json['full_name'],
      isPrimary: json['is_primary'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_id': profileId,
      'full_name': fullName,
      'is_primary': isPrimary,
      'url': url,
    };
  }
}

class DefaultProfile {
  final String? defaultProfile;
  final int profileId;
  final String url;

  DefaultProfile({
    this.defaultProfile,
    required this.profileId,
    required this.url,
  });

  factory DefaultProfile.fromJson(Map<String, dynamic> json) {
    return DefaultProfile(
      defaultProfile: json['default_profile'],
      profileId: json['profile_id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'default_profile': defaultProfile,
      'profile_id': profileId,
      'url': url,
    };
  }
}
