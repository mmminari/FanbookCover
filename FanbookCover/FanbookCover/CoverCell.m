//
//  CoverCell.m
//  FanbookCover
//
//  Created by 김민아 on 2017. 3. 9..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "CoverCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "SFBMainCoverModels.h"

#import "GBInfiniteScrollView.h"

#define deviceWidth                                         [UIScreen mainScreen].bounds.size.width

#define SCREEN_WIDTH                                        deviceWidth
#define SCREEN_WIDTH_OF_IPHONE_6PLUS                        414.0f
#define WRATIO_SIZE(standardSize)                           round(standardSize * (SCREEN_WIDTH / SCREEN_WIDTH_OF_IPHONE_6PLUS))

#define YH_FONT_HELVETICANEUE(fontSize)             [UIFont fontWithName:@"HelveticaNeue" size:fontSize]
#define YH_FONT_HELVETICANEUE_BOLD(fontSize)        [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize]


@interface CoverCell () <GBInfiniteScrollViewDelegate, GBInfiniteScrollViewDataSource>

@property (weak, nonatomic) IBOutlet GBInfiniteScrollView *infiniteScrollView;
@property (weak, nonatomic) IBOutlet UIView *infoContainer;

@property (weak, nonatomic) IBOutlet UIImageView *ivProfile;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbNick;
@property (weak, nonatomic) IBOutlet UILabel *lbViewCount;
@property (weak, nonatomic) IBOutlet UILabel *lbCommentCount;
@property (weak, nonatomic) IBOutlet UILabel *lbLikeCount;
@property (weak, nonatomic) IBOutlet UIImageView *ivView;
@property (weak, nonatomic) IBOutlet UIImageView *ivComment;
@property (weak, nonatomic) IBOutlet UIImageView *ivLike;

#pragma mark - Alc


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfInfoContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfInfoContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfProfileImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfProfileImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfProfileImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcLeadingOfTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcBottomOfTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTopOfNickLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfLikeIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcHeightOfLikeIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfCommentIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcWidthOfViewIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfLikeIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfCommentIcon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alcTrailingOfViewIcon;

@end

@implementation CoverCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self infiniteScrollViewSetUp];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.alcHeightOfInfoContainer.constant = WRATIO_SIZE(57.0f);
    
    self.alcHeightOfProfileImage.constant = WRATIO_SIZE(37.0f);
    self.alcWidthOfProfileImage.constant = WRATIO_SIZE(37.0f);
    self.alcLeadingOfProfileImage.constant = WRATIO_SIZE(13.0f);
    self.alcLeadingOfTitleLabel.constant = WRATIO_SIZE(11.0f);
    self.alcBottomOfTitleLabel.constant = WRATIO_SIZE(2.0f);
    self.alcTopOfNickLabel.constant = WRATIO_SIZE(1.0f);
    
    self.alcWidthOfLikeIcon.constant = WRATIO_SIZE(16.0f);
    self.alcHeightOfLikeIcon.constant = WRATIO_SIZE(16.0f);
    self.alcWidthOfCommentIcon.constant = WRATIO_SIZE(17.0f);
    self.alcWidthOfViewIcon.constant = WRATIO_SIZE(22.0f);
    self.alcTrailingOfLikeIcon.constant = WRATIO_SIZE(19.0f);
    self.alcTrailingOfCommentIcon.constant= WRATIO_SIZE(23.0f);
    self.alcTrailingOfViewIcon.constant = WRATIO_SIZE(23.0f);
    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.ivProfile.layer.cornerRadius = self.alcHeightOfProfileImage.constant / 2;
    self.ivProfile.clipsToBounds = YES;
    
    self.lbTitle.font = YH_FONT_HELVETICANEUE_BOLD(WRATIO_SIZE(17.0f));
    self.lbTitle.textColor = [self getColorByStringHexCode:@"f4c34e"];
    
    self.lbNick.font = YH_FONT_HELVETICANEUE(WRATIO_SIZE(13.0f));
    self.lbNick.textColor = [self getColorByStringHexCode:@"ffffff"];
    
    self.lbViewCount.font = YH_FONT_HELVETICANEUE(WRATIO_SIZE(11.0f));
    self.lbViewCount.textColor = [self getColorByStringHexCode:@"ffffff"];
    
    self.lbCommentCount.font = self.lbViewCount.font;
    self.lbCommentCount.textColor = self.lbViewCount.textColor;
    
    self.lbLikeCount.font = self.lbViewCount.font;
    self.lbLikeCount.textColor = self.lbViewCount.textColor;
}

#pragma mark - GBInfiniteScrollView
- (void)infiniteScrollViewSetUp
{
    self.infiniteScrollView.infiniteScrollViewDataSource = self;
    self.infiniteScrollView.infiniteScrollViewDelegate = self;
    self.infiniteScrollView.debug = NO;
    self.infiniteScrollView.verboseDebug = NO;
    self.infiniteScrollView.tapEnabled = YES;
    self.infiniteScrollView.animationDuration = 0.7f;
    self.infiniteScrollView.interval = 3.0f;
    self.infiniteScrollView.pageIndex = 0;
    self.infiniteScrollView.autoScrollDirection = GBAutoScrollDirectionRightToLeft;
    self.infiniteScrollView.scrollDirection = GBScrollDirectionHorizontal;
    self.infiniteScrollView.useInfiniteScrollPanGestureRecognizer = NO;
}

#pragma mark - GBInfiniteScrollViewDelegate

- (void)infiniteScrollViewDidScrollNextPage:(GBInfiniteScrollView *)infiniteScrollView
{
    // [self setUserIfoViewAnimation];
}

- (void)infiniteScrollViewDidScrollPreviousPage:(GBInfiniteScrollView *)infiniteScrollView
{
    // [self setUserIfoViewAnimation];
}

- (BOOL)infiniteScrollViewShouldScrollNextPage:(GBInfiniteScrollView *)infiniteScrollView
{
    return YES;
}

- (BOOL)infiniteScrollViewShouldScrollPreviousPage:(GBInfiniteScrollView *)infiniteScrollView
{
    return YES;
}

- (NSInteger)numberOfPagesInInfiniteScrollView:(GBInfiniteScrollView *)infiniteScrollView
{
    NSInteger rowCount = self.coverList.count;
    
    return rowCount;
}

- (GBInfiniteScrollViewPage *)infiniteScrollView:(GBInfiniteScrollView *)infiniteScrollView pageAtIndex:(NSUInteger)index;
{
    GBInfiniteScrollViewPage *page = [infiniteScrollView dequeueReusablePage];
    
    if (page == nil) {
        page = [[GBInfiniteScrollViewPage alloc] initWithFrame:CGRectMake(0, 0, deviceWidth, deviceWidth) style:GBInfiniteScrollViewPageStyleCustom];
    }
    
    [page.contentView addSubview:[self addInfiniteScrollViewPageAtIndex:index]];
//
    [self setUserIfoViewAnimation];
    
    return page;
}

- (UIView *)addInfiniteScrollViewPageAtIndex:(NSInteger)index
{
    
    UIView *result = [[UIView alloc]initWithFrame:CGRectMake(0, 0, deviceWidth, deviceWidth)];
    
    if(index == 0 || index == 3)
    {
        result.backgroundColor = [UIColor blueColor];
    }
    else
    {
        result.backgroundColor = [UIColor grayColor];
    }
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:result.frame];
    
    iv.clipsToBounds = YES;
    iv.contentMode = UIViewContentModeScaleAspectFill;
    
    @try {
        SFBResponseArtWork *artwork = self.coverList[index];
        
        [self setImageView:iv urlString:artwork.thumb.imageKey placeholderImage:nil animation:YES];
        
        self.lbTitle.text = artwork.artWorkTitle;
        
        self.lbNick.text = artwork.user.userNick;
        
        [self setImageView:self.ivProfile urlString:artwork.user.userPhoto placeholderImage:nil animation:YES];
        
        self.lbViewCount.text = [self convertedCount:artwork.hitCount];
        
        self.lbCommentCount.text = [self convertedCount:artwork.commentCount];
        
        self.lbLikeCount.text = [self convertedCount:artwork.likeCount];
        
        [result addSubview:iv];
        
        UIView *view = self.infoContainer;
        
        [result addSubview:view];
    }
    @catch (NSException *exception)
    {
        NSLog(@"no coverList");
        
    }

    //self.alcBottomOfInfoContainer.constant = -WRATIO_SIZE(57.0f);
    
    [self layoutIfNeeded];
    
    return result;
    
}

- (void)setUserIfoViewAnimation
{
    NSTimeInterval animationDuration = 0.5f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.4f options:animationOptions animations:^{
        
        self.alcBottomOfInfoContainer.constant = 0.0;
        
        [self layoutIfNeeded];
        
    } completion:nil];
    
}


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
