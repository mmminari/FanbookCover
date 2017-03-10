//
//  SFBResponseArtWork.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBResponseArtWork.h"
#import "SFBThumb.h"
#import "SFBUser.h"
#import "SFBArtWorkAttache.h"
#import "SFBArtWorkThumb.h"
#import "SFBArtWorkListImage.h"


NSString *const kSFBResponseArtWorkLikeCount = @"likeCount";
NSString *const kSFBResponseArtWorkCuNickName = @"cuNickName";
NSString *const kSFBResponseArtWorkLocale = @"locale";
NSString *const kSFBResponseArtWorkArtWorkMovie = @"artWorkMovie";
NSString *const kSFBResponseArtWorkArtWorkTitle = @"artWorkTitle";
NSString *const kSFBResponseArtWorkLang = @"lang";
NSString *const kSFBResponseArtWorkArtWorkListImage = @"artWorkListImage";
NSString *const kSFBResponseArtWorkThumb = @"thumb";
NSString *const kSFBResponseArtWorkIsContest = @"isContest";
NSString *const kSFBResponseArtWorkCommentCount = @"commentCount";
NSString *const kSFBResponseArtWorkArtWorkType = @"artWorkType";
NSString *const kSFBResponseArtWorkReserveDateSet = @"reserveDateSet";
NSString *const kSFBResponseArtWorkReserveHourSet = @"reserveHourSet";
NSString *const kSFBResponseArtWorkSelfInspection = @"selfInspection";
NSString *const kSFBResponseArtWorkHasBadge = @"hasBadge";
NSString *const kSFBResponseArtWorkHasCeleb = @"hasCeleb";
NSString *const kSFBResponseArtWorkArtWorkKind = @"artWorkKind";
NSString *const kSFBResponseArtWorkFollowing = @"following";
NSString *const kSFBResponseArtWorkUser = @"user";
NSString *const kSFBResponseArtWorkArtWorkPromotion = @"artWorkPromotion";
NSString *const kSFBResponseArtWorkArtWorkDesc = @"artWorkDesc";
NSString *const kSFBResponseArtWorkSelfInclude = @"selfInclude";
NSString *const kSFBResponseArtWorkLike = @"like";
NSString *const kSFBResponseArtWorkReserveMinuteSet = @"reserveMinuteSet";
NSString *const kSFBResponseArtWorkIsActive = @"isActive";
NSString *const kSFBResponseArtWorkCuCount = @"cuCount";
NSString *const kSFBResponseArtWorkHitCount = @"hitCount";
NSString *const kSFBResponseArtWorkCreateDate = @"createDate";
NSString *const kSFBResponseArtWorkCuTitle = @"cuTitle";
NSString *const kSFBResponseArtWorkArtWorkThumb = @"artWorkThumb";
NSString *const kSFBResponseArtWorkArtWorkOpenDate = @"artWorkOpenDate";
NSString *const kSFBResponseArtWorkReserveSet = @"reserveSet";
NSString *const kSFBResponseArtWorkArtWorkAttache = @"artWorkAttache";
NSString *const kSFBResponseArtWorkArtWorkIdx = @"artWorkIdx";
NSString *const kSFBResponseArtWorkArtWorkHashTag = @"artWorkHashTag";
NSString *const kSFBResponseArtWorkIsActiveAdmin = @"isActiveAdmin";
NSString *const kSFBResponseArtWorkArtworkShareUrl = @"artworkShareUrl";

@interface SFBResponseArtWork ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBResponseArtWork


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.likeCount = [[self objectOrNilForKey:kSFBResponseArtWorkLikeCount fromDictionary:dict] integerValue];
        self.cuNickName = [self objectOrNilForKey:kSFBResponseArtWorkCuNickName fromDictionary:dict];
        self.locale = [self objectOrNilForKey:kSFBResponseArtWorkLocale fromDictionary:dict];
        self.artWorkMovie = [self objectOrNilForKey:kSFBResponseArtWorkArtWorkMovie fromDictionary:dict];
        self.artWorkTitle = [self objectOrNilForKey:kSFBResponseArtWorkArtWorkTitle fromDictionary:dict];
        self.lang = [self objectOrNilForKey:kSFBResponseArtWorkLang fromDictionary:dict];
        NSObject *receivedArtWorkListImage = [dict objectForKey:kSFBResponseArtWorkArtWorkListImage];
        NSMutableArray *parsedArtWorkListImage = [NSMutableArray array];
        if ([receivedArtWorkListImage isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedArtWorkListImage) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedArtWorkListImage addObject:[SFBArtWorkListImage modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedArtWorkListImage isKindOfClass:[NSDictionary class]]) {
            [parsedArtWorkListImage addObject:[SFBArtWorkListImage modelObjectWithDictionary:(NSDictionary *)receivedArtWorkListImage]];
        }
        
        self.artWorkListImage = [NSArray arrayWithArray:parsedArtWorkListImage];
        self.thumb = [SFBThumb modelObjectWithDictionary:[dict objectForKey:kSFBResponseArtWorkThumb]];
        self.isContest = [[self objectOrNilForKey:kSFBResponseArtWorkIsContest fromDictionary:dict] integerValue];
        self.commentCount = [[self objectOrNilForKey:kSFBResponseArtWorkCommentCount fromDictionary:dict] integerValue];
        self.artWorkType = [[self objectOrNilForKey:kSFBResponseArtWorkArtWorkType fromDictionary:dict] integerValue];
        self.reserveDateSet = [self objectOrNilForKey:kSFBResponseArtWorkReserveDateSet fromDictionary:dict];
        self.reserveHourSet = [self objectOrNilForKey:kSFBResponseArtWorkReserveHourSet fromDictionary:dict];
        self.selfInspection = [[self objectOrNilForKey:kSFBResponseArtWorkSelfInspection fromDictionary:dict] integerValue];
        self.hasBadge = [[self objectOrNilForKey:kSFBResponseArtWorkHasBadge fromDictionary:dict] boolValue];
        self.hasCeleb = [[self objectOrNilForKey:kSFBResponseArtWorkHasCeleb fromDictionary:dict] boolValue];
        self.artWorkKind = [[self objectOrNilForKey:kSFBResponseArtWorkArtWorkKind fromDictionary:dict] integerValue];
        self.following = [[self objectOrNilForKey:kSFBResponseArtWorkFollowing fromDictionary:dict] boolValue];
        self.user = [SFBUser modelObjectWithDictionary:[dict objectForKey:kSFBResponseArtWorkUser]];
        self.artWorkPromotion = [self objectOrNilForKey:kSFBResponseArtWorkArtWorkPromotion fromDictionary:dict];
        self.artWorkDesc = [self objectOrNilForKey:kSFBResponseArtWorkArtWorkDesc fromDictionary:dict];
        self.selfInclude = [self objectOrNilForKey:kSFBResponseArtWorkSelfInclude fromDictionary:dict];
        self.like = [[self objectOrNilForKey:kSFBResponseArtWorkLike fromDictionary:dict] boolValue];
        self.reserveMinuteSet = [self objectOrNilForKey:kSFBResponseArtWorkReserveMinuteSet fromDictionary:dict];
        self.isActive = [[self objectOrNilForKey:kSFBResponseArtWorkIsActive fromDictionary:dict] integerValue];
        self.cuCount = [[self objectOrNilForKey:kSFBResponseArtWorkCuCount fromDictionary:dict] integerValue];
        self.hitCount = [[self objectOrNilForKey:kSFBResponseArtWorkHitCount fromDictionary:dict] integerValue];
        self.createDate = [[self objectOrNilForKey:kSFBResponseArtWorkCreateDate fromDictionary:dict] doubleValue];
        self.cuTitle = [self objectOrNilForKey:kSFBResponseArtWorkCuTitle fromDictionary:dict];
        NSObject *receivedArtWorkThumb = [dict objectForKey:kSFBResponseArtWorkArtWorkThumb];
        NSMutableArray *parsedArtWorkThumb = [NSMutableArray array];
        if ([receivedArtWorkThumb isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedArtWorkThumb) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedArtWorkThumb addObject:[SFBThumb modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedArtWorkThumb isKindOfClass:[NSDictionary class]]) {
            [parsedArtWorkThumb addObject:[SFBThumb modelObjectWithDictionary:(NSDictionary *)receivedArtWorkThumb]];
        }
        
        self.artWorkThumb = [NSArray arrayWithArray:parsedArtWorkThumb];            self.artWorkOpenDate = [[self objectOrNilForKey:kSFBResponseArtWorkArtWorkOpenDate fromDictionary:dict] doubleValue];
        self.reserveSet = [[self objectOrNilForKey:kSFBResponseArtWorkReserveSet fromDictionary:dict] boolValue];
        NSObject *receivedArtWorkAttache = [dict objectForKey:kSFBResponseArtWorkArtWorkAttache];
        NSMutableArray *parsedArtWorkAttache = [NSMutableArray array];
        if ([receivedArtWorkAttache isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedArtWorkAttache) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedArtWorkAttache addObject:[SFBArtWorkAttache modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedArtWorkAttache isKindOfClass:[NSDictionary class]]) {
            [parsedArtWorkAttache addObject:[SFBArtWorkAttache modelObjectWithDictionary:(NSDictionary *)receivedArtWorkAttache]];
        }
        
        self.artWorkAttache = [NSArray arrayWithArray:parsedArtWorkAttache];            self.artWorkIdx = [[self objectOrNilForKey:kSFBResponseArtWorkArtWorkIdx fromDictionary:dict] integerValue];
        self.artWorkHashTag = [self objectOrNilForKey:kSFBResponseArtWorkArtWorkHashTag fromDictionary:dict];
        
        self.isActiveAdmin = [[self objectOrNilForKey:kSFBResponseArtWorkIsActiveAdmin fromDictionary:dict] integerValue];
        self.artworkShareUrl = [self objectOrNilForKey:kSFBResponseArtWorkArtworkShareUrl fromDictionary:dict];
    }
    

    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.likeCount] forKey:kSFBResponseArtWorkLikeCount];
    [mutableDict setValue:self.cuNickName forKey:kSFBResponseArtWorkCuNickName];
    [mutableDict setValue:self.locale forKey:kSFBResponseArtWorkLocale];
    [mutableDict setValue:self.artWorkMovie forKey:kSFBResponseArtWorkArtWorkMovie];
    [mutableDict setValue:self.artWorkTitle forKey:kSFBResponseArtWorkArtWorkTitle];
    [mutableDict setValue:self.lang forKey:kSFBResponseArtWorkLang];
    NSMutableArray *tempArrayForArtWorkListImage = [NSMutableArray array];
    for (NSObject *subArrayObject in self.artWorkListImage) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArtWorkListImage addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArtWorkListImage addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArtWorkListImage] forKey:kSFBResponseArtWorkArtWorkListImage];    [mutableDict setValue:[self.thumb dictionaryRepresentation] forKey:kSFBResponseArtWorkThumb];
    [mutableDict setValue:[NSNumber numberWithInteger:self.isContest] forKey:kSFBResponseArtWorkIsContest];
    [mutableDict setValue:[NSNumber numberWithInteger:self.commentCount] forKey:kSFBResponseArtWorkCommentCount];
    [mutableDict setValue:[NSNumber numberWithInteger:self.artWorkType] forKey:kSFBResponseArtWorkArtWorkType];
    [mutableDict setValue:self.reserveDateSet forKey:kSFBResponseArtWorkReserveDateSet];
    [mutableDict setValue:self.reserveHourSet forKey:kSFBResponseArtWorkReserveHourSet];
    [mutableDict setValue:[NSNumber numberWithInteger:self.selfInspection] forKey:kSFBResponseArtWorkSelfInspection];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasBadge] forKey:kSFBResponseArtWorkHasBadge];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCeleb] forKey:kSFBResponseArtWorkHasCeleb];
    [mutableDict setValue:[NSNumber numberWithInteger:self.artWorkKind] forKey:kSFBResponseArtWorkArtWorkKind];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kSFBResponseArtWorkFollowing];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kSFBResponseArtWorkUser];
    [mutableDict setValue:self.artWorkPromotion forKey:kSFBResponseArtWorkArtWorkPromotion];
    [mutableDict setValue:self.artWorkDesc forKey:kSFBResponseArtWorkArtWorkDesc];
    [mutableDict setValue:self.selfInclude forKey:kSFBResponseArtWorkSelfInclude];
    [mutableDict setValue:[NSNumber numberWithBool:self.like] forKey:kSFBResponseArtWorkLike];
    [mutableDict setValue:self.reserveMinuteSet forKey:kSFBResponseArtWorkReserveMinuteSet];
    [mutableDict setValue:[NSNumber numberWithInteger:self.isActive] forKey:kSFBResponseArtWorkIsActive];
    [mutableDict setValue:[NSNumber numberWithInteger:self.cuCount] forKey:kSFBResponseArtWorkCuCount];
    [mutableDict setValue:[NSNumber numberWithInteger:self.hitCount] forKey:kSFBResponseArtWorkHitCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createDate] forKey:kSFBResponseArtWorkCreateDate];
    [mutableDict setValue:self.cuTitle forKey:kSFBResponseArtWorkCuTitle];
    NSMutableArray *tempArrayForArtWorkThumb = [NSMutableArray array];
    for (NSObject *subArrayObject in self.artWorkThumb) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArtWorkThumb addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArtWorkThumb addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArtWorkThumb] forKey:kSFBResponseArtWorkArtWorkThumb];    [mutableDict setValue:[NSNumber numberWithDouble:self.artWorkOpenDate] forKey:kSFBResponseArtWorkArtWorkOpenDate];
    [mutableDict setValue:[NSNumber numberWithBool:self.reserveSet] forKey:kSFBResponseArtWorkReserveSet];
    NSMutableArray *tempArrayForArtWorkAttache = [NSMutableArray array];
    for (NSObject *subArrayObject in self.artWorkAttache) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForArtWorkAttache addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForArtWorkAttache addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArtWorkAttache] forKey:kSFBResponseArtWorkArtWorkAttache];    [mutableDict setValue:[NSNumber numberWithInteger:self.artWorkIdx] forKey:kSFBResponseArtWorkArtWorkIdx];
    [mutableDict setValue:self.artWorkHashTag forKey:kSFBResponseArtWorkArtWorkHashTag];
    [mutableDict setValue:@(self.isActiveAdmin) forKey:kSFBResponseArtWorkIsActiveAdmin];
    [mutableDict setValue:self.artworkShareUrl forKey:kSFBResponseArtWorkArtworkShareUrl];


    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.likeCount = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkLikeCount];
    self.cuNickName = [aDecoder decodeObjectForKey:kSFBResponseArtWorkCuNickName];
    self.locale = [aDecoder decodeObjectForKey:kSFBResponseArtWorkLocale];
    self.artWorkMovie = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkMovie];
    self.artWorkTitle = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkTitle];
    self.lang = [aDecoder decodeObjectForKey:kSFBResponseArtWorkLang];
    self.artWorkListImage = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkListImage];
    self.thumb = [aDecoder decodeObjectForKey:kSFBResponseArtWorkThumb];
    self.isContest = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkIsContest];
    self.commentCount = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkCommentCount];
    self.artWorkType = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkArtWorkType];
    self.reserveDateSet = [aDecoder decodeObjectForKey:kSFBResponseArtWorkReserveDateSet];
    self.reserveHourSet = [aDecoder decodeObjectForKey:kSFBResponseArtWorkReserveHourSet];
    self.selfInspection = [aDecoder decodeDoubleForKey:kSFBResponseArtWorkSelfInspection];
    self.hasBadge = [aDecoder decodeBoolForKey:kSFBResponseArtWorkHasBadge];
    self.hasCeleb = [aDecoder decodeBoolForKey:kSFBResponseArtWorkHasCeleb];
    self.artWorkKind = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkArtWorkKind];
    self.following = [aDecoder decodeBoolForKey:kSFBResponseArtWorkFollowing];
    self.user = [aDecoder decodeObjectForKey:kSFBResponseArtWorkUser];
    self.artWorkPromotion = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkPromotion];
    self.artWorkDesc = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkDesc];
    self.selfInclude = [aDecoder decodeObjectForKey:kSFBResponseArtWorkSelfInclude];
    self.like = [aDecoder decodeBoolForKey:kSFBResponseArtWorkLike];
    self.reserveMinuteSet = [aDecoder decodeObjectForKey:kSFBResponseArtWorkReserveMinuteSet];
    self.isActive = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkIsActive];
    self.cuCount = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkCuCount];
    self.hitCount = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkHitCount];
    self.createDate = [aDecoder decodeDoubleForKey:kSFBResponseArtWorkCreateDate];
    self.cuTitle = [aDecoder decodeObjectForKey:kSFBResponseArtWorkCuTitle];
    self.artWorkThumb = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkThumb];
    self.artWorkOpenDate = [aDecoder decodeDoubleForKey:kSFBResponseArtWorkArtWorkOpenDate];
    self.reserveSet = [aDecoder decodeBoolForKey:kSFBResponseArtWorkReserveSet];
    self.artWorkAttache = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkAttache];
    self.artWorkIdx = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkArtWorkIdx];
    self.artWorkHashTag = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtWorkHashTag];
    self.isActiveAdmin = [aDecoder decodeIntegerForKey:kSFBResponseArtWorkIsActiveAdmin];
    self.artworkShareUrl = [aDecoder decodeObjectForKey:kSFBResponseArtWorkArtworkShareUrl];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeInteger:_likeCount forKey:kSFBResponseArtWorkLikeCount];
    [aCoder encodeObject:_cuNickName forKey:kSFBResponseArtWorkCuNickName];
    [aCoder encodeObject:_locale forKey:kSFBResponseArtWorkLocale];
    [aCoder encodeObject:_artWorkMovie forKey:kSFBResponseArtWorkArtWorkMovie];
    [aCoder encodeObject:_artWorkTitle forKey:kSFBResponseArtWorkArtWorkTitle];
    [aCoder encodeObject:_lang forKey:kSFBResponseArtWorkLang];
    [aCoder encodeObject:_artWorkListImage forKey:kSFBResponseArtWorkArtWorkListImage];
    [aCoder encodeObject:_thumb forKey:kSFBResponseArtWorkThumb];
    [aCoder encodeInteger:_isContest forKey:kSFBResponseArtWorkIsContest];
    [aCoder encodeInteger:_commentCount forKey:kSFBResponseArtWorkCommentCount];
    [aCoder encodeInteger:_artWorkType forKey:kSFBResponseArtWorkArtWorkType];
    [aCoder encodeObject:_reserveDateSet forKey:kSFBResponseArtWorkReserveDateSet];
    [aCoder encodeObject:_reserveHourSet forKey:kSFBResponseArtWorkReserveHourSet];
    [aCoder encodeInteger:_selfInspection forKey:kSFBResponseArtWorkSelfInspection];
    [aCoder encodeBool:_hasBadge forKey:kSFBResponseArtWorkHasBadge];
    [aCoder encodeBool:_hasCeleb forKey:kSFBResponseArtWorkHasCeleb];
    [aCoder encodeInteger:_artWorkKind forKey:kSFBResponseArtWorkArtWorkKind];
    [aCoder encodeBool:_following forKey:kSFBResponseArtWorkFollowing];
    [aCoder encodeObject:_user forKey:kSFBResponseArtWorkUser];
    [aCoder encodeObject:_artWorkPromotion forKey:kSFBResponseArtWorkArtWorkPromotion];
    [aCoder encodeObject:_artWorkDesc forKey:kSFBResponseArtWorkArtWorkDesc];
    [aCoder encodeObject:_selfInclude forKey:kSFBResponseArtWorkSelfInclude];
    [aCoder encodeBool:_like forKey:kSFBResponseArtWorkLike];
    [aCoder encodeObject:_reserveMinuteSet forKey:kSFBResponseArtWorkReserveMinuteSet];
    [aCoder encodeInteger:_isActive forKey:kSFBResponseArtWorkIsActive];
    [aCoder encodeInteger:_cuCount forKey:kSFBResponseArtWorkCuCount];
    [aCoder encodeInteger:_hitCount forKey:kSFBResponseArtWorkHitCount];
    [aCoder encodeDouble:_createDate forKey:kSFBResponseArtWorkCreateDate];
    [aCoder encodeObject:_cuTitle forKey:kSFBResponseArtWorkCuTitle];
    [aCoder encodeObject:_artWorkThumb forKey:kSFBResponseArtWorkArtWorkThumb];
    [aCoder encodeDouble:_artWorkOpenDate forKey:kSFBResponseArtWorkArtWorkOpenDate];
    [aCoder encodeBool:_reserveSet forKey:kSFBResponseArtWorkReserveSet];
    [aCoder encodeObject:_artWorkAttache forKey:kSFBResponseArtWorkArtWorkAttache];
    [aCoder encodeInteger:_artWorkIdx forKey:kSFBResponseArtWorkArtWorkIdx];
    [aCoder encodeObject:_artWorkHashTag forKey:kSFBResponseArtWorkArtWorkHashTag];
    [aCoder encodeInteger:_isActiveAdmin forKey:kSFBResponseArtWorkIsActiveAdmin];
    [aCoder encodeObject:_artworkShareUrl forKey:kSFBResponseArtWorkArtworkShareUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBResponseArtWork *copy = [[SFBResponseArtWork alloc] init];
    
    if (copy) {
        
        copy.likeCount = self.likeCount;
        copy.cuNickName = [self.cuNickName copyWithZone:zone];
        copy.locale = [self.locale copyWithZone:zone];
        copy.artWorkMovie = [self.artWorkMovie copyWithZone:zone];
        copy.artWorkTitle = [self.artWorkTitle copyWithZone:zone];
        copy.lang = [self.lang copyWithZone:zone];
        copy.artWorkListImage = [self.artWorkListImage copyWithZone:zone];
        copy.thumb = [self.thumb copyWithZone:zone];
        copy.isContest = self.isContest;
        copy.commentCount = self.commentCount;
        copy.artWorkType = self.artWorkType;
        copy.reserveDateSet = [self.reserveDateSet copyWithZone:zone];
        copy.reserveHourSet = [self.reserveHourSet copyWithZone:zone];
        copy.selfInspection = self.selfInspection;
        copy.hasBadge = self.hasBadge;
        copy.hasCeleb = self.hasCeleb;
        copy.artWorkKind = self.artWorkKind;
        copy.following = self.following;
        copy.user = [self.user copyWithZone:zone];
        copy.artWorkPromotion = [self.artWorkPromotion copyWithZone:zone];
        copy.artWorkDesc = [self.artWorkDesc copyWithZone:zone];
        copy.selfInclude = [self.selfInclude copyWithZone:zone];
        copy.like = self.like;
        copy.reserveMinuteSet = [self.reserveMinuteSet copyWithZone:zone];
        copy.isActive = self.isActive;
        copy.cuCount = self.cuCount;
        copy.hitCount = self.hitCount;
        copy.createDate = self.createDate;
        copy.cuTitle = [self.cuTitle copyWithZone:zone];
        copy.artWorkThumb = [self.artWorkThumb copyWithZone:zone];
        copy.artWorkOpenDate = self.artWorkOpenDate;
        copy.reserveSet = self.reserveSet;
        copy.artWorkAttache = [self.artWorkAttache copyWithZone:zone];
        copy.artWorkIdx = self.artWorkIdx;
        copy.artWorkHashTag = [self.artWorkHashTag copyWithZone:zone];        
        copy.isActiveAdmin = self.isActiveAdmin;
        copy.hasCeleb = self.hasCeleb;
        copy.artworkShareUrl = [self.artworkShareUrl copyWithZone:zone];


    }
    
    return copy;
}


@end
