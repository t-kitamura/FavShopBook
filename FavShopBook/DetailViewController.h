//
//  DetailViewController.h
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/04.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

#import "EditViewController.h"

@interface DetailViewController : UIViewController<BackViewDelegate>

@property (strong, nonatomic) Shop *detailData;

@end
