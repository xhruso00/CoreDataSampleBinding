//
//  Employee.h
//  Register
//
//  Created by Marek Hrusovsky on 01/12/14.
//  Copyright (c) 2014 Marek Hrusovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Department;

@interface Employee : NSManagedObject

@property (nonatomic, copy) NSString * firstName;
@property (nonatomic, copy) NSString * lastName;
@property (nonatomic, retain) Department *department;
@property (nonatomic, readonly) NSString *fullName;


@end
