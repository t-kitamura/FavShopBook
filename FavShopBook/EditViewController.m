//
//  EditViewController.m
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/05.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import "EditViewController.h"
#import "Shop.h"

@interface EditViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *editTable;

@end

@implementation EditViewController

const int TITLE_EDIT_INDEX = 0;
const int TEL_EDIT_INDEX = 1;
const int ADDRESS_EDIT_INDEX = 2;
const int OPEN_EDIT_INDEX = 3;
const int CLOSE_EDIT_INDEX = 4;
const int URL_EDIT_INDEX = 5;
const int FACEBOOK_EDIT_INDEX = 6;

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the edit item

- (void)setEditData:(Shop *)editData
{
    _editData = editData;
}


#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case TITLE_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Title" forIndexPath:indexPath];
            ((UITextField*)[cell viewWithTag:1]).text = _editData.name;
            ((UITextField*)[cell viewWithTag:2]).text = _editData.kana;
            ((UITextField*)[cell viewWithTag:3]).text = _editData.group;
            return cell;
        }
        case TEL_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tel" forIndexPath:indexPath];
            ((UITextField*)[cell viewWithTag:1]).text = _editData.tel;
            return cell;
        }
        case ADDRESS_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Address" forIndexPath:indexPath];
            ((UITextField*)[cell viewWithTag:1]).text = _editData.postCode;
            ((UITextField*)[cell viewWithTag:2]).text = _editData.address;
            return cell;
        }
        case OPEN_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Open" forIndexPath:indexPath];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            df.dateFormat  = @"HH:mm";
            NSDate *empty = [df dateFromString:@"00:00"];
            ((UIDatePicker*)[cell viewWithTag:1]).date = _editData.openTimeFrom != nil ? _editData.openTimeFrom : empty;
            ((UIDatePicker*)[cell viewWithTag:2]).date = _editData.openTimeTo != nil ? _editData.openTimeTo : empty;
            return cell;
        }
        case CLOSE_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Close" forIndexPath:indexPath];
            ((UITextField*)[cell viewWithTag:1]).text = _editData.closeDates;
            return cell;
        }
        case URL_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"URL" forIndexPath:indexPath];
            ((UITextField*)[cell viewWithTag:1]).text = _editData.url;
            return cell;
        }
        case FACEBOOK_EDIT_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Facebook" forIndexPath:indexPath];
            ((UITextField*)[cell viewWithTag:1]).text = _editData.facebook;
            return cell;
        }
        default: {
            return nil;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case TITLE_EDIT_INDEX:
            return 121;
        case ADDRESS_EDIT_INDEX:
            return 84;
        case OPEN_EDIT_INDEX:
            return 216;
        default:
            return 44;
    }
}

- (IBAction)saveButton:(UIBarButtonItem *)sender {
    UITableViewCell *titleCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:TITLE_EDIT_INDEX inSection:0]];
    if (titleCell != nil) {
        _editData.name = ((UITextField*)[titleCell viewWithTag:1]).text;
        _editData.kana = ((UITextField*)[titleCell viewWithTag:2]).text;
        _editData.group = ((UITextField*)[titleCell viewWithTag:3]).text;
    }

    UITableViewCell *telCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:TEL_EDIT_INDEX inSection:0]];
    if (telCell != nil) {
        _editData.tel = ((UITextField*)[telCell viewWithTag:1]).text;
    }
    
    UITableViewCell *addressCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:ADDRESS_EDIT_INDEX inSection:0]];
    if (addressCell != nil) {
        _editData.postCode = ((UITextField*)[addressCell viewWithTag:1]).text;
        _editData.address = ((UITextField*)[addressCell viewWithTag:2]).text;
    }
    
    UITableViewCell *openCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:OPEN_EDIT_INDEX inSection:0]];
    if (openCell != nil) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat  = @"HH:mm";
        _editData.openTimeFrom = ((UIDatePicker*)[openCell viewWithTag:1]).date;
        _editData.openTimeTo = ((UIDatePicker*)[openCell viewWithTag:2]).date;
    }
    
    UITableViewCell *closeCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:CLOSE_EDIT_INDEX inSection:0]];
    if (closeCell != nil) {
        _editData.closeDates = ((UITextField*)[closeCell viewWithTag:1]).text;
    }

    UITableViewCell *urlCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:URL_EDIT_INDEX inSection:0]];
    if (urlCell != nil) {
        _editData.url = ((UITextField*)[urlCell viewWithTag:1]).text;
    }
    
    UITableViewCell *facebookCell = [_editTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:FACEBOOK_EDIT_INDEX inSection:0]];
    if (facebookCell != nil) {
        _editData.facebook = ((UITextField*)[facebookCell viewWithTag:1]).text;
    }
    
    NSError *error = nil;
    if (![_editData.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
}

#pragma mark - Navigation

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(editViewBacked:)]) {
        [self.delegate editViewBacked:_editData];
    }

//    [self.managedObjectContext rollback];
}

@end
