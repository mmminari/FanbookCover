//
//  SFBArtWorkThumb.m
//
//  Created by   on 2017. 1. 18.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SFBArtWorkThumb.h"

NSString *const kSFBArtWorkThumbIsMain = @"isMain";
NSString *const kSFBArtWorkThumbHeight = @"height";
NSString *const kSFBArtWorkThumbFileName = @"fileName";
NSString *const kSFBArtWorkThumbOrder = @"order";
NSString *const kSFBArtWorkThumbImageKey = @"imageKey";
NSString *const kSFBArtWorkThumbSize = @"size";
NSString *const kSFBArtWorkThumbWidth = @"width";
NSString *const kSFBArtWorkThumbThumbType = @"thumbType";
NSString *const kSFBArtWorkThumbDesc = @"desc";
NSString *const kSFBArtWorkThumbUrl = @"url";


@interface SFBArtWorkThumb ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBArtWorkThumb


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
            self.isMain = [[self objectOrNilForKey:kSFBArtWorkThumbIsMain fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kSFBArtWorkThumbHeight fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kSFBArtWorkThumbFileName fromDictionary:dict];
            self.order = [self objectOrNilForKey:kSFBArtWorkThumbOrder fromDictionary:dict];
            self.imageKey = [self objectOrNilForKey:kSFBArtWorkThumbImageKey fromDictionary:dict];
            self.size = [self objectOrNilForKey:kSFBArtWorkThumbSize fromDictionary:dict];
            self.width = [self objectOrNilForKey:kSFBArtWorkThumbWidth fromDictionary:dict];
            self.thumbType = [[self objectOrNilForKey:kSFBArtWorkThumbThumbType fromDictionary:dict] integerValue];
            self.desc = [self objectOrNilForKey:kSFBArtWorkThumbDesc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSFBArtWorkThumbUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMain] forKey:kSFBArtWorkThumbIsMain];
    [mutableDict setValue:self.height forKey:kSFBArtWorkThumbHeight];
    [mutableDict setValue:self.fileName forKey:kSFBArtWorkThumbFileName];
    [mutableDict setValue:self.order forKey:kSFBArtWorkThumbOrder];
    [mutableDict setValue:self.imageKey forKey:kSFBArtWorkThumbImageKey];
    [mutableDict setValue:self.size forKey:kSFBArtWorkThumbSize];
    [mutableDict setValue:self.width forKey:kSFBArtWorkThumbWidth];
    [mutableDict setValue:[NSNumber numberWithInteger:self.thumbType] forKey:kSFBArtWorkThumbThumbType];
    [mutableDict setValue:self.desc forKey:kSFBArtWorkThumbDesc];
    [mutableDict setValue:self.url forKey:kSFBArtWorkThumbUrl];

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

    self.isMain = [aDecoder decodeBoolForKey:kSFBArtWorkThumbIsMain];
    self.height = [aDecoder decodeObjectForKey:kSFBArtWorkThumbHeight];
    self.fileName = [aDecoder decodeObjectForKey:kSFBArtWorkThumbFileName];
    self.order = [aDecoder decodeObjectForKey:kSFBArtWorkThumbOrder];
    self.imageKey = [aDecoder decodeObjectForKey:kSFBArtWorkThumbImageKey];
    self.size = [aDecoder decodeObjectForKey:kSFBArtWorkThumbSize];
    self.width = [aDecoder decodeObjectForKey:kSFBArtWorkThumbWidth];
    self.thumbType = [aDecoder decodeIntegerForKey:kSFBArtWorkThumbThumbType];
    self.desc = [aDecoder decodeObjectForKey:kSFBArtWorkThumbDesc];
    self.url = [aDecoder decodeObjectForKey:kSFBArtWorkThumbUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isMain forKey:kSFBArtWorkThumbIsMain];
    [aCoder encodeObject:_height forKey:kSFBArtWorkThumbHeight];
    [aCoder encodeObject:_fileName forKey:kSFBArtWorkThumbFileName];
    [aCoder encodeObject:_order forKey:kSFBArtWorkThumbOrder];
    [aCoder encodeObject:_imageKey forKey:kSFBArtWorkThumbImageKey];
    [aCoder encodeObject:_size forKey:kSFBArtWorkThumbSize];
    [aCoder encodeObject:_width forKey:kSFBArtWorkThumbWidth];
    [aCoder encodeInteger:_thumbType forKey:kSFBArtWorkThumbThumbType];
    [aCoder encodeObject:_desc forKey:kSFBArtWorkThumbDesc];
    [aCoder encodeObject:_url forKey:kSFBArtWorkThumbUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBArtWorkThumb *copy = [[SFBArtWorkThumb alloc] init];
    
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
