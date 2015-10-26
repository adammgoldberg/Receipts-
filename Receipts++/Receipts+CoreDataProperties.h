//
//  Receipts+CoreDataProperties.h
//  Receipts++
//
//  Created by Adam Goldberg on 2015-10-22.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipts.h"

@class Tags;

NS_ASSUME_NONNULL_BEGIN

@interface Receipts (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSString *receiptDescription;
@property (nullable, nonatomic, retain) NSDate *timestamp;
@property (nullable, nonatomic, retain) NSSet<Tags *> *tags;

@end

@interface Receipts (CoreDataGeneratedAccessors)

- (void)addTagsObject:(Tags *)value;
- (void)removeTagsObject:(Tags *)value;
- (void)addTags:(NSSet<Tags *> *)values;
- (void)removeTags:(NSSet<Tags *> *)values;

@end

NS_ASSUME_NONNULL_END
