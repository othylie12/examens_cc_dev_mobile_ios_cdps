import 'package:flutter/material.dart';
import 'dart:async';

class AbayaScreen extends StatefulWidget {
  const AbayaScreen({super.key});

  @override
  _AbayaScreenState createState() => _AbayaScreenState();
}

class _AbayaScreenState extends State<AbayaScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _showBottomMessage =
      true; // State to control the visibility of the bottom message

  final List<Map<String, String>> _imagesAndTexts = [
    {
      'image': 'designs/image1.jpg',
      'text1': 'WELCOME TO ABAYASHOP',
      'text2': 'The fusion of luxury, modernity, and tradition',
    },
    {
      'image': 'designs/image2.jpg',
      'text1': '',
      'text2': '',
    },
    {
      'image': 'designs/image3.webp',
      'text1': '',
      'text2': '',
    },
    // Add more images here as needed
  ];

  final List<Map<String, String>> _circleImagesAndTexts = [
    {'image': 'designs/kids.jpg', 'text': 'Kids'},
    {'image': 'designs/femmes.jpg', 'text': 'Women'},
    {'image': 'designs/hommes.jpg', 'text': 'Men'},
    // Add more circular images here as needed
  ];

  final List<Map<String, String>> _sideImagesAndPrices = [
    {'image': 'designs/slide1.jpg', 'price': '30€'},
    {'image': 'designs/slide2.jpg', 'price': '50€'},
    // Add more images and prices here as needed
  ];

  final List<Map<String, String>> _side1ImagesAndPrices = [
    {'image': 'designs/slide3.jpg', 'price': '150€'},
    {'image': 'designs/slide4.jpg', 'price': '310€'},
    // Add more images and prices here as needed
  ];

  final List<Map<String, String>> _side2ImagesAndPrices = [
    {'image': 'designs/slide5.jpg', 'price': '40€'},
    {'image': 'designs/slide6.jpg', 'price': '420€'},
    // Add more images and prices here as needed
  ];

  final String _scrollingText =
      "Get your Aid looks. Receive a special Aid discount for orders before June 10";
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  final double _scrollVelocity = 2;

  @override
  void initState() {
    super.initState();
    _startScrolling();
    _showCookieConsentDialog();
  }

  void _startScrolling() {
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_scrollController.hasClients) {
        _scrollPosition += _scrollVelocity;
        if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
          _scrollPosition = 0;
          _scrollController.jumpTo(_scrollPosition);
        } else {
          _scrollController.jumpTo(_scrollPosition);
        }
      }
    });
    _startImageScrolling();
  }

  void _startImageScrolling() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _imagesAndTexts.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  void _showCookieConsentDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cookies Consent'),
            content:
                const Text('Do you accept cookies for a better experience?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Accept'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Decline'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 30,
                  color: const Color.fromRGBO(7, 38, 161, 1),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width),
                        Text(
                          _scrollingText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width),
                      ],
                    ),
                  ),
                ),
                AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      // Add your back button logic here
                    },
                  ),
                  title: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          // Add your menu button logic here
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'ABAYASHOP',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'designs/livraison.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          Image.asset(
                            'designs/sac.png',
                            height: 24,
                            width: 24,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: const Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                const SizedBox(height: 10),
                _buildSearchBar(),
                const SizedBox(height: 10),
                _buildPageView(),
                const SizedBox(height: 10),
                _buildCircleImageScroller(),
                const SizedBox(height: 10),
                _buildSideImages(),
                const SizedBox(height: 10),
                _buildSide1Images(),
                const SizedBox(height: 10),
                _buildSide2Images(),
                const SizedBox(height: 10),
                _buildSeeMoreButton(), // "See More" button
                const SizedBox(height: 40), // Space before paragraph
                _buildParagraph(),
                const SizedBox(height: 40), // Space before final section
                _buildFooterSection(),
                const SizedBox(
                    height:
                        20), // Space before copyright and payment icons section
                _buildFooterBottomSection(), // Paragraph
                const SizedBox(
                    height:
                        50), // Extra space to ensure message is at the bottom
              ],
            ),
          ),
          if (_showBottomMessage)
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'designs/whatsapp.png', // Replace with your WhatsApp icon path
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'A question? Chat with us',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _showBottomMessage = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Container(
      height: 300, // Height of the PageView
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imagesAndTexts.length,
        itemBuilder: (context, index) {
          return _buildImageItem(
            _imagesAndTexts[index]['image']!,
            _imagesAndTexts[index]['text1']!,
            _imagesAndTexts[index]['text2']!,
            index == 0,
          );
        },
      ),
    );
  }

  Widget _buildImageItem(
      String imagePath, String text1, String text2, bool isFirstImage) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isFirstImage)
            Text(
              text1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 10),
          if (isFirstImage)
            Text(
              text2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCircleImageScroller() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _circleImagesAndTexts.map((item) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    item['image']!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item['text']!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSideImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _sideImagesAndPrices.map((item) {
        return Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item['price']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSide1Images() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _side1ImagesAndPrices.map((item) {
        return Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item['price']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSide2Images() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _side2ImagesAndPrices.map((item) {
        return Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item['price']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSeeMoreButton() {
    return ElevatedButton(
      onPressed: () {
        // Add your "See More" button logic here
      },
      child: const Text('See More'),
    );
  }

  Widget _buildParagraph() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "ABAYASHOP offers exclusive offers all year round where you can benefit from incredible reductions on usual prices. ABAYASHOP sales are popular for incredible discounts. Keep an eye on the sale prices so you don't miss anything. The ABAYASHOP abaya is the reincarnation of tradition, modernity and luxury. Discover our extraordinary collections.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      color: const Color.fromRGBO(
          255, 254, 254, 1), // Définir la couleur de fond en beige
      padding: const EdgeInsets.symmetric(
          vertical: 20), // Ajouter du padding pour un meilleur espacement
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFooterItem('CONTACT US'),
          _buildFooterItem('CUSTOMER SERVICE'),
          _buildFooterItem('INFORMATION'),
          _buildFooterItem('NEWSLETTER SIGN-UP'),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.add),
        ],
      ),
    );
  }

  Widget _buildFooterBottomSection() {
    return Column(
      children: [
        const Text(
          '© COPYRIGHT 2024 ABAYASHOP',
          style:
              TextStyle(fontSize: 12, color: Color.fromRGBO(158, 158, 158, 1)),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('designs/PayPal.png',
                height: 20), // Remplacez par votre propre image
            const SizedBox(width: 40),
            Image.asset('designs/visa.png',
                height: 50), // Remplacez par votre propre image
            const SizedBox(width: 40),
            Image.asset('designs/mastercard.png',
                height: 50), // Remplacez par votre propre image
            const SizedBox(width: 40),
            Image.asset('designs/safepay.png',
                height: 50), // Remplacez par votre propre image
            // Ajoutez d'autres icônes selon vos besoins
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'XOF',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
