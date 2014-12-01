//
//  Department.h
//  Register
//
//  Created by Marek Hrusovsky on 01/12/14.
//  Copyright (c) 2014 Marek Hrusovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employee;

@interface Department : NSManagedObject

@property (nonatomic, copy) NSString * deptName;
@property (nonatomic, retain) Employee *manager;
@property (nonatomic, retain) NSSet *employees;

@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(Employee *)value;
- (void)removeEmployeesObject:(Employee *)value;
- (void)addEmployees:(NSSet *)values;
- (void)removeEmployees:(NSSet *)values;

@end
