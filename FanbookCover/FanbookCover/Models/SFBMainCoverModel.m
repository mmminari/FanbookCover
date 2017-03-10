//
//  SFBMainCoverModel.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBMainCoverModel.h"
#import "SFBMainCoverData.h"


NSString *const kSFBMainCoverModelMessage = @"message";
NSString *const kSFBMainCoverModelData = @"data";
NSString *const kSFBMainCoverModelCode = @"code";


@interface SFBMainCoverModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBMainCoverModel


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
            self.message = [self objectOrNilForKey:kSFBMainCoverModelMessage fromDictionary:dict];
            self.data = [SFBMainCoverData modelObjectWithDictionary:[dict objectForKey:kSFBMainCoverModelData]];
            self.code = [[self objectOrNilForKey:kSFBMainCoverModelCode fromDictionary:dict] integerValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kSFBMainCoverModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kSFBMainCoverModelData];
    [mutableDict setValue:[NSNumber numberWithInteger:self.code] forKey:kSFBMainCoverModelCode];

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

    self.message = [aDecoder decodeObjectForKey:kSFBMainCoverModelMessage];
    self.data = [aDecoder decodeObjectForKey:kSFBMainCoverModelData];
    self.code = [aDecoder decodeIntegerForKey:kSFBMainCoverModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kSFBMainCoverModelMessage];
    [aCoder encodeObject:_data forKey:kSFBMainCoverModelData];
    [aCoder encodeInteger:_code forKey:kSFBMainCoverModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBMainCoverModel *copy = [[SFBMainCoverModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
