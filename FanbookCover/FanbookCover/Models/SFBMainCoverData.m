//
//  SFBMainCoverData.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBMainCoverData.h"
#import "SFBResponseArtWork.h"


NSString *const kSFBMainCoverTotalCount = @"totalCount";
NSString *const kSFBMainCoverResponseArtWork = @"ResponseArtWork";


@interface SFBMainCoverData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBMainCoverData


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
            self.totalCount = [[self objectOrNilForKey:kSFBMainCoverTotalCount fromDictionary:dict] integerValue];
    NSObject *receivedSFBResponseArtWork = [dict objectForKey:kSFBMainCoverResponseArtWork];
    NSMutableArray *parsedSFBResponseArtWork = [NSMutableArray array];
    if ([receivedSFBResponseArtWork isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSFBResponseArtWork) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSFBResponseArtWork addObject:[SFBResponseArtWork modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSFBResponseArtWork isKindOfClass:[NSDictionary class]]) {
       [parsedSFBResponseArtWork addObject:[SFBResponseArtWork modelObjectWithDictionary:(NSDictionary *)receivedSFBResponseArtWork]];
    }

    self.responseArtWork = [NSArray arrayWithArray:parsedSFBResponseArtWork];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.totalCount] forKey:kSFBMainCoverTotalCount];
    NSMutableArray *tempArrayForResponseArtWork = [NSMutableArray array];
    for (NSObject *subArrayObject in self.responseArtWork) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResponseArtWork addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResponseArtWork addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResponseArtWork] forKey:kSFBMainCoverResponseArtWork];

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

    self.totalCount = [aDecoder decodeIntegerForKey:kSFBMainCoverTotalCount];
    self.responseArtWork = [aDecoder decodeObjectForKey:kSFBMainCoverResponseArtWork];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_totalCount forKey:kSFBMainCoverTotalCount];
    [aCoder encodeObject:_responseArtWork forKey:kSFBMainCoverResponseArtWork];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBMainCoverData *copy = [[SFBMainCoverData alloc] init];
    
    if (copy) {

        copy.totalCount = self.totalCount;
        copy.responseArtWork = [self.responseArtWork copyWithZone:zone];
    }
    
    return copy;
}


@end
