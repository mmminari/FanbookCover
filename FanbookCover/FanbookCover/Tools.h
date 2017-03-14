//
//  Tools.h
//  FanbookCover
//
//  Created by 김민아 on 2017. 3. 14..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define deviceWidth                                         [UIScreen mainScreen].bounds.size.width

#define SCREEN_WIDTH                                        deviceWidth
#define SCREEN_WIDTH_OF_IPHONE_6PLUS                        414.0f
#define WRATIO_SIZE(standardSize)                           round(standardSize * (SCREEN_WIDTH / SCREEN_WIDTH_OF_IPHONE_6PLUS))

#define YH_FONT_HELVETICANEUE(fontSize)             [UIFont fontWithName:@"HelveticaNeue" size:fontSize]
#define YH_FONT_HELVETICANEUE_BOLD(fontSize)        [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize]

@interface Tools : NSObject

- (void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani;
- (CATransition *)fadeOutAnimationForChangeImage;
- (UIColor *)getColorByStringHexCode:(NSString *)strHexCode;
- (NSString *)convertedCount:(double)count;


@end
