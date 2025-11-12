import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedJurusan = 'Informatika';
  String _selectedGender = 'Laki-laki';

  final List<String> _jurusan = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Industri'
  ];

  // Warna tema dark dengan aksen ungu
  final Color _backgroundColor = const Color(0xFF0A0A0A);
  final Color _cardColor = const Color(0xFF1A1A1A);
  final Color _primaryColor = const Color(0xFF8B5CF6);
  final Color _primaryDarkColor = const Color(0xFF7C3AED);
  final Color _accentColor = const Color(0xFFA78BFA);
  final Color _textPrimary = const Color(0xFFF8FAFC);
  final Color _textSecondary = const Color(0xFF94A3B8);
  final Color _textTertiary = const Color(0xFF64748B);

  // Warna dengan opacity yang sudah ditentukan
  final Color _primaryColor03 = Color.fromRGBO(139, 92, 246, 0.3);
  final Color _primaryColor02 = Color.fromRGBO(139, 92, 246, 0.2);
  final Color _primaryColor01 = Color.fromRGBO(139, 92, 246, 0.1);
  final Color _cardColor09 = Color.fromRGBO(26, 26, 26, 0.9);
  final Color _black03 = Color.fromRGBO(0, 0, 0, 0.3);
  final Color _black01 = Color.fromRGBO(0, 0, 0, 0.1);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: _primaryColor,
              onPrimary: Colors.black,
              surface: _cardColor,
              onSurface: _textPrimary,
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: _cardColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: _primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
      locale: const Locale('id', 'ID'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formatDate(_selectedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'id').format(date);
  }

  @override
  void initState() {
    super.initState();
    _dateController.text = _formatDate(_selectedDate);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: CustomScrollView(
        slivers: [
          // Header dengan SliverAppBar
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            foregroundColor: _textPrimary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Biodata',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _primaryDarkColor,
                      _primaryColor,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _primaryColor01,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _primaryColor01,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Konten utama
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Foto Profile Card
                    _buildProfileCard(),

                    const SizedBox(height: 24),

                    // Form Biodata
                    _buildBiodataForm(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _cardColor,
            _cardColor,
            _cardColor09,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _black03,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: _primaryColor02,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _primaryColor,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _primaryColor03,
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/foto_profil.jpeg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                _primaryColor,
                                _primaryDarkColor,
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.person_rounded,
                            size: 50,
                            color: _textPrimary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _primaryColor,
                    border: Border.all(color: _cardColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _black03,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: _textPrimary,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Foto Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Nama saya Fikriansyah NRP 152023138 dari Program Studi Informatika',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: _textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiodataForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: _cardColor,
        boxShadow: [
          BoxShadow(
            color: _black03,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: _primaryColor01,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Form
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _primaryColor02,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    color: _primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Informasi Data Pribadi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Isi data diri dengan lengkap dan benar',
              style: TextStyle(
                fontSize: 14,
                color: _textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // Formulir Biodata
            _buildFormField(
              label: 'Nama Lengkap',
              hintText: 'Masukkan nama lengkap',
              controller: _namaController,
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 20),

            _buildFormField(
              label: 'NIM',
              hintText: 'Masukkan NIM',
              controller: _nimController,
              icon: Icons.badge_outlined,
            ),
            const SizedBox(height: 20),

            // Program Studi
            _buildDropdownField(),
            const SizedBox(height: 20),

            // Jenis Kelamin
            _buildGenderField(),
            const SizedBox(height: 20),

            // Tanggal Lahir
            _buildDateField(),
            const SizedBox(height: 32),

            // Tombol Simpan
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _black01,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(
              color: _textPrimary,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: _textTertiary,
                fontSize: 16,
              ),
              prefixIcon: Icon(
                icon,
                color: _primaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFF252525),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Program Studi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _black01,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF252525),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedJurusan,
              underline: const SizedBox(),
              icon: Icon(Icons.arrow_drop_down_rounded,
                  color: _primaryColor, size: 28),
              dropdownColor: const Color(0xFF252525),
              style: TextStyle(
                fontSize: 16,
                color: _textPrimary,
              ),
              items: _jurusan.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      value,
                      style: TextStyle(color: _textPrimary),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedJurusan = newValue;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF252525),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _black01,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildGenderOption(
                    label: 'Laki-laki',
                    isSelected: _selectedGender == 'Laki-laki',
                    onTap: () => setState(() => _selectedGender = 'Laki-laki'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildGenderOption(
                    label: 'Perempuan',
                    isSelected: _selectedGender == 'Perempuan',
                    onTap: () => setState(() => _selectedGender = 'Perempuan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? _primaryColor02 : const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? _primaryColor : const Color(0xFF404040),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: isSelected ? _primaryColor : _textTertiary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? _primaryColor : _textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Lahir',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: _black01,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AbsorbPointer(
              child: TextFormField(
                controller: _dateController,
                readOnly: true,
                style: TextStyle(
                  color: _textPrimary,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today_rounded,
                    color: _primaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: _primaryColor,
                  ),
                  hintText: 'Pilih tanggal lahir',
                  hintStyle: TextStyle(
                    color: _textTertiary,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF252525),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: _primaryColor03,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: _accentColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Data berhasil disimpan!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              duration: const Duration(seconds: 3),
              backgroundColor: _cardColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: _primaryColor03),
              ),
            ),
          );
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save_rounded, size: 24),
            SizedBox(width: 12),
            Text(
              "Simpan Biodata",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
