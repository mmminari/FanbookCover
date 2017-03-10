//
//  SFBUserModelUserCountSummary.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBUserCountSummary.h"


NSString *const kSFBUserModelUserCountSummaryCelebrity = @"celebrity";
NSString *const kSFBUserModelUserCountSummaryFollowing = @"following";
NSString *const kSFBUserModelUserCountSummaryUserIdx = @"userIdx";
NSString *const kSFBUserModelUserCountSummaryFollower = @"follower";
NSString *const kSFBUserModelUserCountSummaryArtWork = @"artWork";
NSString *const kSFBUserModelUserCountSummaryLike = @"like";
NSString *const kSFBUserModelUserCountSummaryCuration = @"curation";
NSString *const kUserCountSummaryHitTotalCount = @"hitTotalCount";
NSString *const kUserCountSummaryLikeTotalCount = @"likeTotalCount";


@interface SFBUserCountSummary ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBUserCountSummary



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.celebrity = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryCelebrity fromDictionary:dict] integerValue];
            self.following = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryFollowing fromDictionary:dict]integerValue];
            self.userIdx = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryUserIdx fromDictionary:dict] integerValue];
            self.follower = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryFollower fromDictionary:dict]integerValue];
            self.artWork = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryArtWork fromDictionary:dict]integerValue];
            self.like = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryLike fromDictionary:dict]integerValue];
            self.curation = [[self objectOrNilForKey:kSFBUserModelUserCountSummaryCuration fromDictionary:dict]integerValue];
            self.hitTotalCount = [[self objectOrNilForKey:kUserCountSummaryHitTotalCount fromDictionary:dict] integerValue];
            self.likeTotalCount = [[self objectOrNilForKey:kUserCountSummaryLikeTotalCount fromDictionary:dict] integerValue];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.celebrity] forKey:kSFBUserModelUserCountSummaryCelebrity];
    [mutableDict setValue:[NSNumber numberWithInteger:self.following]forKey:kSFBUserModelUserCountSummaryFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdx] forKey:kSFBUserModelUserCountSummaryUserIdx];
    [mutableDict setValue:[NSNumber numberWithInteger:self.follower] forKey:kSFBUserModelUserCountSummaryFollower];
    [mutableDict setValue:[NSNumber numberWithInteger:self.artWork] forKey:kSFBUserModelUserCountSummaryArtWork];
    [mutableDict setValue:[NSNumber numberWithInteger:self.like] forKey:kSFBUserModelUserCountSummaryLike];
    [mutableDict setValue:[NSNumber numberWithInteger:self.curation] forKey:kSFBUserModelUserCountSummaryCuration];
    [mutableDict setValue:[NSNumber numberWithInteger:self.hitTotalCount] forKey:kUserCountSummaryHitTotalCount];
    [mutableDict setValue:[NSNumber numberWithInteger:self.likeTotalCount] forKey:kUserCountSummaryLikeTotalCount];


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

    self.celebrity = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryCelebrity];
    self.following = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryFollowing];
    self.userIdx = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryUserIdx];
    self.follower = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryFollower];
    self.artWork = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryArtWork];
    self.like = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryLike];
    self.curation = [aDecoder decodeIntegerForKey:kSFBUserModelUserCountSummaryCuration];
    self.hitTotalCount = [aDecoder decodeIntegerForKey:kUserCountSummaryHitTotalCount];
    self.likeTotalCount = [aDecoder decodeIntegerForKey:kUserCountSummaryLikeTotalCount];


    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_celebrity forKey:kSFBUserModelUserCountSummaryCelebrity];
    [aCoder encodeInteger:_following forKey:kSFBUserModelUserCountSummaryFollowing];
    [aCoder encodeInteger:_userIdx forKey:kSFBUserModelUserCountSummaryUserIdx];
    [aCoder encodeInteger:_follower forKey:kSFBUserModelUserCountSummaryFollower];
    [aCoder encodeInteger:_artWork forKey:kSFBUserModelUserCountSummaryArtWork];
    [aCoder encodeInteger:_like forKey:kSFBUserModelUserCountSummaryLike];
    [aCoder encodeInteger:_curation forKey:kSFBUserModelUserCountSummaryCuration];
    [aCoder encodeInteger:_hitTotalCount forKey:kUserCountSummaryHitTotalCount];
    [aCoder encodeInteger:_likeTotalCount forKey:kUserCountSummaryLikeTotalCount];


}

- (id)copyWithZone:(NSZone *)zone
{
    SFBUserCountSummary *copy = [[SFBUserCountSummary alloc] init];
    
    if (copy) {

        copy.celebrity = self.celebrity;
        copy.following = self.following;
        copy.userIdx = self.userIdx;
        copy.follower = self.follower;
        copy.artWork = self.artWork;
        copy.like = self.like;
        copy.curation = self.curation;
        copy.hitTotalCount = self.hitTotalCount;
        copy.likeTotalCount = self.likeTotalCount;


    }
    return copy;
}


@end
