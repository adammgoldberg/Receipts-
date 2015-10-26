//
//  Tags+CoreDataProperties.h
//  Receipts++
//
//  Created by Adam Goldberg on 2015-10-22.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tags.h"

@class Receipts;

NS_ASSUME_NONNULL_BEGIN

@interface Tags (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *tagName;
@property (nullable, nonatomic, retain) NSSet<Receipts *> *receipts;

@end

@interface Tags (CoreDataGeneratedAccessors)

- (void)addReceiptsObject:(Receipts *)value;
- (void)removeReceiptsObject:(Receipts *)value;
- (void)addReceipts:(NSSet<Receipts *> *)values;
- (void)removeReceipts:(NSSet<Receipts *> *)values;

@end

NS_ASSUME_NONNULL_END
