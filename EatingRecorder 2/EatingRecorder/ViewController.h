//
//  ViewController.h
//  EatingRecorder
//
//  Created by GUEST on 2/29/16.
//  Copyright © 2016 Edward Kuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (weak, nonatomic) IBOutlet UIButton *dButton;
@property (weak, nonatomic) IBOutlet UIButton *rButton;

@property (weak, nonatomic) IBOutlet UIButton *eButton;
@end

