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

#import <GBInfiniteScrollView/GBInfiniteScrollView.h>

#import "CoverView.h"

#define deviceWidth                                         [UIScreen mainScreen].bounds.size.width

@interface CoverCell () <GBInfiniteScrollViewDelegate, GBInfiniteScrollViewDataSource>

@property (weak, nonatomic) IBOutlet GBInfiniteScrollView *infiniteScrollView;

@end

@implementation CoverCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // infiniteScrollView 초기 세팅 후 auto scroll start
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
    self.infiniteScrollView.interval = 3.0f;
    self.infiniteScrollView.pageIndex = 0;
    self.infiniteScrollView.autoScrollDirection = GBAutoScrollDirectionRightToLeft;
    self.infiniteScrollView.scrollDirection = GBScrollDirectionHorizontal;
}

#pragma mark - GBInfiniteScrollViewDelegate

- (void)infiniteScrollViewDidScrollNextPage:(GBInfiniteScrollView *)infiniteScrollView
{
    [self startCoverInfoViewAnimationWithScrollView:infiniteScrollView];
}

- (void)infiniteScrollViewDidScrollPreviousPage:(GBInfiniteScrollView *)infiniteScrollView
{
    [self startCoverInfoViewAnimationWithScrollView:infiniteScrollView];
}

- (BOOL)infiniteScrollViewShouldScrollNextPage:(GBInfiniteScrollView *)infiniteScrollView
{
    return YES;
}

- (BOOL)infiniteScrollViewShouldScrollPreviousPage:(GBInfiniteScrollView *)infiniteScrollView
{
    return YES;
}

#pragma mark - GBInfiniteScrollViewDataSource

- (NSInteger)numberOfPagesInInfiniteScrollView:(GBInfiniteScrollView *)infiniteScrollView
{
    NSInteger rowCount = self.coverList.count;
    
    return rowCount;
}

- (GBInfiniteScrollViewPage *)infiniteScrollView:(GBInfiniteScrollView *)infiniteScrollView pageAtIndex:(NSUInteger)index;
{
    static BOOL didShow = NO;
    
    GBInfiniteScrollViewPage *page = [infiniteScrollView dequeueReusablePage];
    
    if (page == nil) {
        page = [[GBInfiniteScrollViewPage alloc] initWithFrame:CGRectMake(0, 0, deviceWidth, deviceWidth) style:GBInfiniteScrollViewPageStyleCustom];
    }
    
    CoverView *view = [self addInfiniteScrollViewPageAtIndex:index];
    
    [page.contentView addSubview:view];
    
    // 최초 실행시 처음 cell은 바로 애니메이션 처리
    // 다른 셀 -> 0번째 셀 일 경우에는 바로 애니메이션 처리 X
    if(!didShow)
    {
        if(index== 0)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self startCoverInfoViewAnimationWithScrollView:infiniteScrollView];
                
            });
        }
        didShow = YES;
    }
    
    return page;
}

// CoverView 리턴해주어 각 page의 contentView에 subView로 add
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

// infiniteScrollView의 현재 page의 userInfoView Animation 처리
- (void)startCoverInfoViewAnimationWithScrollView:(GBInfiniteScrollView *)infiniteScrollView
{
    GBInfiniteScrollViewPage *page = [infiniteScrollView currentPage];
    
    CoverView *coverView = nil;
    
    // 현재 보여지는 page의 subview들을 가져와
    // CoverView가 있을 경우 애니메이션 처리
    for (UIView *view in page.contentView.subviews) {
        if([view isKindOfClass:[CoverView class]])
        {
            coverView = (CoverView *)view;
            [coverView setUserIfoViewAnimation];
            break;
        }
    }
    
    NSLog(@"coverView : %@", coverView);
    

}

@end
