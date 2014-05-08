//
//  EditViewController.h
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/05.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Shop.h"

@protocol BackViewDelegate <NSObject>

- (void)editViewBacked:(Shop *)shop;

@end

@interface EditViewController : UIViewController

@property (strong, nonatomic) Shop *editData;
@property(weak, nonatomic) id<BackViewDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
