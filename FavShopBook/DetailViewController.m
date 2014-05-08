//
//  DetailViewController.m
//  FavShopBook
//
//  Created by 北村拓也 on 2014/05/04.
//  Copyright (c) 2014年 kitamura. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"
#import "Shop.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *detailTable;

@end

@implementation DetailViewController

const int TITLE_DETAIL_INDEX = 0;
const int TEL_DETAIL_INDEX = 1;
const int ADDRESS_DETAIL_INDEX = 2;
const int OPEN_DETAIL_INDEX = 3;
const int CLOSE_DETAIL_INDEX = 4;
const int URL_DETAIL_INDEX = 5;
const int MEMO_DETAIL_INDEX = 6;
const int FACEBOOK_DETAIL_INDEX = 7;

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

#pragma mark - Managing the detail item

- (void)setDetailData:(Shop *)detailData
{
    if (_detailData != detailData) {
        _detailData = detailData;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail data.
    
    if (self.detailData) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case TITLE_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Title" forIndexPath:indexPath];
            ((UILabel*)[cell viewWithTag:1]).text = _detailData.name;
            ((UILabel*)[cell viewWithTag:2]).text = _detailData.kana;
            ((UILabel*)[cell viewWithTag:3]).text = _detailData.group;
            return cell;
        }
        case TEL_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tel" forIndexPath:indexPath];
            ((UILabel*)[cell viewWithTag:1]).text = _detailData.tel;
            return cell;
        }
        case ADDRESS_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Address" forIndexPath:indexPath];
            ((UILabel*)[cell viewWithTag:1]).text = _detailData.postCode;
            ((UILabel*)[cell viewWithTag:2]).text = _detailData.address;
            return cell;
        }
        case OPEN_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Open" forIndexPath:indexPath];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"HH:mm"];
            ((UILabel*)[cell viewWithTag:1]).text = [dateFormatter stringFromDate:_detailData.openTimeFrom];
            ((UILabel*)[cell viewWithTag:2]).text = [dateFormatter stringFromDate:_detailData.openTimeTo];
            return cell;
        }
        case CLOSE_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Close" forIndexPath:indexPath];
            ((UILabel*)[cell viewWithTag:1]).text = _detailData.closeDates;
            return cell;
        }
        case URL_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"URL" forIndexPath:indexPath];
            ((UILabel*)[cell viewWithTag:1]).text = _detailData.url;
            return cell;
        }
        case MEMO_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Memo" forIndexPath:indexPath];
            ((UITextView*)[cell viewWithTag:1]).text = _detailData.memo;
            return cell;
        }
        case FACEBOOK_DETAIL_INDEX: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Facebook" forIndexPath:indexPath];
            ((UILabel*)[cell viewWithTag:1]).text = _detailData.facebook;
            return cell;
        }
        default: {
            return nil;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case TITLE_DETAIL_INDEX:
            return 100;
        case ADDRESS_DETAIL_INDEX:
            return 76;
        case MEMO_DETAIL_INDEX:
            return 162;
        default:
            return 56;
    }
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editData"]) {
        EditViewController *editViewController = [segue destinationViewController];
        editViewController.delegate = self;
        [editViewController setEditData:_detailData];
    }
}

-(void)editViewBacked:(Shop *)shop
{
    [self.detailTable reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
