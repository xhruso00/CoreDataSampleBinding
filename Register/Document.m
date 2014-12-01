//
//  Document.m
//  Register
//
//  Created by Marek Hrusovsky on 01/12/14.
//  Copyright (c) 2014 Marek Hrusovsky. All rights reserved.
//

#import "Document.h"
#import "EmployeeViewController.h"
#import "DepartmentViewController.h"

@interface Document ()
@property (strong) NSMutableArray *viewControllers;
@property (weak) IBOutlet NSBox *box;
@property (weak) IBOutlet NSPopUpButton *popupButton;
@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
      _viewControllers = [[NSMutableArray alloc] init];
      ManagingViewController *vc;
      vc = [[DepartmentViewController alloc] init];
      vc.managedObjectContext = self.managedObjectContext;
      [_viewControllers addObject:vc];
      
      vc = [[EmployeeViewController alloc] init];
      vc.managedObjectContext = self.managedObjectContext;
      [_viewControllers addObject:vc];
      

      
    }
    return self;
}

- (IBAction)changeViewController:(id)sender
{
  NSUInteger tag = [sender tag];
  ManagingViewController *vc = [self.viewControllers objectAtIndex:tag];
  [self displayViewController:vc];
}

- (void)displayViewController:(ManagingViewController *)viewController
{
  NSWindow *window = [self.box window];
  BOOL ended = [window makeFirstResponder:window];
  if (!ended) {
    NSBeep();
    return;
  }
  NSView *view = [viewController view];
  NSSize currentSize = [self.box frame].size;
  NSSize newSize = [view frame].size;
  
  float deltaWidth = newSize.width - currentSize.width;
  float deltaHeight = newSize.height - currentSize.height;
  NSRect windowFrame = [window frame];
  windowFrame.size.height += deltaHeight;
  windowFrame.origin.y -= deltaHeight;
  windowFrame.size.width += deltaWidth;

  [self.box setContentView:nil];
  
  [window setFrame:windowFrame display:YES animate:YES];
  
  [self.box setContentView:view];
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
  [super windowControllerDidLoadNib:aController];
  NSMenu *menu = [self.popupButton menu];
  [menu removeAllItems];
  NSUInteger i, itemCount;
  itemCount = [self.viewControllers count];
  
  for (i = 0; i < itemCount; i++) {
    NSViewController *vc = [self.viewControllers objectAtIndex:i];
    NSString *title = vc.title;
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:title action:@selector(changeViewController:) keyEquivalent:@""];
    [item setTag:i];
    [item setTarget:self];
    [menu addItem:item];
  }
  
  [self displayViewController:[self.viewControllers objectAtIndex:0]];
  [self.popupButton selectItemAtIndex:0];
}


- (NSString *)windowNibName {
  // Override returning the nib file name of the document
  // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
  return @"Document";
}

@end
