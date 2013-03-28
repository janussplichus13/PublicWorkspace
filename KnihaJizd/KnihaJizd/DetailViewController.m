//
//  DetailViewController.m
//  KnihaJizd
//
//  Created by Jan Šplíchal on 3/26/13.
//  Copyright (c) 2013 Jan Šplíchal. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
    
    NSString * onFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"green-car" ofType:@"png"];
    NSData *onImageData = [NSData dataWithContentsOfFile:onFilePath];
    UIImage *onImage = [[UIImage alloc] initWithData: onImageData];

    //_stavCesty.transform = CGAffineTransformMakeScale(10, 10);
    _stavCesty.onImage = onImage;
    
    NSString * offFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"red-car" ofType:@"png"];
    NSData *offImageData = [NSData dataWithContentsOfFile:offFilePath];
    UIImage *offImage = [[UIImage alloc] initWithData: offImageData];
    _stavCesty.offImage = offImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

- (IBAction)OnChangeStavCesty:(id)sender
{
//    CGContextSetStrokeColorWithColor(
    int i=0;
}
@end
