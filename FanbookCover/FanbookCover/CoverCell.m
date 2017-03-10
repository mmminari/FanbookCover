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
#import "CoverView.h"

#define deviceWidth                                         [UIScreen mainScreen].bounds.size.width

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



@end

@implementation CoverCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self infiniteScrollViewSetUp];
    
    [self.infiniteScrollView startAutoScroll];
    
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
    
    CoverView *view = [self addInfiniteScrollViewPageAtIndex:index];
    
    [page.contentView addSubview:view];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [view setUserIfoViewAnimation];
    });
    
    return page;
}

- (CoverView *)addInfiniteScrollViewPageAtIndex:(NSInteger)index
{
    
    CoverView *view = [[[NSBundle mainBundle]loadNibNamed:@"CoverView" owner:self options:nil]lastObject];
    
    view.frame = CGRectMake(0, 0, deviceWidth, deviceWidth);

    
    @try {
        
        SFBResponseArtWork *artwork = self.coverList[index];

        [view setCoverImageWithURLString:artwork.thumb.imageKey];
        
        [view setUserProfileImage:artwork.user.userPhoto userNick:artwork.user.userNick];
        
        [view setTitle:artwork.artWorkTitle];
        
        [view setViewCount:artwork.hitCount commentCount:artwork.commentCount likeCount:artwork.likeCount];
        
    
    }
    @catch (NSException *exception)
    {
        NSLog(@"no coverList");
        
    }
    
    return view;
    
}




@end
