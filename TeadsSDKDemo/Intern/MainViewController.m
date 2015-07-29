//
//  MainViewController.m
//  TeadsSDKDemo
//
//  Created by Nikolaï Roycourt on 15/01/2015.
//  Copyright (c) 2015 Teads. All rights reserved.
//

#import "MainViewController.h"

#import "InBoardScrollViewController.h"
#import "InBoardTableViewController.h"
#import "InBoardWebViewController.h"
#import "InReadScrollViewController.h"
#import "InReadTableViewController.h"
#import "CustomNativeVideoScrollViewViewController.h"
#import "InReadWebViewController.h"
#import "InSwipeViewController.h"
#import "InFlowViewController.h"

@interface MainViewController () {
    NSArray *titlesForHeader;
    NSArray *controllers;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];

    self.title = @"Teads SDK Demo";
    
    titlesForHeader = @[@"Native Video", @"Interstitial"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [titlesForHeader count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 12;
    }
    
    return 2;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [titlesForHeader objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellTitleIdentifier = @"CellTitle";
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell;
    
    if ((indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 8 || indexPath.row == 10)) ||
        (indexPath.section == 1 && indexPath.row == 0)) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellTitleIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTitleIdentifier];
        }
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.userInteractionEnabled = NO;
        cell.backgroundColor = [UIColor  colorWithWhite:1 alpha:0.5];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"inRead";
                break;
            case 1:
                cell.textLabel.text = @"inRead ScrollView";
                break;
            case 2:
                cell.textLabel.text = @"inRead WebView";
                break;
            case 3:
                cell.textLabel.text = @"inRead TableView";
                break;
            case 4:
                cell.textLabel.text = @"inBoard";
                break;
            case 5:
                cell.textLabel.text = @"inBoard ScrollView";
                break;
            case 6:
                cell.textLabel.text = @"inBoard WebView";
                break;
            case 7:
                cell.textLabel.text = @"inBoard TableView";
                break;
            case 8:
                cell.textLabel.text = @"Custom Native Video View";
                break;
            case 9:
                cell.textLabel.text = @"Custom in ScrollView";
                break;
            case 10:
                cell.textLabel.text = @"inSwipe";
                break;
            case 11:
                cell.textLabel.text = @"inSwipe Pager";
                break;
            default:
                break;
        }
    } else {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"inFlow";
                break;
            case 1:
                cell.textLabel.text = @"inFlow demo page";
                break;
            default:
                break;
        } 
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id controller = nil;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 1: {
                InReadScrollViewController *inReadScrollView = [storyboard  instantiateViewControllerWithIdentifier:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)?@"inReadScrollViewForIPad":@"inReadScrollView"];
                controller = inReadScrollView;
                break;
            }
            case 2: {
                InReadWebViewController *inReadWebView = [storyboard instantiateViewControllerWithIdentifier:@"inReadWebView"];
                controller = inReadWebView;
                break;
            }
            case 3: {
                 InReadTableViewController *inReadTableView = [storyboard instantiateViewControllerWithIdentifier:@"inReadTableView"];
                controller = inReadTableView;
                break;
            }
            case 5: {
                InBoardScrollViewController *inBoardScrollView = [storyboard instantiateViewControllerWithIdentifier:@"inBoardScrollView"];
                controller = inBoardScrollView;
                break;
            }
            case 6: {
                InBoardWebViewController *inBoardWebView = [storyboard instantiateViewControllerWithIdentifier:@"inBoardWebView"];
                controller = inBoardWebView;
                break;
            }
            case 7: {
                InBoardTableViewController *inBoardTableView = [storyboard instantiateViewControllerWithIdentifier:@"inBoardTableView"];
                controller = inBoardTableView;
                break;
            }
            case 9: {
                CustomNativeVideoScrollViewViewController *simpleInReadScrollViewController = [storyboard instantiateViewControllerWithIdentifier:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)?@"customNativeVideoScrollViewiPad":@"customNativeVideoScrollView"];
                controller = simpleInReadScrollViewController;
                break;
            }
            case 11: {
                InSwipeViewController *inSwipe = [storyboard instantiateViewControllerWithIdentifier:@"inSwipe"];
                controller = inSwipe;
                break;
            }
            default:
                break;
        }
        
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        InFlowViewController *inFlow = [storyboard instantiateViewControllerWithIdentifier:@"inFlow"];
        controller = inFlow;
    }
    
    if (controller != nil) {
        [self.navigationController pushViewController:controller animated:YES];
    }
}


@end
