import 'package:flutter/material.dart';
import 'package:luminixdx_web_ui_en/models/patient_input.dart';

class PatientReportScreen extends StatelessWidget {
  final PatientReport report;

  const PatientReportScreen({required this.report, super.key});

  Widget _buildSectionTitle(String title, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF054753),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black54,
                fontSize: fontSize - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfidenceChip(
      String label, double confidence, double fontSize) {
    Color color;
    if (confidence >= 90) {
      color = Colors.green;
    } else if (confidence >= 70) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      child: Text(
        '$label: ${confidence.toStringAsFixed(1)}%',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime ts = report.timestamp;
    final formattedDate =
        "${ts.day.toString().padLeft(2, '0')}/${ts.month.toString().padLeft(2, '0')}/${ts.year}";
    final formattedTime =
        "${ts.hour.toString().padLeft(2, '0')}:${ts.minute.toString().padLeft(2, '0')}";

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final titleFont = isMobile ? 16.0 : 18.0;
    final normalFont = isMobile ? 13.5 : 15.0;
    final headingFont = isMobile ? 20.0 : 22.0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Patient Report",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF054753),
        elevation: 10,
        shadowColor: const Color(0xFF054753).withOpacity(0.4),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: isMobile ? 16 : 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lumenex Health - Patient Report',
              style: TextStyle(
                fontSize: headingFont,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF054753),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Generated on $formattedDate at $formattedTime",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: isMobile ? 12 : 13,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 24,
                  vertical: isMobile ? 14 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFont,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow("Name", report.name, normalFont),
                    _buildInfoRow("Age", report.age, normalFont),
                    _buildInfoRow(
                      "Gender",
                      report.gender + (report.isPregnant ? " (Pregnant)" : ""),
                      normalFont,
                    ),
                    _buildInfoRow("Weight", "${report.weight} kg", normalFont),
                    _buildInfoRow("Height", "${report.height} cm", normalFont),
                    _buildInfoRow(
                        "Main Complaint", report.mainComplaint, normalFont),
                    if (report.medicalHistory.isNotEmpty)
                      _buildInfoRow(
                          "Medical History", report.medicalHistory, normalFont),
                    if (report.examinationFindings.isNotEmpty)
                      _buildInfoRow(
                        "Examination Findings",
                        report.examinationFindings,
                        normalFont,
                      ),
                    if (report.additionalNotes.isNotEmpty)
                      _buildInfoRow("Additional Notes", report.additionalNotes,
                          normalFont),
                  ],
                ),
              ),
            ),
            _buildSectionTitle("Heart Sound Analysis", titleFont),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 14 : 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.heartSoundDiagnosis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: normalFont,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildConfidenceChip(
                      "Confidence",
                      report.heartSoundConfidence,
                      normalFont,
                    ),
                  ],
                ),
              ),
            ),
            _buildSectionTitle("Image Analysis", titleFont),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 14 : 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.imageAnalysisSummary,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: normalFont,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildConfidenceChip(
                      "Confidence",
                      report.imageConfidence,
                      normalFont,
                    ),
                  ],
                ),
              ),
            ),
            _buildSectionTitle("Clinical Insight (AI)", titleFont),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 14 : 18),
                child: Text(
                  report.clinicalInsight,
                  style: TextStyle(fontSize: normalFont, height: 1.3),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
