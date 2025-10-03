import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(NoorUlHudaApp());
}

class NoorUlHudaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نور الہدیٰ ایپ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Urdu',
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      'title': 'قرآن مجید',
      'icon': Icons.menu_book,
      'color': Colors.green,
      'description': 'مکمل قرآن پاک مع ترجمہ',
      'screens': ['سورۃ الفاتحہ', 'سورۃ البقرہ', 'سورۃ آل عمران', 'سورۃ النساء']
    },
    {
      'title': 'حدیثیں',
      'icon': Icons.import_contacts,
      'color': Colors.blue,
      'description': 'صحیح احادیث کا مجموعہ',
      'screens': ['صحیح بخاری', 'صحیح مسلم', 'سنن ابو داؤد', 'سنن ترمذی']
    },
    {
      'title': 'دعائیں',
      'icon': Icons.workspace_premium,
      'color': Colors.orange,
      'description': 'روزمرہ کی دعائیں',
      'screens': ['صبح کی دعائیں', 'شام کی دعائیں', 'نماز کی دعائیں', 'خصوصی دعائیں']
    },
    {
      'title': 'اسلامی معلومات',
      'icon': Icons.lightbulb,
      'color': Colors.purple,
      'description': 'اسلام کے بنیادی عقائد',
      'screens': ['نماز', 'روزہ', 'زکوۃ', 'حج']
    },
    {
      'title': 'نماز کے اوقات',
      'icon': Icons.access_time,
      'color': Colors.red,
      'description': 'مقامی نماز کے اوقات',
      'screens': ['فجر', 'ظہر', 'عصر', 'مغرب', 'عشاء']
    },
    {
      'title': 'اسلامی کتابیں',
      'icon': Icons.library_books,
      'color': Colors.teal,
      'description': 'مشہور اسلامی کتب',
      'screens': ['تعلیم الاسلام', 'بہشتی زیور', 'فضائل اعمال', 'احیاء العلوم']
    },
  ];

  void _launchFeature(BuildContext context, Map<String, dynamic> feature) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeatureDetailScreen(feature: feature),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نور الہدیٰ ایپ'),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[50]!, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green[600]!, Colors.green[400]!],
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.mosque,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'نور الہدیٰ ایپ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'اسلامی تعلیمات کا حسین مجموعہ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            
            // Features Grid
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    final feature = features[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () => _launchFeature(context, feature),
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              feature['icon'],
                              size: 40,
                              color: feature['color'],
                            ),
                            SizedBox(height: 8),
                            Text(
                              feature['title'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                feature['description'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureDetailScreen extends StatelessWidget {
  final Map<String, dynamic> feature;

  const FeatureDetailScreen({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(feature['title']),
        backgroundColor: feature['color'],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: feature['screens'].length,
        itemBuilder: (context, index) {
          final item = feature['screens'][index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(feature['icon'], color: feature['color']),
              title: Text(
                item,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                _showContentDialog(context, feature['title'], item);
              },
            ),
          );
        },
      ),
    );
  }

  void _showContentDialog(BuildContext context, String category, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(
          'یہ مواد جلد ہی دستیاب ہوگا۔\n\n$category -> $title\n\nہم جلد ہی مکمل مواد شامل کر دیں گے۔',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ٹھیک ہے'),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ترتیبات'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.nightlight_round, color: Colors.blue),
              title: Text('ڈارک موڈ'),
              trailing: Switch(value: false, onChanged: (value) {}),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.language, color: Colors.green),
              title: Text('زبان'),
              subtitle: Text('اردو'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.volume_up, color: Colors.orange),
              title: Text('آڈیو والیوم'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.share, color: Colors.purple),
              title: Text('ایپ شیئر کریں'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.red),
              title: Text('ایپ کے بارے میں'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('نور الہدیٰ ایپ'),
                    content: Text(
                      'نسخہ: 1.0.0\n\n'
                      'نور الہدیٰ ایپ اسلامی تعلیمات کا ایک جامع پلیٹ فارم ہے جس میں قرآن، حدیث، دعائیں اور اسلامی معلومات شامل ہیں۔',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('ٹھیک ہے'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
