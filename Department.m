//
//  Department.m
//  Register
//
//  Created by Marek Hrusovsky on 01/12/14.
//  Copyright (c) 2014 Marek Hrusovsky. All rights reserved.
//

#import "Department.h"
#import "Employee.h"


@implementation Department

@dynamic deptName;
@dynamic manager;
@dynamic employees;


- (void)addEmployeesObject:(Employee *)value
{
  NSSet *s = [NSSet setWithObject:value];
  [self willChangeValueForKey:@"employees" withSetMutation:NSKeyValueUnionSetMutation usingObjects:s];
  [[self primitiveValueForKey:@"employees"] addObject:value];
  [self didChangeValueForKey:@"employees" withSetMutation:NSKeyValueUnionSetMutation usingObjects:s];
}

- (void)removeEmployeesObject:(Employee *)value
{
  Employee *manager = [self manager];
  if (manager == value) {
    [self setManager:nil];
  }
  
  NSSet *s = [NSSet setWithObject:value];
  [self willChangeValueForKey:@"employees" withSetMutation:NSKeyValueMinusSetMutation usingObjects:s];
  [[self primitiveValueForKey:@"employees"] removeObject:value];
  [self didChangeValueForKey:@"employees" withSetMutation:NSKeyValueMinusSetMutation usingObjects:s];
}

@end
