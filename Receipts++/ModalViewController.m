//
//  ModalViewController.m
//  Receipts++
//
//  Created by Adam Goldberg on 2015-10-22.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "ModalViewController.h"
#import "Receipts.h"
#import "ViewController.h"
#import "Tags.h"

@interface ModalViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *amountText;


@property (strong, nonatomic) IBOutlet UITextField *descriptionText;


@property (strong, nonatomic) IBOutlet UITextField *tagText;




@end

@implementation ModalViewController


- (IBAction)newReceipt:(id)sender {
    Receipts *aReceipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipts" inManagedObjectContext:self.mdlContext];
    aReceipt.amount = @([self.amountText.text floatValue]);
    aReceipt.receiptDescription = self.descriptionText.text;
    aReceipt.timestamp = [NSDate date];
    
    Tags *aTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tags" inManagedObjectContext:self.mdlContext];
    aTag.tagName = self.tagText.text;
    
    [aReceipt addTagsObject:aTag];
    
    NSError *error;
    if ([self.mdlContext save:&error]) {
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//
//- (IBAction)getButton:(id)sender {
//
//    Teacher *newTeacher = [NSEntityDescription insertNewObjectForEntityForName:@"Teacher" inManagedObjectContext:self.context];
//    newTeacher.firstName = @"Adam";
//    newTeacher.lastName = @"Dahan";
//
//
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
//    // Filtering
//    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@""];
//    //fetchRequest.predicate
//    // Sorting
//    //fetchRequest.sortDescriptors
//
//    // fetchRequest.fetchBatchSize = 20;
//
//    NSError *error;
//    NSArray *dataArray = [self.context executeFetchRequest:fetchRequest error:&error];
//
//    for (Student *student in dataArray) {
//        NSLog(@"%@", student.firstName);
//        student.teacher = newTeacher;
//        //[newTeacher addStudentsObject:student];
//        student.firstName = @"Jason";
//    }
//
//    // [newTeacher addStudents:studentsSet]
//    /*
//     for (NSManagedObject *student in dataArray) {
//     NSString *firstName = [student valueForKey:@"firstName"];
//     NSLog(@"%@", firstName);
//
//     [student setValue:@"Jason" forKey:@"firstName"];
//     }
//     */
//
//    NSLog(@"%ld", dataArray.count);
//
//    NSLog(@"Teacher has %ld students", newTeacher.students.count);
//
//    [self.context save:&error];
//
//}
//








- (IBAction)cancelReceipt:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end





