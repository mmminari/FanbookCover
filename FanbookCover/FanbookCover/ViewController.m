//
//  ViewController.m
//  FanbookCover
//
//  Created by 김민아 on 2017. 3. 9..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "CoverCell.h"
#import "SFBMainCoverModels.h"

#import "HTTPClient.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) HTTPClient *httpClient;
@property (strong, nonatomic) NSArray *coverList;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CoverCell" bundle:nil] forCellWithReuseIdentifier:@"CoverCell"];
    
    self.httpClient = [[HTTPClient alloc]initWithBaseURL];
    
    self.coverList = [NSArray array];
    
    [self reqLogin];
    
}

#pragma mark - CollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger result = 0;
    
    if(self.coverList.count != 0)
    {
        result = 1;
    }
    
    return result;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CoverCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CoverCell" forIndexPath:indexPath];
    
    // CoverCell의 scrollView에서 정보를 보여주는 것
    // 갖고 있는 coverList CoverCell로 전달
    cell.coverList = self.coverList;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize result = CGSizeMake(0, 0);
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    result = CGSizeMake(width, width);
    
    return result;
}

#pragma mark - Request
- (void)reqLogin
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setObject:@"yonghwinam@smtown.com" forKey:@"userID"];
    [param setObject:@"apple0000" forKey:@"userPassword"];
    [param setObject:@"autoLogin" forKey:@"Y"];
    
    NSDictionary *resigsterDevice =
    @{
      @"deviceToken":@"token",
      @"deviceType":@"ios",
      @"version":@"1",
      @"lang":@"ko",
      @"isPushOn":[NSNumber numberWithBool:TRUE],
      @"isPushDebug":[NSNumber numberWithBool:TRUE]
      };
    
    [param setObject:resigsterDevice forKey:@"registerDevice"];
    
    [self.httpClient POSTWithUrlString:@"/auth" parameters:param success:^(id results) {
        [self successCompletionOfReqLoginWithResult:results];
    } failure:^(NSError *error) {
        NSLog(@"Login Error : %@", error.description);
    }];
}

- (void)reqMainCover
{
    NSDictionary *param = @{ @"userIdx" : @(1035) };
    
    [self.httpClient POSTWithUrlString:@"/main/cover" parameters:param success:^(id results) {
        [self successCompletionOfReqMainCoverWithResult:results];
    } failure:^(NSError *error) {
        NSLog(@"Main Cover Error : %@", error.description);
    }];
    
}
#pragma mark - Process

- (void)successCompletionOfReqLoginWithResult:(id)reuslt
{
    NSLog(@"Login Success : %@",reuslt);
    
    // 로그인 끝나고 cover 정보 요청
    [self reqMainCover];
}

- (void)successCompletionOfReqMainCoverWithResult:(id)result
{
    NSLog(@"Main Cover Success : %@", result);
    
    SFBMainCoverModel *model = [SFBMainCoverModel modelObjectWithDictionary:result];
    
    if(model.code == 0)
    {
        self.coverList = model.data.responseArtWork;
        
        // cover정보 받은 후 reload
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    }
    
}

@end
