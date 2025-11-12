import 'package:flutter/material.dart';

class Berita extends StatelessWidget {
  Berita({super.key}) {
    _news = [
      {
        'title':
            'Nonton Live Streaming Selangor FC vs Persib Bandung di RCTI dan GTV - AFC Champions League Two 2025/2026',
        'author': 'BOLA.NET',
        'time': '46 min ago',
        'category': 'SPORTS',
        'categoryColor': const Color.fromARGB(255, 6, 232, 66),
        'categoryBgColor': const Color(0x1AFF6B6B),
        'categoryBorderColor': const Color(0x33FF6B6B),
        'imagePath': 'assets/images/persib.jpg',
      },
      {
        'title': 'Jus Alpukat: Minuman Sehat dengan Beragam Manfaat Kesehatan',
        'author': 'Sehat.com',
        'time': '1 hour ago',
        'category': 'KESEHATAN',
        'categoryColor': const Color(0xFF4ECDC4),
        'categoryBgColor': const Color(0x1A4ECDC4),
        'categoryBorderColor': const Color(0x334ECDC4),
        'imagePath': 'assets/images/jus.jpeg',
      },
      {
        'title':
            'Kisah Hacker Asal Sampit yang Jadi Top 10 Google Bug Hunter Indonesia',
        'author': 'detikINET',
        'time': '6 min ago',
        'category': 'TEKNOLOGI',
        'categoryColor': const Color(0xFFFF6B6B),
        'categoryBgColor': const Color(0x1AFF6B6B),
        'categoryBorderColor': const Color(0x33FF6B6B),
        'imagePath': 'assets/images/Hacker.jpeg',
      },
      {
        'title': 'IoT Bantu Petani Ikan Sukabumi Tingkatkan Produktivitas',
        'author': 'detikjabar',
        'time': '15 Okt 2025',
        'category': 'TEKNOLOGI',
        'categoryColor': const Color(0xFFFF6B6B),
        'categoryBgColor': const Color(0x1AFF6B6B),
        'categoryBorderColor': const Color(0x33FF6B6B),
        'imagePath': 'assets/images/iot.jpeg',
      },
      {
        'title':
            'Purbaya Ngaku Baru Tahu Jadi Menkeu Lumayan Berkuasa, Bisa Atur Danantara',
        'author': 'Kompas.com',
        'time': '03 Nov 2025',
        'category': 'POLITIK',
        'categoryColor': const Color.fromARGB(255, 222, 238, 7),
        'categoryBgColor': const Color(0x1AFF6B6B),
        'categoryBorderColor': const Color(0x33FF6B6B),
        'imagePath': 'assets/images/politik.jpeg',
      },
    ];
  }

  // Warna tema
  final Color _backgroundColor = const Color(0xFF0A0A0A);
  final Color _cardColor = const Color(0xFF1A1A1A);
  final Color _primaryColor = const Color(0xFF8B5CF6);
  final Color _primaryDarkColor = const Color(0xFF7C3AED);
  final Color _textPrimary = const Color(0xFFF8FAFC);
  final Color _textSecondary = const Color(0xFF94A3B8);
  final Color _textTertiary = const Color(0xFF64748B);

  // Warna  opacity
  final Color _primaryColor02 = const Color(0x338B5CF6);
  final Color _primaryColor01 = const Color(0x1A8B5CF6);

  // Warna buat image overlay
  final Color _imageOverlayColor = const Color(0x33000000);

  // Data berita
  late final List<Map<String, dynamic>> _news;

  @override
  Widget build(BuildContext context) {
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
                          Icons.article_rounded,
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
                              'Latest News',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tetap update dengan cerita terbaru',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
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
                          '${_news.length}',
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

                  // Featured News Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0x1AFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _primaryColor01,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _primaryColor,
                          ),
                          child: Icon(
                            Icons.star_rounded,
                            color: _textPrimary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cerita Unggulan',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Breaking News',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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

          // News List
          Expanded(
            child: ListView.builder(
              itemCount: _news.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final news = _news[index];
                return _buildNewsCard(
                  context,
                  title: news['title'],
                  author: news['author'],
                  time: news['time'],
                  category: news['category'],
                  categoryColor: news['categoryColor'],
                  categoryBgColor: news['categoryBgColor'],
                  categoryBorderColor: news['categoryBorderColor'],
                  imagePath:
                      news['imagePath'], // Changed from hasImage to imagePath
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(
    BuildContext context, {
    required String title,
    required String author,
    required String time,
    required String category,
    required Color categoryColor,
    required Color categoryBgColor,
    required Color categoryBorderColor,
    required String imagePath, // Changed from bool hasImage to String imagePath
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _primaryColor01,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _showNewsDetail(context, title, author, time, category, imagePath);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // News Image/Thumbnail - Using custom image
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: categoryBgColor,
                    image: DecorationImage(
                      image: AssetImage(
                          imagePath), // Using AssetImage for custom images
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _imageOverlayColor,
                    ),
                  ),
                ),

                // News Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: categoryBgColor,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: categoryBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: categoryColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _textPrimary,
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),

                      // Author and Time
                      Row(
                        children: [
                          Text(
                            'BY ${author.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _textTertiary,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _textTertiary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 11,
                              color: _textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showNewsDetail(BuildContext context, String title, String author,
      String time, String category, String imagePath) {
    showModalBottomSheet(
      context: context,
      backgroundColor: _cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _textTertiary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // News Image in Detail
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _imageOverlayColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Category
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0x1AFF6B6B), // 10% opacity
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0x33FF6B6B), // 20% opacity
                    width: 1,
                  ),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFF6B6B),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: _textPrimary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 16),

              // Author and Time
              Row(
                children: [
                  Text(
                    'BY ${author.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _textTertiary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _textTertiary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: _textTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Content
              Text(
                'Mantaps Sib',
                style: TextStyle(
                  fontSize: 16,
                  color: _textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _textPrimary,
                        side: BorderSide(color: _primaryColor),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Kembali'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        foregroundColor: _textPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Baca Selengkapnya'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
