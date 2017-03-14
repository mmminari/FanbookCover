//
//  CoverView.m
//  FanbookCover
//
//  Created by 김민아 on 2017. 3. 10..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "CoverView.h"
#import "Tools.h"

@interface CoverView ()

#pragma mark - UI
@property (weak, nonatomic) IBOutlet UIView *infoContainer;
@property (weak, nonatomic) IBOutlet UIImageView *ivCover;
@property (weak, nonatomic) IBOutlet UIImageView *ivUserProfile;

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbNick;
@property (weak, nonatomic) IBOutlet UILabel *lbViewCount;
@property (weak, nonatomic) IBOutlet UILabel *lbCommentCount;
@property (weak, nonatomic) IBOutlet UILabel *lbLikeCount;
@property (weak, nonatomic) IBOutlet UIImageView *ivView;
@property (weak, nonatomic) IBOutlet UIImageView *ivComment;
@property (weak, nonatomic) IBOutlet UIImageView *ivLike;

#pragma mark - Data
@property (strong, nonatomic) Tools *tools;

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

@implementation CoverView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tools = [[Tools alloc]init];
    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.ivUserProfile.layer.cornerRadius = self.alcHeightOfProfileImage.constant / 2;
    self.ivUserProfile.clipsToBounds = YES;
    
    self.lbTitle.font = YH_FONT_HELVETICANEUE_BOLD(WRATIO_SIZE(17.0f));
    self.lbTitle.textColor = [self.tools getColorByStringHexCode:@"f4c34e"];
    
    self.lbNick.font = YH_FONT_HELVETICANEUE(WRATIO_SIZE(13.0f));
    self.lbNick.textColor = [self.tools getColorByStringHexCode:@"ffffff"];
    
    self.lbViewCount.font = YH_FONT_HELVETICANEUE(WRATIO_SIZE(11.0f));
    self.lbViewCount.textColor = [self.tools getColorByStringHexCode:@"ffffff"];
    
    self.lbCommentCount.font = self.lbViewCount.font;
    self.lbCommentCount.textColor = self.lbViewCount.textColor;
    
    self.lbLikeCount.font = self.lbViewCount.font;
    self.lbLikeCount.textColor = self.lbViewCount.textColor;
    
    // infoContainer가 imageView뒤에 깔려있음
    // 제일 앞으로 이동시켜줌
    [self bringSubviewToFront:self.infoContainer];
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

#pragma mark - Public Method

- (void)setCoverImageWithURLString:(NSString *)urlString
{
    [self.tools setImageView:self.ivCover urlString:urlString placeholderImage:nil animation:YES];
}

- (void)setUserProfileImage:(NSString *)urlString userNick:(NSString *)userNick
{
    [self.tools setImageView:self.ivUserProfile urlString:urlString placeholderImage:nil animation:YES];
    
    self.lbNick.text = userNick;
}

- (void)setTitle:(NSString *)title
{
    self.lbTitle.text = title;
}

- (void)setViewCount:(NSInteger)viewCount commentCount:(NSInteger)commetCount likeCount:(NSInteger)likeCount
{
    self.lbViewCount.text = [self.tools convertedCount:viewCount ];
    
    self.lbCommentCount.text = [self.tools convertedCount:commetCount];
    
    self.lbLikeCount.text = [self.tools convertedCount:likeCount];
}

// 하단 userInfoContainer 애니메이션 처리
- (void)setUserIfoViewAnimation
{
    NSTimeInterval animationDuration = 0.5f;
    
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:animationDuration delay:0.4f options:animationOptions animations:^{
        
        self.alcBottomOfInfoContainer.constant = 0.0;
        
        [self layoutIfNeeded];
        
    } completion:nil];
    
}

#pragma mark - Private Method


@end
