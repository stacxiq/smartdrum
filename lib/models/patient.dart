import 'dart:convert';

class Patient {
  final String id;
  final String patientName;
  final String gender;
  final String age;
  final String phone;
  final String chronicDiseases;
  final String status;
  final String doctorName;
  final String level;
  final String room;
  final String ward;
  final String doctor;
  final String bloodGroup;
  final String decision;

  Patient({
    required this.id,
    required this.patientName,
    required this.gender,
    required this.age,
    required this.phone,
    required this.chronicDiseases,
    required this.status,
    required this.ward,
    required this.doctorName,
    required this.level,
    required this.room,
    required this.doctor,
    required this.bloodGroup,
    required this.decision,
  });

  Patient copyWith({
    String? id,
    String? patientName,
    String? gender,
    String? age,
    String? phone,
    String? chronicDiseases,
    String? status,
    String? ward,
    String? doctor,
    String? bloodGroup,
    String? decision,
    String? doctorName,
    String? level,
    String? room,
  }) {
    return Patient(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      phone: phone ?? this.phone,
      chronicDiseases: chronicDiseases ?? this.chronicDiseases,
      status: status ?? this.status,
      ward: ward ?? this.ward,
      doctor: doctor ?? this.doctor,
      doctorName: doctorName ?? this.doctorName,
      level: level ?? this.level,
      room: room ?? this.room,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      decision: decision ?? this.decision,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientName': patientName,
      'gender': gender,
      'age': age,
      'phone': phone,
      'chronicDiseases': chronicDiseases,
      'status': status,
      'ward': ward,
      'doctor': doctor,
      'bloodGroup': bloodGroup,
      'decision': decision,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'] ?? '',
      patientName: map['patientName'] ?? '',
      gender: map['gender'] ?? '',
      age: map['age'] ?? '',
      phone: map['phone'] ?? '',
      chronicDiseases: map['chronicDiseases'] ?? '',
      status: map['status'] ?? '',
      doctorName: map['doctorName'] ?? '',
      level: map['level'] ?? '',
      room: map['room'] ?? '',
      ward: map['ward'] ?? '',
      doctor: map['doctor'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      decision: map['decision'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient(id: $id, patientName: $patientName, gender: $gender, age: $age, phone: $phone, chronicDiseases: $chronicDiseases, status: $status, ward: $ward, doctor: $doctor, bloodGroup: $bloodGroup, decision: $decision)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Patient &&
      other.id == id &&
      other.patientName == patientName &&
      other.gender == gender &&
      other.age == age &&
      other.phone == phone &&
      other.chronicDiseases == chronicDiseases &&
      other.status == status &&
      other.ward == ward &&
      other.doctor == doctor &&
      other.bloodGroup == bloodGroup &&
      other.decision == decision;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      patientName.hashCode ^
      gender.hashCode ^
      age.hashCode ^
      phone.hashCode ^
      chronicDiseases.hashCode ^
      status.hashCode ^
      ward.hashCode ^
      doctor.hashCode ^
      bloodGroup.hashCode ^
      decision.hashCode;
  }
}
