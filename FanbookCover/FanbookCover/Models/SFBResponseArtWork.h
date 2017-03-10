//
//  SFBResponseArtWork.h
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFBThumb, SFBUser;

@interface SFBResponseArtWork : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger likeCount;
@property (nonatomic, strong) NSString *cuNickName;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSString *artWorkMovie;
@property (nonatomic, strong) NSString *artWorkTitle;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) NSArray *artWorkListImage;
@property (nonatomic, strong) SFBThumb *thumb;
@property (nonatomic, assign) NSInteger isContest;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, assign) NSInteger artWorkType;
@property (nonatomic, strong) NSString *reserveDateSet;
@property (nonatomic, strong) NSString *reserveHourSet;
@property (nonatomic, assign) NSInteger selfInspection;
@property (nonatomic, assign) BOOL hasBadge;
@property (nonatomic, assign) BOOL hasCeleb;
@property (nonatomic, assign) NSInteger artWorkKind;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, strong) SFBUser *user;
@property (nonatomic, strong) id artWorkPromotion;
@property (nonatomic, strong) NSString *artWorkDesc;
@property (nonatomic, strong) NSString *selfInclude;
@property (nonatomic, assign) BOOL like;
@property (nonatomic, strong) NSString *reserveMinuteSet;
@property (nonatomic, assign) NSInteger isActive;
@property (nonatomic, assign) NSInteger cuCount;
@property (nonatomic, assign) NSInteger hitCount;
@property (nonatomic, assign) NSTimeInterval createDate;
@property (nonatomic, strong) NSString *cuTitle;
@property (nonatomic, strong) NSArray *artWorkThumb;
@property (nonatomic, assign) NSTimeInterval artWorkOpenDate;
@property (nonatomic, assign) BOOL reserveSet;
@property (nonatomic, strong) NSArray *artWorkAttache;
@property (nonatomic, assign) NSInteger artWorkIdx;
@property (nonatomic, strong) NSString *artWorkHashTag;
@property (nonatomic, assign) NSInteger isActiveAdmin;
@property (nonatomic, strong) NSString *artworkShareUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
