import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:moving_app/Utils/constants.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Special Offers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (ctx) => CategoriesScreen(
                  //         categories: state.categories)));
                },
                label: const Text('View All'),
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
              ),
            ),
          ],
        ),
        BannerCarousel(
          margin: EdgeInsets.zero,
          banners: [
            BannerModel(
              id: '1',
              imagePath:
                  'https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg?w=2000',
            ),
            BannerModel(
              id: '2',
              imagePath:
                  'https://static.vecteezy.com/system/resources/thumbnails/001/381/216/small/special-offer-sale-banner-with-megaphone-free-vector.jpg',
            ),
            // BannerModel(
            //   id: '3',
            //   imagePath:
            //       'https://img.freepik.com/premium-vector/special-offer-sale-discount-banner_180786-46.jpg',
            // ),
          ],
          customizedIndicators: IndicatorModel.animation(
              width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
          height: 125,
          activeColor: AppColors.PRIMARY_COLOR,
          disableColor: AppColors.BG_COLOR,
          animation: true,
          borderRadius: 12,
          width: MediaQuery.of(context).size.width,
          indicatorBottom: false,
        ),
      ],
    );
  }
}
