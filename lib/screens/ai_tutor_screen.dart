
import 'package:flutter/material.dart';

class AiTutorScreen extends StatefulWidget {
  const AiTutorScreen({super.key});

  @override
  State<AiTutorScreen> createState() => _AiTutorScreenState();
}

class _AiTutorScreenState extends State<AiTutorScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      'text':
          'Halo, Coder! 👋 Aku AI Tutor AlgoPlay. '
          'Aku siap membantu kamu belajar pemrograman. '
          'Apa yang ingin kamu pelajari hari ini?',
      'isUser': false,
    },
  ];

  final Color navy = const Color(0xFF08111F);
  final Color panel = const Color(0xFF14253A);
  final Color cyan = const Color(0xFF00D9FF);
  final Color purple = const Color(0xFF8B5CF6);

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage([String? suggestion]) {
    final question = (suggestion ?? _controller.text).trim();

    if (question.isEmpty) return;

    setState(() {
      _messages.add({
        'text': question,
        'isUser': true,
      });

      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 350), () {
      if (!mounted) return;

      setState(() {
        _messages.add({
          'text': _getDemoAnswer(question),
          'isUser': false,
        });
      });

      _scrollToBottom();
    });

    _scrollToBottom();
  }

  String _getDemoAnswer(String question) {
    final q = question.toLowerCase();

    if (q.contains('python') || q.contains('print')) {
      return '🐍 Yuk, belajar Python!\n\n'
          'Python adalah bahasa pemrograman yang mudah dibaca. '
          'Contoh untuk menampilkan teks:\n\n'
          'print("Hello, Coder!")\n\n'
          'Fungsi print() digunakan untuk menampilkan keluaran '
          'ke layar. Coba ubah teksnya dan jalankan program!';
    }

    if (q.contains('algoritma')) {
      return '🧠 Algoritma adalah urutan langkah logis untuk '
          'menyelesaikan masalah.\n\n'
          'Contoh algoritma membuat teh:\n'
          '1. Siapkan gelas dan teh.\n'
          '2. Tuangkan air panas.\n'
          '3. Tambahkan gula sesuai kebutuhan.\n'
          '4. Aduk hingga rata.\n\n'
          'Dalam pemrograman, langkah-langkah tersebut '
          'diterjemahkan menjadi instruksi yang bisa dijalankan.';
    }

    if (q.contains('debug') || q.contains('error') ||
        q.contains('bug')) {
      return '🐛 Saat debugging, coba lakukan langkah berikut:\n\n'
          '1. Baca pesan error dengan teliti.\n'
          '2. Periksa nama variabel dan tanda kurung.\n'
          '3. Pastikan tipe data sesuai.\n'
          '4. Uji program secara bertahap.\n\n'
          'Kirimkan potongan kode dan pesan error-mu agar '
          'kita bisa memeriksanya bersama.';
    }

    if (q.contains('variabel')) {
      return '📦 Variabel digunakan untuk menyimpan nilai.\n\n'
          'Contoh Python:\n'
          'nama = "Coder"\n'
          'level = 1\n'
          'print(nama)\n\n'
          'Variabel nama menyimpan teks, sedangkan level '
          'menyimpan bilangan bulat.';
    }

    return '✨ Pertanyaan menarik!\n\n'
        'Ini masih versi demo AI Tutor, jadi jawabanku '
        'belum menggunakan model AI sungguhan.\n\n'
        'Coba tanyakan tentang Python, algoritma, variabel, '
        'atau debugging. Kamu juga bisa mengembangkan '
        'fitur ini agar terhubung ke layanan AI nantinya.';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: Row(
                children: [
                  _learningPanel(),
                  Expanded(
                    child: _chatPanel(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: panel,
        border: Border(
          bottom: BorderSide(
            color: cyan.withValues(alpha: 0.4),
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: cyan.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.smart_toy_rounded,
              color: cyan,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI TUTOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  'Teman belajar pemrogramanmu',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.circle, color: Colors.greenAccent, size: 10),
          const SizedBox(width: 6),
          const Text(
            'READY',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _learningPanel() {
    return Container(
      width: 190,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school_rounded, color: cyan, size: 30),
          const SizedBox(height: 10),
          const Text(
            'LEARN & GROW',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Pilih topik untuk mulai belajar.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 18),
          _topicButton(
            'Python',
            Icons.code_rounded,
            cyan,
            'Jelaskan Python dan contoh print',
          ),
          _topicButton(
            'Algoritma',
            Icons.account_tree_rounded,
            Colors.greenAccent,
            'Apa itu algoritma?',
          ),
          _topicButton(
            'Variabel',
            Icons.data_object_rounded,
            Colors.orangeAccent,
            'Jelaskan variabel',
          ),
          _topicButton(
            'Debugging',
            Icons.bug_report_rounded,
            purple,
            'Bagaimana cara debugging?',
          ),
          const Spacer(),
          const Divider(color: Colors.white12),
          const Text(
            'ALGO PLAY AI',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 10,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _topicButton(
    String title,
    IconData icon,
    Color color,
    String question,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: InkWell(
        onTap: () => _sendMessage(question),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 11,
          ),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: color.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 19),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white54,
                size: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatPanel() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2D),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['isUser'] as bool;

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 440,
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: isUser
                          ? const Color(0xFF124C72)
                          : panel,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isUser
                            ? cyan.withValues(alpha: 0.35)
                            : purple.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      message['text'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _messageInput(),
        ],
      ),
    );
  }

  Widget _messageInput() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              minLines: 1,
              maxLines: 3,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: 'Tanyakan sesuatu tentang coding...',
                hintStyle: const TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: navy,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 46,
            width: 48,
            child: ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: cyan,
                foregroundColor: navy,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Icon(Icons.send_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
