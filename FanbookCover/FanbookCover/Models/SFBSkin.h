//
//  SFBSkin.h
//
//  Created by   on 2016. 8. 25.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFBSkin : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger fileSize;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, assign) NSInteger userIdx;
@property (nonatomic, assign) NSInteger adminIdx;
@property (nonatomic, assign) NSTimeInterval createDate;
@property (nonatomic, strong) NSString *skinName;
@property (nonatomic, assign) BOOL isDeleted;
@property (nonatomic, assign) NSInteger deviceType;
@property (nonatomic, assign) NSTimeInterval deleteDate;
@property (nonatomic, strong) NSString *fileOrignName;
@property (nonatomic, strong) NSString *filePath;
@property (nonatomic, assign) NSInteger skinIdx;
@property (nonatomic, assign) NSInteger fileHeight;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger fileWidth;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
