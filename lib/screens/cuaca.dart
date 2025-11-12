import 'package:flutter/material.dart';

class Cuaca extends StatelessWidget {
  const Cuaca({super.key});

  // Warna tema dark dengan aksen ungu
  final Color _backgroundColor = const Color(0xFF0A0A0A);
  final Color _cardColor = const Color(0xFF1A1A1A);
  final Color _primaryColor = const Color(0xFF8B5CF6);
  final Color _primaryDarkColor = const Color(0xFF7C3AED);
  final Color _textPrimary = const Color(0xFFF8FAFC);
  final Color _textSecondary = const Color(0xFF94A3B8);
  final Color _textTertiary = const Color(0xFF64748B);

  // Warna dengan opacity
  final Color _primaryColor03 = const Color(0x4D8B5CF6);
  final Color _primaryColor02 = const Color(0x338B5CF6);
  final Color _primaryColor01 = const Color(0x1A8B5CF6);

  // Warna untuk detail card dengan opacity
  final Color _redColor = const Color(0xFFFF6B6B);
  final Color _redColor02 = const Color(0x33FF6B6B);
  final Color _redColor03 = const Color(0x4DFF6B6B);

  final Color _tealColor = const Color(0xFF4ECDC4);
  final Color _tealColor02 = const Color(0x334ECDC4);
  final Color _tealColor03 = const Color(0x4D4ECDC4);

  final Color _blueColor = const Color(0xFF45B7D1);
  final Color _blueColor02 = const Color(0x3345B7D1);
  final Color _blueColor03 = const Color(0x4D45B7D1);

  final Color _greenColor = const Color(0xFF96CEB4);
  final Color _greenColor02 = const Color(0x3396CEB4);
  final Color _greenColor03 = const Color(0x4D96CEB4);

  final Color _yellowColor = const Color(0xFFFECA57);
  final Color _yellowColor02 = const Color(0x33FECA57);
  final Color _yellowColor03 = const Color(0x4DFECA57);

  final Color _pinkColor = const Color(0xFFFF9FF3);
  final Color _pinkColor02 = const Color(0x33FF9FF3);
  final Color _pinkColor03 = const Color(0x4DFF9FF3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _primaryDarkColor,
                      _primaryColor,
                      Colors.transparent
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            Icons.location_on_rounded,
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
                                'Lokasi Saat Ini',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Bandung, Indonesia',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
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
                            'Live',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hari Ini',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '22°C',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: _textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Cerah Berawan',
                              style: TextStyle(
                                fontSize: 18,
                                color: _textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // untuk animasi cuaca
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFFFD700),
                                const Color(0xFFFFA500),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _primaryColor03,
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Sun
                              Center(
                                child: Icon(
                                  Icons.wb_sunny_rounded,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              ),
                              // Cloud
                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: Icon(
                                  Icons.cloud_rounded,
                                  color: const Color(
                                      0xCCFFFFFF), // Mengganti withOpacity(0.8)
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // main content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    // Weather Details Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.thermostat_rounded,
                            title: 'Suhu',
                            value: '22°C',
                            subtitle: 'Terasa seperti 24°C',
                            color: _redColor,
                            bgColor: _redColor02,
                            borderColor: _redColor03,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.water_drop_rounded,
                            title: 'Kelembaban',
                            value: '65%',
                            subtitle: 'Tingkat kenyamanan',
                            color: _tealColor,
                            bgColor: _tealColor02,
                            borderColor: _tealColor03,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.air_rounded,
                            title: 'Angin',
                            value: '12 km/jam',
                            subtitle: 'Dari Barat Daya',
                            color: _blueColor,
                            bgColor: _blueColor02,
                            borderColor: _blueColor03,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.compress_rounded,
                            title: 'Tekanan',
                            value: '1013 hPa',
                            subtitle: 'Stabil',
                            color: _greenColor,
                            bgColor: _greenColor02,
                            borderColor: _greenColor03,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.visibility_rounded,
                            title: 'Visibilitas',
                            value: '10 km',
                            subtitle: 'Jelas',
                            color: _yellowColor,
                            bgColor: _yellowColor02,
                            borderColor: _yellowColor03,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailCard(
                            icon: Icons.beach_access_rounded,
                            title: 'UV Index',
                            value: 'Moderate',
                            subtitle: '4 of 10',
                            color: _pinkColor,
                            bgColor: _pinkColor02,
                            borderColor: _pinkColor03,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    //  untuk Prakiraan Mingguan
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _cardColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _primaryColor01,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ramalan 7 Hari',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: _textPrimary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildForecastItem(
                              'Sen', Icons.wb_sunny_rounded, '26°C', '20°C'),
                          _buildForecastItem(
                              'Sel', Icons.wb_cloudy_rounded, '25°C', '19°C'),
                          _buildForecastItem(
                              'Rab', Icons.grain_rounded, '23°C', '18°C'),
                          _buildForecastItem('Kam', Icons.thunderstorm_rounded,
                              '22°C', '17°C'),
                          _buildForecastItem(
                              'Jum', Icons.wb_cloudy_rounded, '24°C', '18°C'),
                          _buildForecastItem(
                              'Sab', Icons.wb_sunny_rounded, '27°C', '21°C'),
                          _buildForecastItem(
                              'Min', Icons.wb_sunny_rounded, '28°C', '22°C'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Info Tambahan
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _primaryColor01,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _primaryColor02,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.update_rounded,
                            color: _primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Terakhir diperbarui',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _textTertiary,
                                  ),
                                ),
                                Text(
                                  '5 menit yang lalu',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: _primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Refresh',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _primaryColor01,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: _textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: _textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastItem(
      String day, IconData icon, String high, String low) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              day,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              icon,
              color: _primaryColor,
              size: 20,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  high,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _textPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  low,
                  style: TextStyle(
                    fontSize: 14,
                    color: _textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
