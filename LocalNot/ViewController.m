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
 
    NSLog(@"--------->> %@", [[UIApplication sharedApplication] currentUserNotificationSettings]);
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(currentUserNotificationSettings)]){ // Check it's iOS 8 and above
        UIUserNotificationSettings *grantedSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];

        if (grantedSettings.types == UIUserNotificationTypeNone) {
            NSLog(@"No permiossion granted");
            self.message.text = @"Notification stop";
            [defaults setBool:NO forKey:@"notificationIsActive"];
            [defaults synchronize];

            [[UIApplication sharedApplication] cancelAllLocalNotifications];
        }
        else if (grantedSettings.types & UIUserNotificationTypeSound & UIUserNotificationTypeAlert ){
            NSLog(@"Sound and alert permissions ");
        }
        else if (grantedSettings.types  & UIUserNotificationTypeAlert){
            NSLog(@"Alert Permission Granted");
            [defaults setBool:YES forKey:@"notificationIsActive"];
            [defaults synchronize];
            self.message.text = @"Notification start";
            NSTimeInterval interval;
            interval = 60 * 60 * 12;
            UILocalNotification* localNotification = [[UILocalNotification alloc]init];
            localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10.f];
            localNotification.alertBody = @"This is messafe user will see";
            localNotification.timeZone = [NSTimeZone defaultTimeZone];
            //localNotification.repeatInterval = NSCalendarUnitMinute;
            localNotification.soundName = UILocalNotificationDefaultSoundName;
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stop:(UIButton *)sender {
    
    /*self.message.text = @"Notification stop";
    [defaults setBool:NO forKey:@"notificationIsActive"];
    [defaults synchronize];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    */
    
}

- (IBAction)start:(UIButton *)sender {
    
    /*[defaults setBool:YES forKey:@"notificationIsActive"];
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
     */
    

}

- (IBAction)switch:(UISwitch *)sender {
    
    UISwitch* mySwitch =(UISwitch*) sender;
    if ([mySwitch isOn]) {
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
        
    } else {
        self.message.text = @"Notification stop";
        [defaults setBool:NO forKey:@"notificationIsActive"];
        [defaults synchronize];
        
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
    
    
}


- (void) viewWillAppear:(BOOL)animated {
    BOOL notificationIsActive = [defaults boolForKey:@"notificationIsActive"];
    if (notificationIsActive == true) {
        self.message.text=@"Notification is Active";
    }
}

@end
