//
//  ViewController.h
//  LocalNot
//
//  Created by supermacho on 20.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *message;

- (IBAction)stop:(UIButton *)sender;
- (IBAction)start:(UIButton *)sender;
- (IBAction)switch:(UISwitch *)sender;

@end

