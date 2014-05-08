//
//  Shop.h
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/06.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Shop : NSManagedObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *kana;
@property (strong, nonatomic)NSString *group;
@property (strong, nonatomic)NSString *tel;
@property (strong, nonatomic)NSString *postCode;
@property (strong, nonatomic)NSString *address;
@property (strong, nonatomic)NSDate *openTimeFrom;
@property (strong, nonatomic)NSDate *openTimeTo;
@property (strong, nonatomic)NSString *closeDates;
@property (strong, nonatomic)NSString *url;
@property (strong, nonatomic)NSString *memo;
@property (strong, nonatomic)NSString *facebook;

@end
