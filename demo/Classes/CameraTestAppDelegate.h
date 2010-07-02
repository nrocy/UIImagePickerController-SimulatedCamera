//
//  CameraTestAppDelegate.h
//  CameraTest
//
//  Created by Paul King on 24/06/2010.
//  Copyright Paul King 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraTestViewController;

@interface CameraTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CameraTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CameraTestViewController *viewController;

@end

