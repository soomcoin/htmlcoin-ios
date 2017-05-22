//
//  TokenDetailsViewController.m
//  qtum wallet
//
//  Created by Sharaev Vladimir on 19.05.17.
//  Copyright © 2017 Designsters. All rights reserved.
//

#import "TokenDetailsViewController.h"
#import "WalletCoordinator.h"
#import "TokenDetailsTableSource.h"

CGFloat const HeightForHeaderView = 50.0f;
CGFloat const AnimationDuration = 0.2f;

@interface TokenDetailsViewController () <TokenDetailsTableSourceDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *availableBalanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *notConfirmedBalanceLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConsctaintForHeaderView;

@property (nonatomic, weak) TokenDetailsTableSource *source;

@end

@implementation TokenDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.source.delegate = self;
    self.tableView.dataSource = self.source;
    self.tableView.delegate = self.source;
}

- (void)setTableSource:(TokenDetailsTableSource *)source{
    self.source = source;
}

#pragma mark - Actions

- (IBAction)actionShare:(id)sender {
    
}

- (IBAction)actionBack:(id)sender {
    [self.delegate didBackPressed];
}

#pragma mark - TokenDetailsTableSourceDelegate

- (void)scrollViewDidScrollWithSecondSectionHeaderY:(CGFloat)headerY{
    CGFloat newConstant = HeightForHeaderView - headerY;
    
    if (newConstant < 0) {
        newConstant = 0;
    }
    
    if (newConstant > HeightForHeaderView) {
        newConstant = HeightForHeaderView;
    }
    
    if (self.heightConsctaintForHeaderView.constant == newConstant || self.heightConsctaintForHeaderView.constant == newConstant) {
        return;
    }
    
    self.heightConsctaintForHeaderView.constant = HeightForHeaderView - headerY;
//    [UIView animateWithDuration:AnimationDuration animations:^{
//        [self.view layoutIfNeeded];
//    }];
}

@end
