//
//  EmployeeViewController.m
//  Register
//
//  Created by Marek Hrusovsky on 01/12/14.
//  Copyright (c) 2014 Marek Hrusovsky. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (instancetype)init
{
  self = [super initWithNibName:@"EmployeeViewController" bundle:nil];
  if (self) {
    [self setTitle:@"Employees"];
  }
  return self;
}

@end
