//
//  SFBUserModelUserCountSummary.h
//
//  Created by   on 2016. 7. 18.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SFBUserCountSummary : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger celebrity;
@property (nonatomic, assign) NSInteger following;
@property (nonatomic, assign) NSInteger userIdx;
@property (nonatomic, assign) NSInteger follower;
@property (nonatomic, assign) NSInteger artWork;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, assign) NSInteger curation;
@property (nonatomic, assign) NSInteger hitTotalCount;
@property (nonatomic, assign) NSInteger likeTotalCount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
