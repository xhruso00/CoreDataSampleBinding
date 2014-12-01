//
//  Employee.m
//  Register
//
//  Created by Marek Hrusovsky on 01/12/14.
//  Copyright (c) 2014 Marek Hrusovsky. All rights reserved.
//

#import "Employee.h"
#import "Department.h"


@implementation Employee

@dynamic firstName;
@dynamic lastName;
@dynamic department;

- (NSString *)fullName
{
  NSString *first = [self firstName];
  NSString *last = [self lastName];
  if (!last) {
    return first;
  }
  
  if (!first) {
    return last;
  }
  
  return [NSString stringWithFormat:@"%@ %@", first, last];
}

+ (NSSet *)keyPathsForValuesAffectingFullName
{
  return [NSSet setWithArray:@[@"firstName", @"lastName"]];
}

@end
