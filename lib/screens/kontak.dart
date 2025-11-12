import 'package:flutter/material.dart';

class Kontak extends StatelessWidget {
  const Kontak({super.key});

  static const List<Map<String, String>> contacts = [
    {"name": "Asep", "phone": "+62 812-3456-7890", "initial": "AS"},
    {"name": "Aceng", "phone": "+62 813-4567-8901", "initial": "AC"},
    {"name": "Ajang Johnson", "phone": "+62 814-5678-9012", "initial": "AJ"},
    {"name": "Atang", "phone": "+62 815-6789-0123", "initial": "AT"},
    {"name": "Charlie Dadang", "phone": "+62 816-7890-1234", "initial": "CD"},
    {"name": "David Engkos", "phone": "+62 817-8901-2345", "initial": "DE"},
    {"name": "Hamdan Davis", "phone": "+62 818-9012-3456", "initial": "HD"},
    {"name": "Udin Miller", "phone": "+62 819-0123-4567", "initial": "UM"},
    {"name": "Sanjaya Lee", "phone": "+62 820-1234-5678", "initial": "SL"},
    {"name": "Cecep Garcia", "phone": "+62 821-2345-6789", "initial": "CG"},
    {"name": "Deden Martinez", "phone": "+62 822-3456-7890", "initial": "DM"},
    {
      "name": "Suhendar Anderson",
      "phone": "+62 823-4567-8901",
      "initial": "SA"
    },
    {"name": "Thomas Sutrisna", "phone": "+62 824-5678-9012", "initial": "TS"},
    {"name": "Leo Jejen", "phone": "+62 825-6789-0123", "initial": "LJ"},
    {"name": "Wawan Clark", "phone": "+62 826-7890-1234", "initial": "WC"},
  ];

  // Warna tema
  final Color _backgroundColor = const Color(0xFF0A0A0A);
  final Color _cardColor = const Color(0xFF1A1A1A);
  final Color _primaryColor = const Color(0xFF8B5CF6);
  final Color _primaryDarkColor = const Color(0xFF7C3AED);

  final Color _textPrimary = const Color(0xFFF8FAFC);
  final Color _textSecondary = const Color(0xFF94A3B8);
  final Color _textTertiary = const Color(0xFF64748B);

  // Warna  opacity
  final Color _primaryColor03 = const Color(0x4D8B5CF6);
  final Color _primaryColor02 = const Color(0x338B5CF6);
  final Color _primaryColor01 = const Color(0x1A8B5CF6);
  final Color _black03 = const Color(0x4D000000);
  final Color _black01 = const Color(0x1A000000);

  // fungsi untuk mendapatkan warna avatar berdasarkan inisial
  Color _getAvatarColor(String initial) {
    final colors = [
      const Color(0xFFE91E63),
      const Color(0xFF9C27B0),
      const Color(0xFF673AB7),
      const Color(0xFF3F51B5),
      const Color(0xFF2196F3),
      const Color(0xFF03A9F4),
      const Color(0xFF00BCD4),
      const Color(0xFF009688),
      const Color(0xFF4CAF50),
      const Color(0xFF8BC34A),
      const Color(0xFFCDDC39),
      const Color(0xFFFFC107),
      const Color(0xFFFF9800),
      const Color(0xFFFF5722),
      const Color(0xFF795548),
    ];

    int index = initial.codeUnitAt(0) % colors.length;
    return colors[index];
  }

  // fungsi untuk mendapatkan warna shadow yang lebih gelap dari warna avatar
  Color _getShadowColor(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);

    final darkerHsl = hsl
        .withLightness((hsl.lightness * 0.6).clamp(0.0, 1.0))
        .withSaturation((hsl.saturation * 0.8).clamp(0.0, 1.0));

    final darkerColor = darkerHsl.toColor();

    return Color.fromARGB(
      0x4D,
      (darkerColor.r * 255.0).round() & 0xff,
      (darkerColor.g * 255.0).round() & 0xff,
      (darkerColor.b * 255.0).round() & 0xff,
    );
  }

  @override
  Widget build(BuildContext context) {
    final contactsCount = contacts.length;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_primaryDarkColor, _primaryColor, Colors.transparent],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _primaryColor01,
                          border: Border.all(color: _primaryColor, width: 2),
                        ),
                        child: Icon(
                          Icons.contacts_rounded,
                          color: _textPrimary,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daftar Kontak',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: _textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$contactsCount kontak tersimpan',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _primaryColor02,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$contactsCount',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF252525),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: _black01,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search_rounded, color: _textTertiary),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: _textPrimary),
                            decoration: InputDecoration(
                              hintText: 'Cari kontak...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: _textTertiary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // List Kontak
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final contact = contacts[index];
                final avatarColor = _getAvatarColor(contact["initial"]!);
                final shadowColor = _getShadowColor(avatarColor);

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: _cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: _black03,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: _primaryColor01,
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Memanggil ${contact["name"]} - ${contact["phone"]}',
                              style: TextStyle(
                                color: _textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor: _cardColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: _primaryColor03),
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // Avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: avatarColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  contact["initial"]!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Contact Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contact["name"]!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: _textPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    contact["phone"]!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Call Button
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _primaryColor02,
                                border: Border.all(
                                  color: _primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              child: Icon(
                                Icons.phone_rounded,
                                color: _primaryColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Tambah kontak baru',
                style: TextStyle(color: _textPrimary),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: _cardColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: _primaryColor03),
              ),
            ),
          );
        },
        backgroundColor: _primaryColor,
        foregroundColor: _textPrimary,
        child: const Icon(Icons.person_add_rounded),
      ),
    );
  }
}
