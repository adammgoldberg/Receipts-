//
//  CustomCell.h
//  Receipts++
//
//  Created by Adam Goldberg on 2015-10-22.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *amountLabel;

@property (strong, nonatomic) IBOutlet UILabel *receiptDescriptionLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeStampLabel;




@end
