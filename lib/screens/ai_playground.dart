import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:luminixdx_web_ui_en/models/patient_input.dart';
import 'package:luminixdx_web_ui_en/screens/resultsscreen.dart';

class AIPlaygroundScreen extends StatefulWidget {
  const AIPlaygroundScreen({super.key});

  @override
  State<AIPlaygroundScreen> createState() => _AIPlaygroundScreenState();
}

class _AIPlaygroundScreenState extends State<AIPlaygroundScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _age = '';
  String _gender = '';
  String _weight = '';
  String _height = '';
  String _complaint = '';
  String _history = '';
  String _examination = '';
  String _notes = '';
  bool _isPregnant = false;
  String _timestamp = '';

  List<PlatformFile> _imageFiles = [];
  PlatformFile? _audioFile;

  double _progress = 0;
  bool _isLoading = false;

  void _simulateAnalysis() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
      _progress = 0;
      _timestamp = DateTime.now().toString();
    });

    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      setState(() {
        _progress = i.toDouble();
      });
    }

    setState(() {
      _isLoading = false;
    });

    final patientReport = PatientReport(
      name: _name,
      age: _age,
      gender: _gender,
      isPregnant: _isPregnant,
      weight: _weight,
      height: _height,
      mainComplaint: _complaint,
      medicalHistory: _history,
      examinationFindings: _examination,
      additionalNotes: _notes,
      heartSoundDiagnosis: 'Abnormal murmur detected',
      heartSoundConfidence: 97.7,
      imageAnalysisSummary:
          'Possible cardiomegaly signs detected in chest X-ray.',
      imageConfidence: 91.2,
      clinicalInsight:
          'Patient exhibits signs of mitral valve regurgitation. Recommend immediate echocardiography and cardiologist referral.',
      timestamp: DateTime.now(),
      imageFileNames: ['image1.jpg', 'image2.png'],
      audioFileName: _audioFile?.name,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PatientReportScreen(report: patientReport),
      ),
    );
  }

  Future<void> _pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'dcm'],
      withData: true,
    );

    if (result != null) {
      setState(() {
        _imageFiles = result.files;
      });
    }
  }

  Future<void> _pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav'],
      withData: true,
    );

    if (result != null) {
      setState(() {
        _audioFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final isMobile = MediaQuery.of(context).size.width < 600;
    final horizontalPadding = isMobile ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF054753), Color(0xFF2D9E98)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'AI Diagnostic Playground',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Try the Intelligence Behind LumenexHx',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF054753),
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Upload patient data, heart sounds or images and analyze them instantly.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: colors.onSurface.withOpacity(0.75),
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 28),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  shadowColor: colors.primary.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 28,
                      vertical: isMobile ? 20 : 24,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            label: 'Patient Name',
                            onSaved: (v) => _name = v ?? '',
                            validatorMsg: 'Please enter patient name',
                          ),
                          _buildTextField(
                            label: 'Age',
                            keyboardType: TextInputType.number,
                            onSaved: (v) => _age = v ?? '',
                            validatorMsg: 'Enter a valid age',
                            isNumber: true,
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Gender',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'male', child: Text('Male')),
                              DropdownMenuItem(
                                  value: 'female', child: Text('Female')),
                            ],
                            value: _gender.isEmpty ? null : _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value ?? '';
                                if (_gender != 'female') _isPregnant = false;
                              });
                            },
                            onSaved: (value) => _gender = value ?? '',
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'Select gender'
                                    : null,
                          ),
                          if (_gender == 'female') ...[
                            const SizedBox(height: 12),
                            CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Is the patient pregnant?'),
                              value: _isPregnant,
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: colors.primary,
                              onChanged: (value) {
                                setState(() {
                                  _isPregnant = value ?? false;
                                });
                              },
                            ),
                          ],
                          const SizedBox(height: 8),
                          _buildTextField(
                            label: 'Weight (kg)',
                            keyboardType: TextInputType.number,
                            onSaved: (v) => _weight = v ?? '',
                            validatorMsg: 'Enter a valid weight',
                            isDouble: true,
                          ),
                          _buildTextField(
                            label: 'Height (cm)',
                            keyboardType: TextInputType.number,
                            onSaved: (v) => _height = v ?? '',
                            validatorMsg: 'Enter a valid height',
                            isDouble: true,
                          ),
                          _buildTextField(
                            label: 'Main Complaint',
                            onSaved: (v) => _complaint = v ?? '',
                            validatorMsg: 'Please enter complaint',
                            maxLines: 2,
                          ),
                          _buildTextField(
                            label: 'Medical History',
                            onSaved: (v) => _history = v ?? '',
                            maxLines: 2,
                            isOptional: true,
                          ),
                          _buildTextField(
                            label: 'Examination Findings',
                            onSaved: (v) => _examination = v ?? '',
                            maxLines: 2,
                            isOptional: true,
                          ),
                          _buildTextField(
                            label: 'Additional Notes (Optional)',
                            onSaved: (v) => _notes = v ?? '',
                            maxLines: 2,
                            isOptional: true,
                          ),
                          const SizedBox(height: 26),
                          _buildGradientButton(
                            icon: Icons.image,
                            label: 'Upload Images',
                            onPressed: _pickImages,
                            colors: [
                              const Color(0xFF054753),
                              const Color(0xFF2D9E98)
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (_imageFiles.isNotEmpty)
                            Wrap(
                              spacing: 12,
                              runSpacing: 10,
                              children: _imageFiles
                                  .map((file) =>
                                      _buildFileChip(file.name, Icons.image))
                                  .toList(),
                            ),
                          const SizedBox(height: 24),
                          _buildGradientButton(
                            icon: Icons.audiotrack,
                            label: 'Upload Heart Sound',
                            onPressed: _pickAudio,
                            colors: [
                              const Color(0xFF054753),
                              const Color(0xFF2D9E98)
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (_audioFile != null)
                            _buildFileChip(_audioFile!.name, Icons.audiotrack),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: _isLoading ? null : _simulateAnalysis,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF054753), Color(0xFF2D9E98)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 48,
                            child: _isLoading
                                ? const Text(
                                    'Analyzing...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                : const Text(
                                    'Analyze Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      ),
                      if (_isLoading) ...[
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: _progress / 100,
                            minHeight: 6,
                            backgroundColor:
                                colors.surfaceVariant.withOpacity(0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF2D9E98)),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    FormFieldSetter<String>? onSaved,
    String? validatorMsg,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool isOptional = false,
    bool isNumber = false,
    bool isDouble = false,
  }) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        onSaved: onSaved,
        validator: (value) {
          if (isOptional) return null;
          if (value == null || value.isEmpty) return validatorMsg;
          if (isNumber && int.tryParse(value) == null) {
            return 'Enter a valid number';
          }
          if (isDouble && double.tryParse(value) == null) {
            return 'Enter a valid number';
          }
          return null;
        },
        style: TextStyle(color: colors.onSurface, fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: colors.primary.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          filled: true,
          fillColor: colors.surfaceVariant.withOpacity(0.15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required List<Color> colors,
  }) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0, //
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            height: 48,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 22, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFileChip(String fileName, IconData icon) {
    final colors = Theme.of(context).colorScheme;
    return Chip(
      label: Text(
        fileName,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: colors.onSurface,
        ),
      ),
      avatar: Icon(icon, size: 20, color: colors.primary),
      backgroundColor: colors.surfaceVariant.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}
