//
//  ViewController.m
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/03.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "EditViewController.h"
#import "Shop.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_datas;
    IBOutlet UITableView *shopTable;
}

@end

@implementation ViewController

@synthesize managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
//    // テストデータの登録
//    [self insertShopDatas];
    
    // データの読み込み
    [self loadShopDatas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ShopDatas

- (void)loadShopDatas {
//    // NSFetchRequestは、検索条件などを保持させるオブジェクトです。
//    // 後続処理では、このインスタンスに色々と検索条件を設定します。
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    
//    // 検索対象のエンティティを指定します。
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shop" inManagedObjectContext:managedObjectContext];
//    [fetchRequest setEntity:entity];
//    
//    // 一度に読み込むサイズを指定します。
//    [fetchRequest setFetchBatchSize:20];
//    
//    // 検索結果を保持する順序を指定します。
//    // ここでは、keyというカラムの値の昇順で保持するように指定しています。
//    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"kana" ascending:YES];
//    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
//    
////    // 続いて検索条件を指定します。

//    
//    
//    // NSFetchedResultsControllerを作成します。
//    // 上記までで作成したFetchRequestを指定します。
//    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
//    
//    // データ検索を行います。
//    // 失敗した場合には、メソッドはfalseを返し、引数errorに値を詰めてくれます。
//    NSError *error = nil;
//    if (![fetchedResultsController performFetch:&error]) {
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//    }
    
    // データの保持
    _datas = [self findShopDatas];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shop" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"kana" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
//    // NSPredicateを用いて、検索条件の表現（述語）を作成します。
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"key = %@ or key = %@ or key = %@", @"dateFormat", @"dateFormat2", @"dateFormat3"];
//    [fetchRequest setPredicate:pred];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
//    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;

    return _fetchedResultsController;
}

- (NSArray *) findShopDatas {
    // データの検索
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return [self.fetchedResultsController fetchedObjects];
}

- (void)insertShopDatas {
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"蠣鯖人酒 宇久";
        shop.kana = @"ウク";
        shop.group = @"居酒屋";
        shop.tel = @"072-661-1880";
        shop.postCode = @"569-0071";
        shop.address = @"大阪府高槻市城北町2-14-11";
        shop.openTimeFrom = [dateFormatter dateFromString:@"18:00"];
        shop.openTimeTo = [dateFormatter dateFromString:@"00:00"];
        shop.closeDates = @"日曜・祝日";
        shop.url = @"http://www.ukuuku.com";
        shop.facebook = @"https://www.facebook.com/Diningkitchen.uku";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"SAKE 壱";
        shop.kana = @"イチ";
        shop.group = @"居酒屋";
        shop.tel = @"075-223-0311";
        shop.postCode = @"604-8024";
        shop.address = @"京都府京都市中京区紙屋町373-1";
        shop.openTimeFrom = [dateFormatter dateFromString:@"17:00"];
        shop.openTimeTo = [dateFormatter dateFromString:@"00:00"];
        shop.closeDates = @"火曜(変動あり)";
        shop.facebook = @"https://www.facebook.com/tachinomi.ichi";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"居酒屋A";
        shop.kana = @"イザカヤエー";
        shop.group = @"居酒屋";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"和醸良麺 すがり";
        shop.kana = @"スガリ";
        shop.group = @"ランチ";
        shop.tel = @"075-205-1185";
        shop.postCode = @"604-8222";
        shop.address = @"京都府京都市中京区観音堂町471-1";
        shop.openTimeFrom = [dateFormatter dateFromString:@"11:30"];
        shop.openTimeTo = [dateFormatter dateFromString:@"15:00"];
        shop.closeDates = @"年末年始のみ";
        shop.url = @"http://www.takakura-nijo.jp/";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"ランチA";
        shop.kana = @"ランチエー";
        shop.group = @"ランチ";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"BORN FREE SUPER STORE";
        shop.kana = @"ボーンフリースーパーストア";
        shop.group = @"ファッション";
        shop.tel = @"077-561-3393";
        shop.postCode = @"525-0051";
        shop.address = @"滋賀県草津市木川町85-1";
        shop.openTimeFrom = [dateFormatter dateFromString:@"11:00"];
        shop.openTimeTo = [dateFormatter dateFromString:@"21:00"];
        shop.url = @"http://www.bornfreegroup.com/";
        shop.facebook = @"https://www.facebook.com/bornfree1973";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"ファッションA";
        shop.kana = @"ファッションエー";
        shop.group = @"ファッション";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"ファッションB";
        shop.kana = @"ファッションビー";
        shop.group = @"ファッション";
    }
    {
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        shop.name = @"その他ショップ";
        shop.kana = @"ソノタ";
        shop.group = @"その他";
    }
    
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"error = %@", error);
    } else {
        NSLog(@"Insert Completed.");
    }
}

- (NSArray *)extractGroups {
    NSMutableArray *groups = [[NSMutableArray alloc] init];
    for (Shop *shop in _datas) {
        if (![groups containsObject:shop.group]) {
            [groups addObject:shop.group];
        }
    }
    return groups;
}

- (NSArray *)extractDatasAtGruop:(NSString *)group {
    NSMutableArray *extractDatas = [[NSMutableArray alloc] init];
    for (Shop *shop in _datas) {
        if ([shop.group isEqualToString:group]) {
            [extractDatas addObject:shop];
        }
    }
    return extractDatas;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    [self loadShopDatas];
    return [self extractGroups].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self loadShopDatas];
    NSArray *groups = [self extractGroups];
    NSString *targetGroup = [groups objectAtIndex:section];
    return [self extractDatasAtGruop:targetGroup].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    [self loadShopDatas];
    NSArray *groups = [self extractGroups];
    return [groups objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self loadShopDatas];
    NSArray *groups = [self extractGroups];
    NSString *targetGroup = [groups objectAtIndex:indexPath.section];
    NSArray *datas = [self extractDatasAtGruop:targetGroup];
    Shop *shop = [datas objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = shop.name;
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [shopTable indexPathForSelectedRow];
        NSArray *groups = [self extractGroups];
        NSString *targetGroup = [groups objectAtIndex:indexPath.section];
        NSArray *datas = [self extractDatasAtGruop:targetGroup];
        Shop *shop = [datas objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailData:shop];
    }
    else if ([[segue identifier] isEqualToString:@"entryData"]) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        Shop *shop = (Shop *)[NSEntityDescription insertNewObjectForEntityForName:@"Shop" inManagedObjectContext:context];
        [[segue destinationViewController] setEditData:shop];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [self loadShopDatas];
    [shopTable reloadData];
}

@end
