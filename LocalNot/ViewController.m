//
//  ViewController.m
//  LocalNot
//
//  Created by supermacho on 20.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSUserDefaults* defaults;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings* setting = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stop:(UIButton *)sender {
    
    self.message.text = @"Notification stop";
    [defaults setBool:NO forKey:@"notificationIsActive"];
    [defaults synchronize];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    
}

- (IBAction)start:(UIButton *)sender {
    
    [defaults setBool:YES forKey:@"notificationIsActive"];
    [defaults synchronize];
    self.message.text = @"Notification start";
    NSTimeInterval interval;
    interval = 60 * 60 * 12;
    UILocalNotification* localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:100.f];
    localNotification.alertBody = @"This is messafe user will see";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.repeatInterval = NSCalendarUnitMinute;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    

}


- (void) viewWillAppear:(BOOL)animated {
    BOOL notificationIsActive = [defaults boolForKey:@"notificationIsActive"];
    if (notificationIsActive == true) {
        self.message.text=@"Notification is Active";
    }
}

@end
