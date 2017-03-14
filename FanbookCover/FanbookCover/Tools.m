//
//  Tools.m
//  FanbookCover
//
//  Created by 김민아 on 2017. 3. 14..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "Tools.h"

#import <SDWebImage/UIImageView+WebCache.h>


@implementation Tools

-(void)setImageView:(UIImageView *)imageView urlString:(NSString *)urlString placeholderImage:(UIImage *)image animation:(BOOL)ani
{
    NSURL *url = [NSURL URLWithString:urlString];
    [imageView sd_setImageWithURL:url placeholderImage:image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if(cacheType == SDImageCacheTypeNone)
         {
             if(ani)
             {
                 [imageView.layer addAnimation:[self fadeOutAnimationForChangeImage] forKey:@"fadeOutAnimationForChangeImage"];
             }
             
         }
     }];
}
- (CATransition *)fadeOutAnimationForChangeImage
{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    return transition;
}

- (UIColor *)getColorByStringHexCode:(NSString *)strHexCode
{
    UIColor *result = nil;
    NSScanner *scanner = nil;
    unsigned redCode, greenCode, blueCode;
    NSRange r;
    
    r.location = 0;
    r.length = 2;
    NSString *redCodeStr = [strHexCode substringWithRange:r];
    
    r.location = 2;
    NSString *greenCodeStr = [strHexCode substringWithRange:r];
    
    r.location = 4;
    NSString *blueCodeStr = [strHexCode substringWithRange:r];
    
    scanner = [NSScanner scannerWithString:redCodeStr];
    [scanner scanHexInt:&redCode];
    
    scanner = [NSScanner scannerWithString:greenCodeStr];
    [scanner scanHexInt:&greenCode];
    
    scanner = [NSScanner scannerWithString:blueCodeStr];
    [scanner scanHexInt:&blueCode];
    
    result = [UIColor colorWithRed:redCode/255.0f green:greenCode/255.0f blue:blueCode/255.0f alpha:1];
    
    return result;
}

- (NSString *)convertedCount:(double)count
{
    NSString *result = nil;
    double devideCount = 0;
    NSString *unitText = nil;
    NSString *formmater = nil;
    
    if (count < 1000) {
        result = [NSString stringWithFormat:@"%zd",(NSInteger)count];
    }
    else
    {
        if (count >= 1000 && count < 1000000) // 1K
        {
            devideCount = count / 1000.0f;
            unitText = @"K";
        }
        else if (count >= 1000000 && count < 1000000000) // 1M
        {
            devideCount = count / 1000000.0f;
            unitText = @"M";
        }
        else if (count >= 1000000000 && count < 1000000000000) // 1B
        {
            devideCount = count / 1000000000.0f;
            unitText = @"B";
        }
        else if (count >= 1000000000000 && count < 1000000000000000) // 1T
        {
            devideCount = count / 1000000000000.0f;
            unitText = @"T";
        }
        
        if ((NSInteger)count % 10)
        {
            result = [NSString stringWithFormat:@"%.1f", devideCount];
            
            NSArray *comp = [result componentsSeparatedByString:@"."];
            NSString *firstComp = [comp firstObject];
            NSString *lastComp = [comp lastObject];
            
            // 소수 첫째자리가 0일경우 0 제거
            if ([lastComp isEqualToString:@"0"])
            {
                result = [NSString stringWithFormat:@"%@%@",firstComp, unitText];
            }
            else
            {
                result = [result stringByAppendingString:unitText];
            }
        }
        else
        {
            NSInteger newDevideCount = devideCount;
            formmater = @"%zd%@";
            result = [NSString stringWithFormat:formmater,newDevideCount,unitText];
        }
    }
    
    return result;
}

@end
