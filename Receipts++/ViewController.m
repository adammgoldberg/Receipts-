//
//  ViewController.m
//  Receipts++
//
//  Created by Adam Goldberg on 2015-10-22.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "ViewController.h"
#import "Tags.h"
#import "Receipts.h"
#import "ModalViewController.h"
#import "CustomCell.h"

@interface ViewController () <NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSFetchedResultsController *fetchController;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (IBAction)addAReceipt:(UIButton*)sender { }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showModal"]) {
        ModalViewController *mdlc = (ModalViewController*)[segue destinationViewController];
        mdlc.mdlContext = self.managedContext;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *aCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    [self configureCell:aCell atIndexPath:indexPath];
    return aCell;
}

- (void)configureCell:(CustomCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    Tags *tag = [self.fetchController objectAtIndexPath:indexPath];
    Receipts *receipt = tag.receipts.allObjects[indexPath.row];
    cell.amountLabel.text = [NSString stringWithFormat:@"%@", receipt.amount];
    cell.receiptDescriptionLabel.text = receipt.receiptDescription;
    cell.timeStampLabel.text = [NSString stringWithFormat:@"%@",[NSDate date]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchController sections] count];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchController sections] objectAtIndex:section];
    return [(Tags *)sectionInfo.objects.lastObject tagName];
}

#pragma mark Fetchcontroller

- (NSFetchedResultsController *)fetchController
{
    if (_fetchController != nil) {
        return _fetchController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tags" inManagedObjectContext:self.managedContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tagName" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedContext sectionNameKeyPath:nil cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchController = aFetchedResultsController;
    
    self.fetchController.delegate = self;
    
    NSError *error = nil;
    if (![self.fetchController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchController;
}

- (void)controllerWillChangeContent:
(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

@end


