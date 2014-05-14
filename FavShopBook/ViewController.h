//
//  ViewController.h
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/03.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
