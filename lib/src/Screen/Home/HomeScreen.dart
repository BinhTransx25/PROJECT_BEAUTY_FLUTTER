import 'dart:async';
import '../../service/Home/ProductService.dart';
import '../../service/Home/BannerServer.dart';
import 'package:flutter/material.dart';
import '../../models/home/Banner.dart';
import '../../service/Home/CategoryService.dart';
import 'widgets/header.dart';
import 'widgets/PromotionList.dart';
import 'widgets/CategoryList .dart';
import 'widgets/ProductList.dart';
import 'widgets/ProductSaleList.dart';
import 'widgets/RadiantGlowSection.dart';
import '../../app/tabs/bottom_nav_bar.dart';
import '../../models/home/data_home_new.dart';
import '../../models/home/CategoryModel.dart';
import '../../models/home/ProductModel.dart';


class HomeScreen extends StatefulWidget {
  final int notificationCount;
  const HomeScreen({this.notificationCount = 1, Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final ApiService _apiService = ApiService();

  List<BannerModel> banners = [];
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  bool isLoading = true;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchBanners();
    fetchCategories();
    _startAutoScroll();
  }

  Future<void> fetchBanners() async {
    try {
      setState(() => isLoading = true);
      final fetchedBanners = await _apiService.fetchBanners();
      setState(() {
        banners = fetchedBanners;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching banners: $e');
      setState(() => isLoading = false);
    }
  }

  final CategoryService _categoryService = CategoryService();
  final ProductService _productService =
      ProductService(); 

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories =
          await _categoryService.getCategories(); 
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  void fetchProducts() async {
    try {
      final response = await _productService.getProducts();
      setState(() {
        products = response.data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  // P

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCarouselSection() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Carousel(
      banners: banners,
      pageController: _pageController,
      onPageChanged: _onPageChanged,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
            Header(notificationCount: widget.notificationCount),
            const SizedBox(height: 20),
            _buildCarouselSection(),
            const SizedBox(height: 20),
            PromotionList(promotions: promotions),
            const SizedBox(height: 20),
            CategoryList(),
            const SizedBox(height: 20),
            ProductList(),
            const SizedBox(height: 20),
            ProductSaleList(
              products: outstandingProductSales,
              title: "Sản phẩm khuyến mãi",
            ),
            const SizedBox(height: 20),
            RadiantGlowSection(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}

class Carousel extends StatelessWidget {
  final List<BannerModel> banners;
  final PageController pageController;
  final Function(int) onPageChanged;

  const Carousel({
    Key? key,
    required this.banners,
    required this.pageController,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: onPageChanged,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final banner = banners[index];
              return Container(
                decoration: BoxDecoration(
                  color: Color(int.parse(
                      banner.backgroundColor.replaceAll('#', '0xFF'))),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      banner.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 217, 217),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      banner.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 93, 83, 231),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        _buildIndicators(),
      ],
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        banners.length,
        (index) => Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pageController.hasClients &&
                    (pageController.page?.round() ?? 0) == index
                ? Colors.blue
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
