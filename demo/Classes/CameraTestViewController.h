//
//  CameraTestViewController.h
//  CameraTest
//
//  Created by Paul King on 24/06/2010.
//  Copyright Paul King 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraTestViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	IBOutlet UILabel *label;
	IBOutlet UIImageView *imageView;
}

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIImageView *imageView;

-(IBAction) snapButton;
-(IBAction) cancelButton;

@end

