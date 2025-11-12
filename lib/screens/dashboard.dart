import 'package:flutter/material.dart';
import 'biodata.dart';
import 'kontak.dart';
import 'kalkulator.dart';
import 'cuaca.dart';
import 'berita.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardMenu(),
    Biodata(),
    Kontak(),
    Kalkulator(),
    Cuaca(),
    Berita(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Color _backgroundColor = Color(0xFF0A0A0A);
  final Color _cardColor = Color(0xFF1A1A1A);
  final Color _primaryColor = Color(0xFF8B5CF6);
  final Color _textTertiary = Color(0xFF64748B);
  final Color _primaryColor01 = Color(0x1A8B5CF6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: _cardColor,
          border: Border(
            top: BorderSide(
              color: _primaryColor01,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _cardColor,
          selectedItemColor: _primaryColor,
          unselectedItemColor: _textTertiary,
          selectedLabelStyle: TextStyle(
            color: _primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            color: _textTertiary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Biodata',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              label: 'Kontak',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Kalkulator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Cuaca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Berita',
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Dashboard Menu menggunakan grid
class DashboardMenu extends StatelessWidget {
  DashboardMenu({super.key});

  final Color _backgroundColor = Color(0xFF0A0A0A);
  final Color _cardColor = Color(0xFF1A1A1A);
  final Color _primaryColor = Color(0xFF8B5CF6);
  final Color _primaryDarkColor = Color(0xFF7C3AED);
  final Color _textPrimary = Color(0xFFF8FAFC);
  final Color _textSecondary = Color(0xFF94A3B8);
  final Color _primaryColor03 = Color(0x4D8B5CF6);
  final Color _primaryColor02 = Color(0x338B5CF6);
  final Color _primaryColor01 = Color(0x1A8B5CF6);
  final Color _black03 = Color(0x4D000000);
  final Color _menuColor1 = Color(0xFF8B5CF6);
  final Color _menuColor2 = Color(0xFFEC4899);
  final Color _menuColor3 = Color(0xFF10B981);
  final Color _menuColor4 = Color(0xFF3B82F6);
  final Color _menuColor5 = Color(0xFFF59E0B);

  final Color _menuColor1WithOpacity02 = Color(0x338B5CF6);
  final Color _menuColor1WithOpacity03 = Color(0x4D8B5CF6);
  final Color _menuColor2WithOpacity02 = Color(0x33EC4899);
  final Color _menuColor2WithOpacity03 = Color(0x4DEC4899);
  final Color _menuColor3WithOpacity02 = Color(0x3310B981);
  final Color _menuColor3WithOpacity03 = Color(0x4D10B981);
  final Color _menuColor4WithOpacity02 = Color(0x333B82F6);
  final Color _menuColor4WithOpacity03 = Color(0x4D3B82F6);
  final Color _menuColor5WithOpacity02 = Color(0x33F59E0B);
  final Color _menuColor5WithOpacity03 = Color(0x4DF59E0B);

  // Data menu untuk dashboard
  List<Map<String, dynamic>> get _menuItems => [
        {
          'title': 'Biodata',
          'icon': Icons.person_rounded,
          'description': 'Kelola data pribadi',
          'color': _menuColor1,
          'bgColor': _menuColor1WithOpacity02,
          'borderColor': _menuColor1WithOpacity03,
        },
        {
          'title': 'Kontak',
          'icon': Icons.contact_phone_rounded,
          'description': 'Daftar kontak ',
          'color': _menuColor2,
          'bgColor': _menuColor2WithOpacity02,
          'borderColor': _menuColor2WithOpacity03,
        },
        {
          'title': 'Kalkulator',
          'icon': Icons.calculate_rounded,
          'description': 'Hitung operasi matematika',
          'color': _menuColor3,
          'bgColor': _menuColor3WithOpacity02,
          'borderColor': _menuColor3WithOpacity03,
        },
        {
          'title': 'Cuaca',
          'icon': Icons.cloud_rounded,
          'description': 'Informasi cuaca terkini',
          'color': _menuColor4,
          'bgColor': _menuColor4WithOpacity02,
          'borderColor': _menuColor4WithOpacity03,
        },
        {
          'title': 'Berita',
          'icon': Icons.article_rounded,
          'description': 'Berita terbaru',
          'color': _menuColor5,
          'bgColor': _menuColor5WithOpacity02,
          'borderColor': _menuColor5WithOpacity03,
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Column(
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_primaryDarkColor, _primaryColor, Colors.transparent],
              ),
              borderRadius: BorderRadius.only(
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
                          Icons.dashboard_rounded,
                          color: _textPrimary,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: _textPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${_menuItems.length} menu tersedia',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _primaryColor02,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${_menuItems.length}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // ucapan selamat datang
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _primaryColor01,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.waving_hand_rounded, color: Colors.white),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Selamat datang! Pilih menu di bawah untuk mulai menjelajahi aplikasi atau menggunakan bottom navigation di bawah',
                            style: TextStyle(
                              fontSize: 14,
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
          ),

          // Menu Grid Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final menu = _menuItems[index];
                  return _buildMenuCard(
                    context,
                    title: menu['title'] as String,
                    icon: menu['icon'] as IconData,
                    description: menu['description'] as String,
                    color: menu['color'] as Color,
                    bgColor: menu['bgColor'] as Color,
                    borderColor: menu['borderColor'] as Color,
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String description,
    required Color color,
    required Color bgColor,
    required Color borderColor,
    required int index,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _navigateToPage(context, index);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _black03,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: _primaryColor01,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Container
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),
                SizedBox(height: 12),
                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: _textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Membuka ${_menuItems[index]['title']}',
          style: TextStyle(color: _textPrimary),
        ),
        duration: Duration(milliseconds: 800),
        backgroundColor: _cardColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _primaryColor03),
        ),
      ),
    );

    // Navigate using bottom navigation
    final dashboardState = context.findAncestorStateOfType<DashboardState>();
    if (dashboardState != null) {
      dashboardState
          ._onItemTapped(index + 1); // +1 karena index 0 adalah dashboard
    }
  }
}
