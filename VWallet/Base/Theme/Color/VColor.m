//
// Color.m
//  Wallet
//
//  All rights reserved.
//

#import "VColor.h"
#import "UIColor+Hex.h"

@implementation VColor

SM_SINGLETON_IMPLEMENTATION(VColor)

+ (UIColor *)themeColor {
    return VColor.sharedInstance.coldTheme ? VColor.blueColor : VColor.orangeColor;
}

#pragma mark - TabBar
+ (UIColor *)tabbarBgColor {
    return [UIColor colorWithHex:0xFFFFFF];
}

+ (UIColor *)tabbarTintColor {
    return [UIColor colorWithHex:0x54545C];
}

#pragma mark - NavigationBar
+ (UIColor *)navigationGrayBgColor {
    return [UIColor colorWithHex:0xFAFAFA];
}

+ (UIColor *)navigationTintColor {
    return [UIColor colorWithHex:0x36363D];
}

+ (UIColor *)rootViewBgColor {
    return [UIColor colorWithHex:0xFFFFFF];
}

+ (UIColor *)tableViewBgColor {
    return [UIColor colorWithHex:0xF7F7FA];
}

+ (UIColor *)disaleBgColor {
    return [UIColor colorWithHex:0xE8E8EB];
}

+ (UIColor *)textColor {
    return [UIColor colorWithHex:0x36363D];
}

+ (UIColor *)textSecondColor {
    return [UIColor colorWithHex:0x939399];
}

+ (UIColor *)textSecondDeepenColor {
    return [UIColor colorWithHex:0x54545C];
}

+ (UIColor *)placeholderColor {
    return [UIColor colorWithHex:0xBEBEC4];
}

+ (UIColor *)separatorColor {
    return [UIColor colorWithHex:0xF5F5F7];
}

+ (UIColor *)borderColor {
    return [UIColor colorWithHex:0xE8E8EB];
}

+ (UIColor *)shadowColor {
    return [UIColor colorWithHex:0x36363D];
}

+ (UIColor *)orangeColor {
    return [UIColor colorWithHex:0xFF6B6B];
}

+ (UIColor *)mediumOrangeColor {
    return [UIColor colorWithHex:0xFF5C5C];
}

+ (UIColor *)lightOrangeColor {
    return [UIColor colorWithHex:0xFF4E4E];
}

+ (UIColor *)blueColor {
    return [UIColor colorWithHex:0x0E81FF];
}

+ (UIColor *)mediumBlueColor {
    return [UIColor colorWithHex:0x0670FF];
}

+ (UIColor *)lightBlueColor {
    return [UIColor colorWithHex:0x0162FF];
}

+ (UIColor *)grayColor {
    return [UIColor colorWithHex:0xF2F2F5];
}

+ (UIColor *)redColor {
    return [UIColor colorWithHex:0xF5354B];
}

@end
