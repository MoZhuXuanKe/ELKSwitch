//
//  UIColor+ELKBCCategory.h
//  ELKNTBaseConfig
//
//  Created by Jonathan on 2019/4/1.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ELKBCCategory)


/**
 *  Create a color from a HEX string.
 *  It supports the following type:
 *  - #RGB
 *  - #ARGB
 *  - #RRGGBB
 *  - #AARRGGBB
 *
 *  @param hexString NSString
 *
 *  @return Returns the UIColor instance
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;


// color
UIColor * ELKColorHexStr(NSString* hexString);

@end

NS_ASSUME_NONNULL_END
