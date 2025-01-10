import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'speech_translation.dart';
import 'chatpage.dart';
import 'profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Language Translation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TranslationScreen(),
    );
  }
}

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController fromTextController = TextEditingController();
  final TextEditingController toTextController = TextEditingController();

  String sourceLang = "en"; // Varsayılan kaynak dil
  String targetLang = "de"; // Varsayılan hedef dil
  bool isLoading = false; // Yüklenme durumu
  int _selectedIndex = 0; // BottomNavigationBar için seçili sekme

  // Desteklenen diller
  final List<Map<String, String>> languages = [
    {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
    {'code': 'fr', 'label': 'French', 'flag': '🇫🇷'},
    {'code': 'tr', 'label': 'Turkish', 'flag': '🇹🇷'},
    {'code': 'es', 'label': 'Spanish', 'flag': '🇪🇸'},
    {'code': 'de', 'label': 'German', 'flag': '🇩🇪'},
    {'code': 'zh', 'label': 'Chinese', 'flag': '🇨🇳'},
    {'code': 'ru', 'label': 'Russian', 'flag': '🇷🇺'},
    {'code': 'ar', 'label': 'Arabic', 'flag': '🇦🇪'},
    {'code': 'pt', 'label': 'Portuguese', 'flag': '🇵🇹'},
    {'code': 'pl', 'label': 'Polish', 'flag': '🇵🇱'},
  ];

  // Çeviri kelimeleri
  final Map<String, String> translateWords = {
    'en': 'Translate',
    'fr': 'Traduire',
    'tr': 'Çevir',
    'es': 'Traducir',
    'de': 'Übersetzen',
    'zh': '翻译',
    'ru': 'Перевести',
    'ar': 'ترجمة',
    'pt': 'Traduzir',
    'pl': 'Tłumaczyć',
  };

  // Input ve output metin alanı etiketleri
  final Map<String, String> inputTextLabels = {
    'en': 'Enter Text',
    'fr': 'Entrez le texte',
    'tr': 'Metin Giriniz',
    'es': 'Introduzca el texto',
    'de': 'Text eingeben',
    'zh': '输入文字',
    'ru': 'Введите текст',
    'ar': 'أدخل النص',
    'pt': 'Insira o texto',
    'pl': 'Wprowadź tekst',
  };

  final Map<String, String> translatedTextLabels = {
    'en': 'Translated Text',
    'fr': 'Texte traduit',
    'tr': 'Çevrilmiş Metin',
    'es': 'Texto traducido',
    'de': 'Übersetzter Text',
    'zh': '翻译后的文字',
    'ru': 'Переведенный текст',
    'ar': 'النص المترجم',
    'pt': 'Texto traduzido',
    'pl': 'Przetłumaczony tekst',
  };

  Future<void> translateText() async {
    if (fromTextController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter text to translate')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5001/translate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'text': fromTextController.text,
          'source_lang': sourceLang,
          'target_lang': targetLang,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          toTextController.text = data['translated_text'];
        });
      } else {
        throw Exception('Translation failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      setState(() {
        toTextController.text = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void swapLanguages() {
    setState(() {
      String temp = sourceLang;
      sourceLang = targetLang;
      targetLang = temp;

      String tempText = fromTextController.text;
      fromTextController.text = toTextController.text;
      toTextController.text = tempText;
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SpeechTranslationScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset(
            'assets/images/translation.png',
            height: 80, // Resim yüksekliği
            width: 160, 
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  languageCard(
                    flag: getFlag(sourceLang),
                    label: getLabel(sourceLang),
                    onTap: () => selectLanguage(true),
                  ),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz, size: 32, color: Colors.blue),
                    onPressed: swapLanguages,
                  ),
                  languageCard(
                    flag: getFlag(targetLang),
                    label: getLabel(targetLang),
                    onTap: () => selectLanguage(false),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              textBox(
                label: inputTextLabels[sourceLang] ?? 'Enter Text',
                controller: fromTextController,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: isLoading ? null : translateText,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            translateWords[sourceLang]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              textBox(
                label: translatedTextLabels[targetLang] ?? 'Translated Text',
                controller: toTextController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Speech',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget languageCard({
    required String flag,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  String getFlag(String code) {
    return languages.firstWhere((lang) => lang['code'] == code)['flag']!;
  }

  String getLabel(String code) {
    return languages.firstWhere((lang) => lang['code'] == code)['label']!;
  }

  void selectLanguage(bool isSource) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: languages.map((lang) {
            return ListTile(
              leading: Text(lang['flag']!, style: const TextStyle(fontSize: 24)),
              title: Text(lang['label']!),
              onTap: () {
                setState(() {
                  if (isSource) {
                    sourceLang = lang['code']!;
                  } else {
                    targetLang = lang['code']!;
                  }
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget textBox({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
            maxLines: null,
            expands: true,
          ),
        ),
      ],
    );
  }
}
