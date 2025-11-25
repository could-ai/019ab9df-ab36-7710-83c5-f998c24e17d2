import 'package:flutter/material.dart';

void main() {
  runApp(const MemeCoinApp());
}

class MemeCoinApp extends StatelessWidget {
  const MemeCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Coin Legend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF00FFA3), // Neon Green
        scaffoldBackgroundColor: const Color(0xFF121212), // Dark Background
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF00FFA3),
          secondary: const Color(0xFF9D00FF), // Neon Purple
          surface: const Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen size for responsive layout
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '🚀 MEME LEGEND',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF00FFA3),
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          if (!isMobile)
            Row(
              children: [
                _navButton(context, 'About'),
                _navButton(context, 'Tokenomics'),
                _navButton(context, 'Roadmap'),
                const SizedBox(width: 20),
              ],
            ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO SECTION
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF121212),
                    Color(0xFF1E1E1E),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // MAIN CHARACTER PHOTO
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00FFA3).withOpacity(0.4),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(color: const Color(0xFF00FFA3), width: 2),
                      ),
                      clipBehavior: Clip.antiAlias,
                      // ---------------------------------------------------------
                      // TODO: REPLACE THIS URL WITH YOUR UPLOADED PHOTO
                      // If you have a local asset, use Image.asset('assets/your_photo.png')
                      // ---------------------------------------------------------
                      child: Image.network(
                        'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?q=80&w=1000&auto=format&fit=crop', 
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 300,
                            width: 300,
                            color: Colors.black26,
                            child: const Center(child: CircularProgressIndicator()),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            width: 300,
                            color: Colors.grey[900],
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image_not_supported, size: 50, color: Colors.white54),
                                SizedBox(height: 10),
                                Text("Image Placeholder", style: TextStyle(color: Colors.white54)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    // TITLE TEXT
                    Text(
                      "THE MAIN CHARACTER",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 32 : 56,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            color: const Color(0xFF00FFA3).withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "The only meme coin you'll ever need. HODL to the moon! 🌕",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // BUY BUTTON
                    Transform.scale(
                      scale: 1.2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action for Buy Button
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: const Color(0xFF1E1E1E),
                              title: const Text("🚀 Ready to Launch?", style: TextStyle(color: Colors.white)),
                              content: const Text(
                                "Contract Address:\n0x1234...5678\n\n(This is a demo button)",
                                style: TextStyle(color: Colors.white70),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("LFG!", style: TextStyle(color: Color(0xFF00FFA3))),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00FFA3),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          elevation: 10,
                          shadowColor: const Color(0xFF00FFA3).withOpacity(0.5),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "BUY NOW",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.rocket_launch),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // FEATURES / STATS SECTION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              color: const Color(0xFF121212),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _statCard("SUPPLY", "1,000,000,000"),
                  _statCard("TAX", "0/0"),
                  _statCard("LIQUIDITY", "BURNED"),
                ],
              ),
            ),
            
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF00FFA3),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
