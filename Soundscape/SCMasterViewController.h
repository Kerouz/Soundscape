//
//  SCMasterViewController.h
//  Soundscape
//
//  Created by Apple on 14/09/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCDetailViewController;

#import <CoreData/CoreData.h>

@interface SCMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) SCDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
