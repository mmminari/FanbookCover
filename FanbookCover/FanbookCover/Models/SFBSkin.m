//
//  SFBSkin.m
//
//  Created by   on 2016. 8. 25.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBSkin.h"


NSString *const kSFBSkinFileSize = @"fileSize";
NSString *const kSFBSkinFileName = @"fileName";
NSString *const kSFBSkinUserIdx = @"userIdx";
NSString *const kSFBSkinAdminIdx = @"adminIdx";
NSString *const kSFBSkinCreateDate = @"createDate";
NSString *const kSFBSkinSkinName = @"skinName";
NSString *const kSFBSkinIsDeleted = @"isDeleted";
NSString *const kSFBSkinDeviceType = @"deviceType";
NSString *const kSFBSkinDeleteDate = @"deleteDate";
NSString *const kSFBSkinFileOrignName = @"fileOrignName";
NSString *const kSFBSkinFilePath = @"filePath";
NSString *const kSFBSkinSkinIdx = @"skinIdx";
NSString *const kSFBSkinFileHeight = @"fileHeight";
NSString *const kSFBSkinIsOpen = @"isOpen";
NSString *const kSFBSkinFileWidth = @"fileWidth";


@interface SFBSkin ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBSkin

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
        self.fileSize = [[self objectOrNilForKey:kSFBSkinFileSize fromDictionary:dict] integerValue];
        self.fileName = [self objectOrNilForKey:kSFBSkinFileName fromDictionary:dict];
        self.userIdx = [[self objectOrNilForKey:kSFBSkinUserIdx fromDictionary:dict] integerValue];
        self.adminIdx = [[self objectOrNilForKey:kSFBSkinAdminIdx fromDictionary:dict] integerValue];
        self.createDate = [[self objectOrNilForKey:kSFBSkinCreateDate fromDictionary:dict] doubleValue];
        self.skinName = [self objectOrNilForKey:kSFBSkinSkinName fromDictionary:dict];
        self.isDeleted = [[self objectOrNilForKey:kSFBSkinIsDeleted fromDictionary:dict] doubleValue];
        self.deviceType = [[self objectOrNilForKey:kSFBSkinDeviceType fromDictionary:dict] integerValue];
        self.deleteDate = [[self objectOrNilForKey:kSFBSkinDeleteDate fromDictionary:dict] doubleValue];
        self.fileOrignName = [self objectOrNilForKey:kSFBSkinFileOrignName fromDictionary:dict];
        self.filePath = [self objectOrNilForKey:kSFBSkinFilePath fromDictionary:dict];
        self.skinIdx = [[self objectOrNilForKey:kSFBSkinSkinIdx fromDictionary:dict] integerValue];
        self.fileHeight = [[self objectOrNilForKey:kSFBSkinFileHeight fromDictionary:dict] integerValue];
        self.isOpen = [[self objectOrNilForKey:kSFBSkinIsOpen fromDictionary:dict] integerValue];
        self.fileWidth = [[self objectOrNilForKey:kSFBSkinFileWidth fromDictionary:dict] integerValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.fileSize] forKey:kSFBSkinFileSize];
    [mutableDict setValue:self.fileName forKey:kSFBSkinFileName];
    [mutableDict setValue:[NSNumber numberWithInteger:self.userIdx] forKey:kSFBSkinUserIdx];
    [mutableDict setValue:[NSNumber numberWithInteger:self.adminIdx] forKey:kSFBSkinAdminIdx];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createDate] forKey:kSFBSkinCreateDate];
    [mutableDict setValue:self.skinName forKey:kSFBSkinSkinName];
    [mutableDict setValue:[NSNumber numberWithInteger:self.isDeleted] forKey:kSFBSkinIsDeleted];
    [mutableDict setValue:[NSNumber numberWithInteger:self.deviceType] forKey:kSFBSkinDeviceType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.deleteDate] forKey:kSFBSkinDeleteDate];
    [mutableDict setValue:self.fileOrignName forKey:kSFBSkinFileOrignName];
    [mutableDict setValue:self.filePath forKey:kSFBSkinFilePath];
    [mutableDict setValue:[NSNumber numberWithInteger:self.skinIdx] forKey:kSFBSkinSkinIdx];
    [mutableDict setValue:[NSNumber numberWithInteger:self.fileHeight] forKey:kSFBSkinFileHeight];
    [mutableDict setValue:[NSNumber numberWithInteger:self.isOpen] forKey:kSFBSkinIsOpen];
    [mutableDict setValue:[NSNumber numberWithInteger:self.fileWidth] forKey:kSFBSkinFileWidth];
    
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
    
    self.fileSize = [aDecoder decodeIntegerForKey:kSFBSkinFileSize];
    self.fileName = [aDecoder decodeObjectForKey:kSFBSkinFileName];
    self.userIdx = [aDecoder decodeIntegerForKey:kSFBSkinUserIdx];
    self.adminIdx = [aDecoder decodeIntegerForKey:kSFBSkinAdminIdx];
    self.createDate = [aDecoder decodeDoubleForKey:kSFBSkinCreateDate];
    self.skinName = [aDecoder decodeObjectForKey:kSFBSkinSkinName];
    self.isDeleted = [aDecoder decodeIntegerForKey:kSFBSkinIsDeleted];
    self.deviceType = [aDecoder decodeIntegerForKey:kSFBSkinDeviceType];
    self.deleteDate = [aDecoder decodeDoubleForKey:kSFBSkinDeleteDate];
    self.fileOrignName = [aDecoder decodeObjectForKey:kSFBSkinFileOrignName];
    self.filePath = [aDecoder decodeObjectForKey:kSFBSkinFilePath];
    self.skinIdx = [aDecoder decodeIntegerForKey:kSFBSkinSkinIdx];
    self.fileHeight = [aDecoder decodeIntegerForKey:kSFBSkinFileHeight];
    self.isOpen = [aDecoder decodeIntegerForKey:kSFBSkinIsOpen];
    self.fileWidth = [aDecoder decodeIntegerForKey:kSFBSkinFileWidth];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeInteger:_fileSize forKey:kSFBSkinFileSize];
    [aCoder encodeObject:_fileName forKey:kSFBSkinFileName];
    [aCoder encodeInteger:_userIdx forKey:kSFBSkinUserIdx];
    [aCoder encodeInteger:_adminIdx forKey:kSFBSkinAdminIdx];
    [aCoder encodeDouble:_createDate forKey:kSFBSkinCreateDate];
    [aCoder encodeObject:_skinName forKey:kSFBSkinSkinName];
    [aCoder encodeInteger:_isDeleted forKey:kSFBSkinIsDeleted];
    [aCoder encodeInteger:_deviceType forKey:kSFBSkinDeviceType];
    [aCoder encodeDouble:_deleteDate forKey:kSFBSkinDeleteDate];
    [aCoder encodeObject:_fileOrignName forKey:kSFBSkinFileOrignName];
    [aCoder encodeObject:_filePath forKey:kSFBSkinFilePath];
    [aCoder encodeInteger:_skinIdx forKey:kSFBSkinSkinIdx];
    [aCoder encodeInteger:_fileHeight forKey:kSFBSkinFileHeight];
    [aCoder encodeInteger:_isOpen forKey:kSFBSkinIsOpen];
    [aCoder encodeInteger:_fileWidth forKey:kSFBSkinFileWidth];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBSkin *copy = [[SFBSkin alloc] init];
    
    if (copy) {
        
        copy.fileSize = self.fileSize;
        copy.fileName = [self.fileName copyWithZone:zone];
        copy.userIdx = self.userIdx;
        copy.adminIdx = self.adminIdx;
        copy.createDate = self.createDate;
        copy.skinName = [self.skinName copyWithZone:zone];
        copy.isDeleted = self.isDeleted;
        copy.deviceType = self.deviceType;
        copy.deleteDate = self.deleteDate;
        copy.fileOrignName = [self.fileOrignName copyWithZone:zone];
        copy.filePath = [self.filePath copyWithZone:zone];
        copy.skinIdx = self.skinIdx;
        copy.fileHeight = self.fileHeight;
        copy.isOpen = self.isOpen;
        copy.fileWidth = self.fileWidth;
    }
    
    return copy;
}


@end
