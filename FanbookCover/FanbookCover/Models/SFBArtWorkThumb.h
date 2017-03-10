//
//  SFBArtWorkThumb.h
//
//  Created by   on 2017. 1. 18.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFBArtWorkThumb : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isMain;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *order;
@property (nonatomic, strong) NSString *imageKey;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, assign) NSInteger thumbType;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
