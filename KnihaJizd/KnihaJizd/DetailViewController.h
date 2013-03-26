//
//  DetailViewController.h
//  KnihaJizd
//
//  Created by Jan Šplíchal on 3/26/13.
//  Copyright (c) 2013 Jan Šplíchal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *ucelCestyText;
@property (weak, nonatomic) IBOutlet UITextField *stavTachometru;

@end
