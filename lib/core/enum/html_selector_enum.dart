/// Selector enums
enum HtmlSelector {
  normalMenuName,
  normalMenuList,
}

extension HtmlMenuSelectorExt on HtmlSelector {
  /// Returning selector string for html
  String get value {
    switch (this) {
      case HtmlSelector.normalMenuName:
        return '#wrapper > div > section.muContent > div > div > div > article > div > div:nth-child(1) > div:nth-child(1) > h4';
      case HtmlSelector.normalMenuList:
        return '.list-dashed>li';
    }
  }
}
