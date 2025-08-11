class PatientReport {
  final String name;
  final String age;
  final String gender;
  final bool isPregnant;
  final String weight;
  final String height;
  final String mainComplaint;
  final String medicalHistory;
  final String examinationFindings;
  final String additionalNotes;
  final DateTime timestamp;
  final List<String> imageFileNames;
  final String? audioFileName;

  final String heartSoundDiagnosis;
  final double heartSoundConfidence;
  final String imageAnalysisSummary;
  final double imageConfidence;
  final String clinicalInsight;

  PatientReport({
    required this.name,
    required this.age,
    required this.gender,
    required this.isPregnant,
    required this.weight,
    required this.height,
    required this.mainComplaint,
    required this.medicalHistory,
    required this.examinationFindings,
    required this.additionalNotes,
    required this.heartSoundDiagnosis,
    required this.heartSoundConfidence,
    required this.imageAnalysisSummary,
    required this.imageConfidence,
    required this.clinicalInsight,
    required this.timestamp,
    required this.imageFileNames,
    this.audioFileName,
  });
}
