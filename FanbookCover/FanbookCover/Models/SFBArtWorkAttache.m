//
//  SFBArtWorkAttache.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBArtWorkAttache.h"


NSString *const kSFBArtWorkAttacheIsMain = @"isMain";
NSString *const kSFBArtWorkAttacheHeight = @"height";
NSString *const kSFBArtWorkAttacheFileName = @"fileName";
NSString *const kSFBArtWorkAttacheOrder = @"order";
NSString *const kSFBArtWorkAttacheImageKey = @"imageKey";
NSString *const kSFBArtWorkAttacheSize = @"size";
NSString *const kSFBArtWorkAttacheWidth = @"width";
NSString *const kSFBArtWorkAttacheThumbType = @"thumbType";
NSString *const kSFBArtWorkAttacheDesc = @"desc";
NSString *const kSFBArtWorkAttacheUrl = @"url";


@interface SFBArtWorkAttache ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBArtWorkAttache

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
            self.isMain = [[self objectOrNilForKey:kSFBArtWorkAttacheIsMain fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kSFBArtWorkAttacheHeight fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kSFBArtWorkAttacheFileName fromDictionary:dict];
            self.order = [self objectOrNilForKey:kSFBArtWorkAttacheOrder fromDictionary:dict];
            self.imageKey = [self objectOrNilForKey:kSFBArtWorkAttacheImageKey fromDictionary:dict];
            self.size = [self objectOrNilForKey:kSFBArtWorkAttacheSize fromDictionary:dict];
            self.width = [self objectOrNilForKey:kSFBArtWorkAttacheWidth fromDictionary:dict];
            self.thumbType = [[self objectOrNilForKey:kSFBArtWorkAttacheThumbType fromDictionary:dict] integerValue];
            self.desc = [self objectOrNilForKey:kSFBArtWorkAttacheDesc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSFBArtWorkAttacheUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMain] forKey:kSFBArtWorkAttacheIsMain];
    [mutableDict setValue:self.height forKey:kSFBArtWorkAttacheHeight];
    [mutableDict setValue:self.fileName forKey:kSFBArtWorkAttacheFileName];
    [mutableDict setValue:self.order forKey:kSFBArtWorkAttacheOrder];
    [mutableDict setValue:self.imageKey forKey:kSFBArtWorkAttacheImageKey];
    [mutableDict setValue:self.size forKey:kSFBArtWorkAttacheSize];
    [mutableDict setValue:self.width forKey:kSFBArtWorkAttacheWidth];
    [mutableDict setValue:[NSNumber numberWithInteger:self.thumbType] forKey:kSFBArtWorkAttacheThumbType];
    [mutableDict setValue:self.desc forKey:kSFBArtWorkAttacheDesc];
    [mutableDict setValue:self.url forKey:kSFBArtWorkAttacheUrl];

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

    self.isMain = [aDecoder decodeBoolForKey:kSFBArtWorkAttacheIsMain];
    self.height = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheHeight];
    self.fileName = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheFileName];
    self.order = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheOrder];
    self.imageKey = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheImageKey];
    self.size = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheSize];
    self.width = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheWidth];
    self.thumbType = [aDecoder decodeIntegerForKey:kSFBArtWorkAttacheThumbType];
    self.desc = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheDesc];
    self.url = [aDecoder decodeObjectForKey:kSFBArtWorkAttacheUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isMain forKey:kSFBArtWorkAttacheIsMain];
    [aCoder encodeObject:_height forKey:kSFBArtWorkAttacheHeight];
    [aCoder encodeObject:_fileName forKey:kSFBArtWorkAttacheFileName];
    [aCoder encodeObject:_order forKey:kSFBArtWorkAttacheOrder];
    [aCoder encodeObject:_imageKey forKey:kSFBArtWorkAttacheImageKey];
    [aCoder encodeObject:_size forKey:kSFBArtWorkAttacheSize];
    [aCoder encodeObject:_width forKey:kSFBArtWorkAttacheWidth];
    [aCoder encodeInteger:_thumbType forKey:kSFBArtWorkAttacheThumbType];
    [aCoder encodeObject:_desc forKey:kSFBArtWorkAttacheDesc];
    [aCoder encodeObject:_url forKey:kSFBArtWorkAttacheUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBArtWorkAttache *copy = [[SFBArtWorkAttache alloc] init];
    
    if (copy) {

        copy.isMain = self.isMain;
        copy.height = [self.height copyWithZone:zone];
        copy.fileName = [self.fileName copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.imageKey = [self.imageKey copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.thumbType = self.thumbType;
        copy.desc = [self.desc copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
