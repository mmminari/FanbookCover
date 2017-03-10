//
//  SFBUser.h
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFBUserCountSummary,SFBSkin;


@interface SFBUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *fanbookUrl;
@property (nonatomic, strong) NSString *userDeviceUUID;
@property (nonatomic, assign) NSTimeInterval modifyDate;
@property (nonatomic, strong) NSString *userGender;
@property (nonatomic, strong) NSString *birthMM;
@property (nonatomic, strong) NSString *userTel;
@property (nonatomic, strong) NSString *userPhoto;
@property (nonatomic, strong) NSString *userNation;
@property (nonatomic, assign) NSInteger deviceType;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *birthYY;
@property (nonatomic, assign) NSInteger authorRequest;
@property (nonatomic, strong) NSString *birthDD;
@property (nonatomic, strong) NSString *userNameFirst;
@property (nonatomic, strong) NSString *userJoinType;
@property (nonatomic, strong) NSString *isMailling;
@property (nonatomic, strong) NSString *isActive;
@property (nonatomic, strong) NSString *userLevel;
@property (nonatomic, assign) NSInteger userIdx;
@property (nonatomic, strong) NSString *isActiveDesc;
@property (nonatomic, strong) NSString *userNick;
@property (nonatomic, strong) NSString *userBirthDay;
@property (nonatomic, strong) NSString *userRePassword;
@property (nonatomic, strong) NSString *userTitle;
@property (nonatomic, strong) NSString *userCellPhoneCountryCode;
@property (nonatomic, strong) NSString *userAcceessToken;
@property (nonatomic, assign) NSTimeInterval latestLoginDate;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userCellPhone;
@property (nonatomic, assign) NSTimeInterval createDate;
@property (nonatomic, strong) NSArray *userSns;
@property (nonatomic, assign) NSTimeInterval isActiveDate;
@property (nonatomic, strong) SFBSkin *skin;
@property (nonatomic, strong) SFBUserCountSummary *userCountSummary;
@property (nonatomic, assign) NSInteger authorIcon; //double->integer
@property (nonatomic, assign) BOOL hasFollowing;
@property (nonatomic, strong) NSString *likeUserIdxEncryptKey;
@property (nonatomic, strong) NSArray *artWorkThumb;
@property (nonatomic, strong) NSString *userJoinTypeName;
@property (nonatomic, strong) NSString *userIdxEncryptKey;
@property (nonatomic, assign) BOOL isFollowing;
@property (nonatomic, strong) NSString *userUUID;
@property (nonatomic, strong) NSString *userShareUrl;
@property (nonatomic, strong) NSString *skinText;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
