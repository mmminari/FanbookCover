//
//  SFBArtWorkListImage.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBArtWorkListImage.h"


NSString *const kSFBArtWorkListImageIsMain = @"isMain";
NSString *const kSFBArtWorkListImageHeight = @"height";
NSString *const kSFBArtWorkListImageFileName = @"fileName";
NSString *const kSFBArtWorkListImageOrder = @"order";
NSString *const kSFBArtWorkListImageImageKey = @"imageKey";
NSString *const kSFBArtWorkListImageSize = @"size";
NSString *const kSFBArtWorkListImageWidth = @"width";
NSString *const kSFBArtWorkListImageThumbType = @"thumbType";
NSString *const kSFBArtWorkListImageDesc = @"desc";
NSString *const kSFBArtWorkListImageUrl = @"url";


@interface SFBArtWorkListImage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBArtWorkListImage


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
            self.isMain = [[self objectOrNilForKey:kSFBArtWorkListImageIsMain fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kSFBArtWorkListImageHeight fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kSFBArtWorkListImageFileName fromDictionary:dict];
            self.order = [self objectOrNilForKey:kSFBArtWorkListImageOrder fromDictionary:dict];
            self.imageKey = [self objectOrNilForKey:kSFBArtWorkListImageImageKey fromDictionary:dict];
            self.size = [self objectOrNilForKey:kSFBArtWorkListImageSize fromDictionary:dict];
            self.width = [self objectOrNilForKey:kSFBArtWorkListImageWidth fromDictionary:dict];
            self.thumbType = [[self objectOrNilForKey:kSFBArtWorkListImageThumbType fromDictionary:dict] integerValue];
            self.desc = [self objectOrNilForKey:kSFBArtWorkListImageDesc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSFBArtWorkListImageUrl fromDictionary:dict];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMain] forKey:kSFBArtWorkListImageIsMain];
    [mutableDict setValue:self.height forKey:kSFBArtWorkListImageHeight];
    [mutableDict setValue:self.fileName forKey:kSFBArtWorkListImageFileName];
    [mutableDict setValue:self.order forKey:kSFBArtWorkListImageOrder];
    [mutableDict setValue:self.imageKey forKey:kSFBArtWorkListImageImageKey];
    [mutableDict setValue:self.size forKey:kSFBArtWorkListImageSize];
    [mutableDict setValue:self.width forKey:kSFBArtWorkListImageWidth];
    [mutableDict setValue:[NSNumber numberWithInteger:self.thumbType] forKey:kSFBArtWorkListImageThumbType];
    [mutableDict setValue:self.desc forKey:kSFBArtWorkListImageDesc];
    [mutableDict setValue:self.url forKey:kSFBArtWorkListImageUrl];

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

    self.isMain = [aDecoder decodeBoolForKey:kSFBArtWorkListImageIsMain];
    self.height = [aDecoder decodeObjectForKey:kSFBArtWorkListImageHeight];
    self.fileName = [aDecoder decodeObjectForKey:kSFBArtWorkListImageFileName];
    self.order = [aDecoder decodeObjectForKey:kSFBArtWorkListImageOrder];
    self.imageKey = [aDecoder decodeObjectForKey:kSFBArtWorkListImageImageKey];
    self.size = [aDecoder decodeObjectForKey:kSFBArtWorkListImageSize];
    self.width = [aDecoder decodeObjectForKey:kSFBArtWorkListImageWidth];
    self.thumbType = [aDecoder decodeIntegerForKey:kSFBArtWorkListImageThumbType];
    self.desc = [aDecoder decodeObjectForKey:kSFBArtWorkListImageDesc];
    self.url = [aDecoder decodeObjectForKey:kSFBArtWorkListImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isMain forKey:kSFBArtWorkListImageIsMain];
    [aCoder encodeObject:_height forKey:kSFBArtWorkListImageHeight];
    [aCoder encodeObject:_fileName forKey:kSFBArtWorkListImageFileName];
    [aCoder encodeObject:_order forKey:kSFBArtWorkListImageOrder];
    [aCoder encodeObject:_imageKey forKey:kSFBArtWorkListImageImageKey];
    [aCoder encodeObject:_size forKey:kSFBArtWorkListImageSize];
    [aCoder encodeObject:_width forKey:kSFBArtWorkListImageWidth];
    [aCoder encodeInteger:_thumbType forKey:kSFBArtWorkListImageThumbType];
    [aCoder encodeObject:_desc forKey:kSFBArtWorkListImageDesc];
    [aCoder encodeObject:_url forKey:kSFBArtWorkListImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBArtWorkListImage *copy = [[SFBArtWorkListImage alloc] init];
    
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
