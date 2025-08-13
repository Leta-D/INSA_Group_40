import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/donation_item.dart';
import 'package:kind_bridge/common/pages/donated_item_full_view.dart';
import 'package:kind_bridge/constants/colors.dart';

Widget donatedFrameWidget(DonationItem item) {
  return InkWell(
    onTap: () {
      Get.to(() => DonatedItemFullView(item: item));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: appWhite(1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: appBlack(0.1), blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child:
                item.imageUrl == null
                    ? Image.asset(
                      color: appBlack(1),
                      "assets/icons/kind_bridge_logo.png",
                      fit: BoxFit.cover,
                    )
                    : Image.network(
                      item.imageUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress!.cumulativeBytesLoaded ==
                            loadingProgress.expectedTotalBytes) {
                          return child;
                        }
                        return Center(
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              value:
                                  1.0 * loadingProgress.cumulativeBytesLoaded,
                              color: appDarkGreen(1),
                              backgroundColor: appDarkGreen(0.5),
                            ),
                          ),
                        );
                      },
                      errorBuilder:
                          (context, error, stackTrace) => SizedBox(
                            width: 120,
                            height: 120,
                            child: Icon(
                              Icons.error,
                              color: appRed(0.8),
                              size: 40,
                            ),
                          ),
                    ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: GoogleFonts.aBeeZee(
                  color: appDarkGreen(1),
                  fontSize: 20,
                ),
              ),
              Text(
                item.category,
                style: GoogleFonts.damion(color: appDarkGreen(1), fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
