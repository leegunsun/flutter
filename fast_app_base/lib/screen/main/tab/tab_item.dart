import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/f_benefit.dart';
import 'package:fast_app_base/screen/main/tab/favorite/f_favorite.dart';
import 'package:fast_app_base/screen/main/tab/home/f_home.dart';
import 'package:flutter/material.dart';

enum TabItem {
  //
  home(Icons.home, '홈', HomeFragment()),
  benefit(Icons.star, '혜택', BenefitFragment()),
  ttosspay(Icons.payment, '토스페이', HomeFragment()),
  stock(Icons.candlestick_chart, '주식', HomeFragment()),
  testtt(Icons.add, '그냥 되나?', HomeFragment()),
  favorite(Icons.star, '즐겨찾기', FavoriteFragment(isShowBackButton: false));

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage,
      {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context,
      {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated
              ? context.appColors.iconButton
              : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
