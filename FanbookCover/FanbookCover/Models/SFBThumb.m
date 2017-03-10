//
//  SFBThumb.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBThumb.h"

NSString *const kSFBThumbIsMain = @"isMain";
NSString *const kSFBThumbHeight = @"height";
NSString *const kSFBThumbFileName = @"fileName";
NSString *const kSFBThumbOrder = @"order";
NSString *const kSFBThumbImageKey = @"imageKey";
NSString *const kSFBThumbSize = @"size";
NSString *const kSFBThumbWidth = @"width";
NSString *const kSFBThumbThumbType = @"thumbType";
NSString *const kSFBThumbDesc = @"desc";
NSString *const kSFBThumbUrl = @"url";


@interface SFBThumb ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBThumb


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
            self.isMain = [[self objectOrNilForKey:kSFBThumbIsMain fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kSFBThumbHeight fromDictionary:dict];
            self.fileName = [self objectOrNilForKey:kSFBThumbFileName fromDictionary:dict];
            self.order = [self objectOrNilForKey:kSFBThumbOrder fromDictionary:dict];
            self.imageKey = [self objectOrNilForKey:kSFBThumbImageKey fromDictionary:dict];
            self.size = [self objectOrNilForKey:kSFBThumbSize fromDictionary:dict];
            self.width = [self objectOrNilForKey:kSFBThumbWidth fromDictionary:dict];
            self.thumbType = [[self objectOrNilForKey:kSFBThumbThumbType fromDictionary:dict] integerValue];
            self.desc = [self objectOrNilForKey:kSFBThumbDesc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSFBThumbUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isMain] forKey:kSFBThumbIsMain];
    [mutableDict setValue:self.height forKey:kSFBThumbHeight];
    [mutableDict setValue:self.fileName forKey:kSFBThumbFileName];
    [mutableDict setValue:self.order forKey:kSFBThumbOrder];
    [mutableDict setValue:self.imageKey forKey:kSFBThumbImageKey];
    [mutableDict setValue:self.size forKey:kSFBThumbSize];
    [mutableDict setValue:self.width forKey:kSFBThumbWidth];
    [mutableDict setValue:[NSNumber numberWithInteger:self.thumbType] forKey:kSFBThumbThumbType];
    [mutableDict setValue:self.desc forKey:kSFBThumbDesc];
    [mutableDict setValue:self.url forKey:kSFBThumbUrl];

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

    self.isMain = [aDecoder decodeBoolForKey:kSFBThumbIsMain];
    self.height = [aDecoder decodeObjectForKey:kSFBThumbHeight];
    self.fileName = [aDecoder decodeObjectForKey:kSFBThumbFileName];
    self.order = [aDecoder decodeObjectForKey:kSFBThumbOrder];
    self.imageKey = [aDecoder decodeObjectForKey:kSFBThumbImageKey];
    self.size = [aDecoder decodeObjectForKey:kSFBThumbSize];
    self.width = [aDecoder decodeObjectForKey:kSFBThumbWidth];
    self.thumbType = [aDecoder decodeIntegerForKey:kSFBThumbThumbType];
    self.desc = [aDecoder decodeObjectForKey:kSFBThumbDesc];
    self.url = [aDecoder decodeObjectForKey:kSFBThumbUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isMain forKey:kSFBThumbIsMain];
    [aCoder encodeObject:_height forKey:kSFBThumbHeight];
    [aCoder encodeObject:_fileName forKey:kSFBThumbFileName];
    [aCoder encodeObject:_order forKey:kSFBThumbOrder];
    [aCoder encodeObject:_imageKey forKey:kSFBThumbImageKey];
    [aCoder encodeObject:_size forKey:kSFBThumbSize];
    [aCoder encodeObject:_width forKey:kSFBThumbWidth];
    [aCoder encodeInteger:_thumbType forKey:kSFBThumbThumbType];
    [aCoder encodeObject:_desc forKey:kSFBThumbDesc];
    [aCoder encodeObject:_url forKey:kSFBThumbUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBThumb *copy = [[SFBThumb alloc] init];
    
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
