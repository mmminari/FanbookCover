//
//  CoverView.h
//  FanbookCover
//
//  Created by 김민아 on 2017. 3. 10..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoverView : UIView


- (void)setCoverImageWithURLString:(NSString *)urlString;
- (void)setUserProfileImage:(NSString *)urlString userNick:(NSString *)userNick;
- (void)setTitle:(NSString *)title;
- (void)setViewCount:(NSInteger)viewCount commentCount:(NSInteger)commetCount likeCount:(NSInteger)likeCount;

- (void)setUserIfoViewAnimation;


@end
