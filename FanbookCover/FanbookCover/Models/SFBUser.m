//
//  SFBUser.m
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SFBUser.h"
#import "SFBUserCountSummary.h"
#import "SFBSkin.h"

NSString *const kSFBUserFanbookUrl = @"fanbookUrl";
NSString *const kSFBUserUserDeviceUUID = @"userDeviceUUID";
NSString *const kSFBUserModifyDate = @"modifyDate";
NSString *const kSFBUserUserGender = @"userGender";
NSString *const kSFBUserBirthMM = @"birthMM";
NSString *const kSFBUserUserTel = @"userTel";
NSString *const kSFBUserUserPhoto = @"userPhoto";
NSString *const kSFBUserUserNation = @"userNation";
NSString *const kSFBUserDeviceType = @"deviceType";
NSString *const kSFBUserUserID = @"userID";
NSString *const kSFBUserBirthYY = @"birthYY";
NSString *const kSFBUserAuthorRequest = @"authorRequest";
NSString *const kSFBUserBirthDD = @"birthDD";
NSString *const kSFBUserUserNameFirst = @"userNameFirst";
NSString *const kSFBUserUserJoinType = @"userJoinType";
NSString *const kSFBUserIsMailling = @"isMailling";
NSString *const kSFBUserIsActive = @"isActive";
NSString *const kSFBUserUserLevel = @"userLevel";
NSString *const kSFBUserUserIdx = @"userIdx";
NSString *const kSFBUserIsActiveDesc = @"isActiveDesc";
NSString *const kSFBUserUserNick = @"userNick";
NSString *const kSFBUserUserBirthDay = @"userBirthDay";
NSString *const kSFBUserUserRePassword = @"userRePassword";
NSString *const kSFBUserUserTitle = @"userTitle";
NSString *const kSFBUserUserCellPhoneCountryCode = @"userCellPhoneCountryCode";
NSString *const kSFBUserUserAcceessToken = @"userAcceessToken";
NSString *const kSFBUserLatestLoginDate = @"latestLoginDate";
NSString *const kSFBUserUserName = @"userName";
NSString *const kSFBUserUserCellPhone = @"userCellPhone";
NSString *const kSFBUserCreateDate = @"createDate";
NSString *const kSFBUserUserSns = @"userSns";
NSString *const kSFBUserIsActiveDate = @"isActiveDate";
NSString *const kSFBUserUserShareUrl = @"userShareUrl";
NSString *const kSFBUserUserSkinInfo = @"skin";
NSString *const kSFBUserUserCountSummary = @"userCountSummary";
NSString *const kSFBUserUserAuthorIcon = @"authorIcon";
NSString *const kSFBUserUserHasFollowing = @"hasFollowing";
NSString *const kSFBUserUserLikeUserIdxEncryptKey = @"likeUserIdxEncryptKey";
NSString *const kSFBUserUserArtWorkThumb = @"artWorkThumb";
NSString *const kSFBUserUserUserJoinTypeName = @"userJoinTypeName";
NSString *const kSFBUserUserUserIdxEncryptKey = @"userIdxEncryptKey";
NSString *const kSFBUserUserIsFollowing = @"isFollowing";
NSString *const kSFBUserUserUUID = @"userUUID";
NSString *const kSFBUserUserSkinText = @"skinText";

@interface SFBUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SFBUser

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
        self.fanbookUrl = [self objectOrNilForKey:kSFBUserFanbookUrl fromDictionary:dict];
        self.userDeviceUUID = [self objectOrNilForKey:kSFBUserUserDeviceUUID fromDictionary:dict];
        self.modifyDate = [[self objectOrNilForKey:kSFBUserModifyDate fromDictionary:dict] doubleValue];
        self.userGender = [self objectOrNilForKey:kSFBUserUserGender fromDictionary:dict];
        self.birthMM = [self objectOrNilForKey:kSFBUserBirthMM fromDictionary:dict];
        self.userTel = [self objectOrNilForKey:kSFBUserUserTel fromDictionary:dict];
        self.userPhoto = [self objectOrNilForKey:kSFBUserUserPhoto fromDictionary:dict];
        self.userNation = [self objectOrNilForKey:kSFBUserUserNation fromDictionary:dict];
        self.deviceType = [[self objectOrNilForKey:kSFBUserDeviceType fromDictionary:dict] integerValue];
        self.userID = [self objectOrNilForKey:kSFBUserUserID fromDictionary:dict];
        self.birthYY = [self objectOrNilForKey:kSFBUserBirthYY fromDictionary:dict];
        
        if ([[dict objectForKey:kSFBUserAuthorRequest] isKindOfClass:[NSNull class]]) {
            self.authorRequest = -1;
        }
        else
        {
            self.authorRequest = [[self objectOrNilForKey:kSFBUserAuthorRequest fromDictionary:dict] integerValue];
        }
        
        self.birthDD = [self objectOrNilForKey:kSFBUserBirthDD fromDictionary:dict];
        self.userNameFirst = [self objectOrNilForKey:kSFBUserUserNameFirst fromDictionary:dict];
        self.userJoinType = [self objectOrNilForKey:kSFBUserUserJoinType fromDictionary:dict];
        self.isMailling = [self objectOrNilForKey:kSFBUserIsMailling fromDictionary:dict];
        self.isActive = [self objectOrNilForKey:kSFBUserIsActive fromDictionary:dict];
        self.userLevel = [self objectOrNilForKey:kSFBUserUserLevel fromDictionary:dict];
        self.userIdx = [[self objectOrNilForKey:kSFBUserUserIdx fromDictionary:dict] integerValue];
        self.isActiveDesc = [self objectOrNilForKey:kSFBUserIsActiveDesc fromDictionary:dict];
        self.userNick = [self objectOrNilForKey:kSFBUserUserNick fromDictionary:dict];
        self.userBirthDay = [self objectOrNilForKey:kSFBUserUserBirthDay fromDictionary:dict];
        self.userRePassword = [self objectOrNilForKey:kSFBUserUserRePassword fromDictionary:dict];
        self.userTitle = [self objectOrNilForKey:kSFBUserUserTitle fromDictionary:dict];
        self.userCellPhoneCountryCode = [self objectOrNilForKey:kSFBUserUserCellPhoneCountryCode fromDictionary:dict];
        self.userAcceessToken = [self objectOrNilForKey:kSFBUserUserAcceessToken fromDictionary:dict];
        self.latestLoginDate = [[self objectOrNilForKey:kSFBUserLatestLoginDate fromDictionary:dict] doubleValue];
        self.userName = [self objectOrNilForKey:kSFBUserUserName fromDictionary:dict];
        self.userCellPhone = [self objectOrNilForKey:kSFBUserUserCellPhone fromDictionary:dict];
        self.createDate = [[self objectOrNilForKey:kSFBUserCreateDate fromDictionary:dict] doubleValue];
        self.userSns = [self objectOrNilForKey:kSFBUserUserSns fromDictionary:dict];
        self.isActiveDate = [[self objectOrNilForKey:kSFBUserIsActiveDate fromDictionary:dict] doubleValue];
        self.skin = [SFBSkin modelObjectWithDictionary:[dict objectForKey:kSFBUserUserSkinInfo]];
        self.userCountSummary = [SFBUserCountSummary modelObjectWithDictionary:[dict objectForKey:kSFBUserUserCountSummary]];
        self.authorIcon = [[self objectOrNilForKey:kSFBUserUserAuthorIcon fromDictionary:dict] integerValue];
        self.hasFollowing = [[self objectOrNilForKey:kSFBUserUserHasFollowing fromDictionary:dict] boolValue];
        self.likeUserIdxEncryptKey = [self objectOrNilForKey:kSFBUserUserLikeUserIdxEncryptKey fromDictionary:dict];
        self.artWorkThumb = [self objectOrNilForKey:kSFBUserUserArtWorkThumb fromDictionary:dict];
        self.userJoinTypeName = [self objectOrNilForKey:kSFBUserUserUserJoinTypeName fromDictionary:dict];
        self.userIdxEncryptKey = [self objectOrNilForKey:kSFBUserUserUserIdxEncryptKey fromDictionary:dict];
        self.isFollowing = [[self objectOrNilForKey:kSFBUserUserIsFollowing fromDictionary:dict] boolValue];
        self.userUUID = [self objectOrNilForKey:kSFBUserUserUUID fromDictionary:dict];
        self.userShareUrl = [self objectOrNilForKey:kSFBUserUserShareUrl fromDictionary:dict];
        self.skinText = [self objectOrNilForKey:kSFBUserUserSkinText fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.fanbookUrl forKey:kSFBUserFanbookUrl];
    [mutableDict setValue:self.userDeviceUUID forKey:kSFBUserUserDeviceUUID];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyDate] forKey:kSFBUserModifyDate];
    [mutableDict setValue:self.userGender forKey:kSFBUserUserGender];
    [mutableDict setValue:self.birthMM forKey:kSFBUserBirthMM];
    [mutableDict setValue:self.userTel forKey:kSFBUserUserTel];
    [mutableDict setValue:self.userPhoto forKey:kSFBUserUserPhoto];
    [mutableDict setValue:self.userNation forKey:kSFBUserUserNation];
    [mutableDict setValue:[NSNumber numberWithInteger:self.deviceType] forKey:kSFBUserDeviceType];
    [mutableDict setValue:self.userID forKey:kSFBUserUserID];
    [mutableDict setValue:self.birthYY forKey:kSFBUserBirthYY];
    [mutableDict setValue:[NSNumber numberWithInteger:self.authorRequest] forKey:kSFBUserAuthorRequest];
    [mutableDict setValue:self.birthDD forKey:kSFBUserBirthDD];
    [mutableDict setValue:self.userNameFirst forKey:kSFBUserUserNameFirst];
    [mutableDict setValue:self.userJoinType forKey:kSFBUserUserJoinType];
    [mutableDict setValue:self.isMailling forKey:kSFBUserIsMailling];
    [mutableDict setValue:self.isActive forKey:kSFBUserIsActive];
    [mutableDict setValue:self.userLevel forKey:kSFBUserUserLevel];
    [mutableDict setValue:[NSNumber numberWithInteger:self.userIdx] forKey:kSFBUserUserIdx];
    [mutableDict setValue:self.isActiveDesc forKey:kSFBUserIsActiveDesc];
    [mutableDict setValue:self.userNick forKey:kSFBUserUserNick];
    [mutableDict setValue:self.userBirthDay forKey:kSFBUserUserBirthDay];
    [mutableDict setValue:self.userRePassword forKey:kSFBUserUserRePassword];
    [mutableDict setValue:self.userTitle forKey:kSFBUserUserTitle];
    [mutableDict setValue:self.userCellPhoneCountryCode forKey:kSFBUserUserCellPhoneCountryCode];
    [mutableDict setValue:self.userAcceessToken forKey:kSFBUserUserAcceessToken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latestLoginDate] forKey:kSFBUserLatestLoginDate];
    [mutableDict setValue:self.userName forKey:kSFBUserUserName];
    [mutableDict setValue:self.userCellPhone forKey:kSFBUserUserCellPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createDate] forKey:kSFBUserCreateDate];
    
    NSMutableArray *tempArrayForUserSns = [NSMutableArray array];
    for (NSObject *subArrayObject in self.userSns) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUserSns addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUserSns addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserSns] forKey:kSFBUserUserSns];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isActiveDate] forKey:kSFBUserIsActiveDate];
    [mutableDict setValue:[self.skin dictionaryRepresentation] forKey:kSFBUserUserSkinInfo];
    [mutableDict setValue:[self.userCountSummary dictionaryRepresentation] forKey:kSFBUserUserCountSummary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.authorIcon] forKey:kSFBUserUserAuthorIcon];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasFollowing] forKey:kSFBUserUserHasFollowing];
    [mutableDict setValue:self.likeUserIdxEncryptKey forKey:kSFBUserUserLikeUserIdxEncryptKey];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForArtWorkThumb] forKey:kSFBUserUserArtWorkThumb];
    [mutableDict setValue:self.userJoinTypeName forKey:kSFBUserUserUserJoinTypeName];
    [mutableDict setValue:self.userIdxEncryptKey forKey:kSFBUserUserUserIdxEncryptKey];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollowing] forKey:kSFBUserUserIsFollowing];
    [mutableDict setValue:self.userUUID forKey:kSFBUserUserUUID];
    [mutableDict setValue:self.userShareUrl forKey:kSFBUserUserShareUrl];
    [mutableDict setValue:self.skinText forKey:kSFBUserUserSkinText];
    
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
    
    self.fanbookUrl = [aDecoder decodeObjectForKey:kSFBUserFanbookUrl];
    self.userDeviceUUID = [aDecoder decodeObjectForKey:kSFBUserUserDeviceUUID];
    self.modifyDate = [aDecoder decodeDoubleForKey:kSFBUserModifyDate];
    self.userGender = [aDecoder decodeObjectForKey:kSFBUserUserGender];
    self.birthMM = [aDecoder decodeObjectForKey:kSFBUserBirthMM];
    self.userTel = [aDecoder decodeObjectForKey:kSFBUserUserTel];
    self.userPhoto = [aDecoder decodeObjectForKey:kSFBUserUserPhoto];
    self.userNation = [aDecoder decodeObjectForKey:kSFBUserUserNation];
    self.deviceType = [aDecoder decodeIntegerForKey:kSFBUserDeviceType];
    self.userID = [aDecoder decodeObjectForKey:kSFBUserUserID];
    self.birthYY = [aDecoder decodeObjectForKey:kSFBUserBirthYY];
    self.authorRequest = [aDecoder decodeIntegerForKey:kSFBUserAuthorRequest];
    self.birthDD = [aDecoder decodeObjectForKey:kSFBUserBirthDD];
    self.userNameFirst = [aDecoder decodeObjectForKey:kSFBUserUserNameFirst];
    self.userJoinType = [aDecoder decodeObjectForKey:kSFBUserUserJoinType];
    self.isMailling = [aDecoder decodeObjectForKey:kSFBUserIsMailling];
    self.isActive = [aDecoder decodeObjectForKey:kSFBUserIsActive];
    self.userLevel = [aDecoder decodeObjectForKey:kSFBUserUserLevel];
    self.userIdx = [aDecoder decodeIntegerForKey:kSFBUserUserIdx];
    self.isActiveDesc = [aDecoder decodeObjectForKey:kSFBUserIsActiveDesc];
    self.userNick = [aDecoder decodeObjectForKey:kSFBUserUserNick];
    self.userBirthDay = [aDecoder decodeObjectForKey:kSFBUserUserBirthDay];
    self.userRePassword = [aDecoder decodeObjectForKey:kSFBUserUserRePassword];
    self.userTitle = [aDecoder decodeObjectForKey:kSFBUserUserTitle];
    self.userCellPhoneCountryCode = [aDecoder decodeObjectForKey:kSFBUserUserCellPhoneCountryCode];
    self.userAcceessToken = [aDecoder decodeObjectForKey:kSFBUserUserAcceessToken];
    self.latestLoginDate = [aDecoder decodeDoubleForKey:kSFBUserLatestLoginDate];
    self.userName = [aDecoder decodeObjectForKey:kSFBUserUserName];
    self.userCellPhone = [aDecoder decodeObjectForKey:kSFBUserUserCellPhone];
    self.createDate = [aDecoder decodeDoubleForKey:kSFBUserCreateDate];
    self.userSns = [aDecoder decodeObjectForKey:kSFBUserUserSns];
    self.isActiveDate = [aDecoder decodeDoubleForKey:kSFBUserIsActiveDate];
    self.skin = [aDecoder decodeObjectForKey:kSFBUserUserSkinInfo];
    self.userCountSummary = [aDecoder decodeObjectForKey:kSFBUserUserCountSummary];
    self.authorIcon = [aDecoder decodeIntegerForKey:kSFBUserUserAuthorIcon];
    self.hasFollowing = [aDecoder decodeBoolForKey:kSFBUserUserHasFollowing];
    self.likeUserIdxEncryptKey = [aDecoder decodeObjectForKey:kSFBUserUserLikeUserIdxEncryptKey];
    self.artWorkThumb = [aDecoder decodeObjectForKey:kSFBUserUserArtWorkThumb];
    self.userJoinTypeName = [aDecoder decodeObjectForKey:kSFBUserUserUserJoinTypeName];
    self.userIdxEncryptKey = [aDecoder decodeObjectForKey:kSFBUserUserUserIdxEncryptKey];
    self.isFollowing = [aDecoder decodeBoolForKey:kSFBUserUserIsFollowing];
    self.userUUID = [aDecoder decodeObjectForKey:kSFBUserUserUUID];
    self.userShareUrl = [aDecoder decodeObjectForKey:kSFBUserUserShareUrl];
    self.skinText = [aDecoder decodeObjectForKey:kSFBUserUserSkinText];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_fanbookUrl forKey:kSFBUserFanbookUrl];
    [aCoder encodeObject:_userDeviceUUID forKey:kSFBUserUserDeviceUUID];
    [aCoder encodeDouble:_modifyDate forKey:kSFBUserModifyDate];
    [aCoder encodeObject:_userGender forKey:kSFBUserUserGender];
    [aCoder encodeObject:_birthMM forKey:kSFBUserBirthMM];
    [aCoder encodeObject:_userTel forKey:kSFBUserUserTel];
    [aCoder encodeObject:_userPhoto forKey:kSFBUserUserPhoto];
    [aCoder encodeObject:_userNation forKey:kSFBUserUserNation];
    [aCoder encodeInteger:_deviceType forKey:kSFBUserDeviceType];
    [aCoder encodeObject:_userID forKey:kSFBUserUserID];
    [aCoder encodeObject:_birthYY forKey:kSFBUserBirthYY];
    [aCoder encodeInteger:_authorRequest forKey:kSFBUserAuthorRequest];
    [aCoder encodeObject:_birthDD forKey:kSFBUserBirthDD];
    [aCoder encodeObject:_userNameFirst forKey:kSFBUserUserNameFirst];
    [aCoder encodeObject:_userJoinType forKey:kSFBUserUserJoinType];
    [aCoder encodeObject:_isMailling forKey:kSFBUserIsMailling];
    [aCoder encodeObject:_isActive forKey:kSFBUserIsActive];
    [aCoder encodeObject:_userLevel forKey:kSFBUserUserLevel];
    [aCoder encodeInteger:_userIdx forKey:kSFBUserUserIdx];
    [aCoder encodeObject:_isActiveDesc forKey:kSFBUserIsActiveDesc];
    [aCoder encodeObject:_userNick forKey:kSFBUserUserNick];
    [aCoder encodeObject:_userBirthDay forKey:kSFBUserUserBirthDay];
    [aCoder encodeObject:_userRePassword forKey:kSFBUserUserRePassword];
    [aCoder encodeObject:_userTitle forKey:kSFBUserUserTitle];
    [aCoder encodeObject:_userCellPhoneCountryCode forKey:kSFBUserUserCellPhoneCountryCode];
    [aCoder encodeObject:_userAcceessToken forKey:kSFBUserUserAcceessToken];
    [aCoder encodeDouble:_latestLoginDate forKey:kSFBUserLatestLoginDate];
    [aCoder encodeObject:_userName forKey:kSFBUserUserName];
    [aCoder encodeObject:_userCellPhone forKey:kSFBUserUserCellPhone];
    [aCoder encodeDouble:_createDate forKey:kSFBUserCreateDate];
    [aCoder encodeObject:_userSns forKey:kSFBUserUserSns];
    [aCoder encodeDouble:_isActiveDate forKey:kSFBUserIsActiveDate];
    [aCoder encodeObject:_skin forKey:kSFBUserUserSkinInfo];
    [aCoder encodeObject:_userCountSummary forKey:kSFBUserUserCountSummary];
    [aCoder encodeInteger:_authorIcon forKey:kSFBUserUserAuthorIcon];
    [aCoder encodeBool:_hasFollowing forKey:kSFBUserUserHasFollowing];
    [aCoder encodeObject:_likeUserIdxEncryptKey forKey:kSFBUserUserLikeUserIdxEncryptKey];
    [aCoder encodeObject:_artWorkThumb forKey:kSFBUserUserArtWorkThumb];
    [aCoder encodeObject:_userJoinTypeName forKey:kSFBUserUserUserJoinTypeName];
    [aCoder encodeObject:_userIdxEncryptKey forKey:kSFBUserUserUserIdxEncryptKey];
    [aCoder encodeBool:_isFollowing forKey:kSFBUserUserIsFollowing];
    [aCoder encodeObject:_userUUID forKey:kSFBUserUserUUID];
    [aCoder encodeObject:_userShareUrl forKey:kSFBUserUserShareUrl];
    [aCoder encodeObject:_skinText forKey:kSFBUserUserSkinText];
}

- (id)copyWithZone:(NSZone *)zone
{
    SFBUser *copy = [[SFBUser alloc] init];
    
    if (copy) {
        
        copy.fanbookUrl = [self.fanbookUrl copyWithZone:zone];
        copy.userDeviceUUID = [self.userDeviceUUID copyWithZone:zone];
        copy.modifyDate = self.modifyDate;
        copy.userGender = [self.userGender copyWithZone:zone];
        copy.birthMM = [self.birthMM copyWithZone:zone];
        copy.userTel = [self.userTel copyWithZone:zone];
        copy.userPhoto = [self.userPhoto copyWithZone:zone];
        copy.userNation = [self.userNation copyWithZone:zone];
        copy.deviceType = self.deviceType;
        copy.userID = [self.userID copyWithZone:zone];
        copy.birthYY = [self.birthYY copyWithZone:zone];
        copy.authorRequest = self.authorRequest;
        copy.birthDD = [self.birthDD copyWithZone:zone];
        copy.userNameFirst = [self.userNameFirst copyWithZone:zone];
        copy.userJoinType = [self.userJoinType copyWithZone:zone];
        copy.isMailling = [self.isMailling copyWithZone:zone];
        copy.isActive = [self.isActive copyWithZone:zone];
        copy.userLevel = [self.userLevel copyWithZone:zone];
        copy.userIdx = self.userIdx;
        copy.isActiveDesc = [self.isActiveDesc copyWithZone:zone];
        copy.userNick = [self.userNick copyWithZone:zone];
        copy.userBirthDay = [self.userBirthDay copyWithZone:zone];
        copy.userRePassword = [self.userRePassword copyWithZone:zone];
        copy.userTitle = [self.userTitle copyWithZone:zone];
        copy.userCellPhoneCountryCode = [self.userCellPhoneCountryCode copyWithZone:zone];
        copy.userAcceessToken = [self.userAcceessToken copyWithZone:zone];
        copy.latestLoginDate = self.latestLoginDate;
        copy.userName = [self.userName copyWithZone:zone];
        copy.userCellPhone = [self.userCellPhone copyWithZone:zone];
        copy.createDate = self.createDate;
        copy.userSns = [self.userSns copyWithZone:zone];
        copy.isActiveDate = self.isActiveDate;
        copy.skin = [self.skin copyWithZone:zone];
        copy.userCountSummary = [self.userCountSummary copyWithZone:zone];
        copy.authorIcon = self.authorIcon;
        copy.hasFollowing = self.hasFollowing;
        copy.likeUserIdxEncryptKey = [self.likeUserIdxEncryptKey copyWithZone:zone];
        copy.artWorkThumb = [self.artWorkThumb copyWithZone:zone];
        copy.userJoinTypeName = [self.userJoinTypeName copyWithZone:zone];
        copy.userIdxEncryptKey = [self.userIdxEncryptKey copyWithZone:zone];
        copy.isFollowing = self.isFollowing;
        copy.userUUID = [self.userUUID copyWithZone:zone];
        copy.userShareUrl = [self.userShareUrl copyWithZone:zone];
        copy.skinText = [self.skinText copyWithZone:zone];
    }
    
    return copy;
}


@end
