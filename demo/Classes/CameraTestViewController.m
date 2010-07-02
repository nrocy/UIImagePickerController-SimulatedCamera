//
//  CameraTestViewController.m
//  CameraTest
//
//  Created by Paul King on 24/06/2010.
//  Copyright Paul King 2010. All rights reserved.
//

#import "CameraTestViewController.h"

#ifdef DEBUG
#import "UIImagePickerController+SimulatedCamera.h"
#endif

@implementation CameraTestViewController 
	
@synthesize label;
@synthesize imageView;

- (void)viewDidUnload {
	self.imageView = nil;
	self.label = nil;
}


- (void)dealloc {
	[self.imageView dealloc];
	[self.label dealloc];
	
	[super dealloc];
}


- (void)viewDidLoad {
 [super viewDidLoad];

	NSString *hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ? @"Hell Yeah!" : @"No :(";
	self.label.text = hasCamera;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)thePicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[thePicker dismissModalViewControllerAnimated:YES];	
	self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

#pragma mark -
#pragma mark Actions

-(IBAction) snapButton
{
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	picker.showsCameraControls = YES;
	
#ifdef DEBUG
	[picker mockCameraWithImageURL:@"http://nrocy.github.com/testcard.jpg"];
#endif
	
	[self presentModalViewController:picker animated:YES];
	
	[picker release];
}

#pragma mark -
#pragma mark Unused methods


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

@end
