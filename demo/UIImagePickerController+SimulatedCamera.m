//
//  UIImagePickerController+SimulatedCamera.m
//
//  Created by Paul King on 29/06/2010.
//  Copyright 2010 Paul King. All rights reserved.
//

#import "UIImagePickerController+SimulatedCamera.h"

#define kUIImagePickerControllerSimulatedCameraDefaultDelay 2.0

@implementation UIImagePickerController(SimulatedCamera)

-(void)cameraDismissTimerFireMethod:(NSTimer*)timer
{
	NSString *urlString = (NSString*)timer.userInfo;
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:urlString]];
	NSData *imagedata = [NSData dataWithContentsOfURL:url];
	UIImage *image = [UIImage imageWithData:imagedata];
	
	NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:image, UIImagePickerControllerOriginalImage, image, UIImagePickerControllerEditedImage, nil];
	
	[self.delegate imagePickerController:(UIImagePickerController *)self didFinishPickingMediaWithInfo:(NSDictionary *)info];
}

-(void)mockCameraWithImageURL:(NSString *)url
{
	[self mockCameraWithImageURL:url delay:kUIImagePickerControllerSimulatedCameraDefaultDelay];
}

-(void)mockCameraWithImageURL:(NSString*)url delay:(NSInteger)delay
{
	if( [self.delegate respondsToSelector:@selector(imagePickerController:didFinishPickingMediaWithInfo:)] )
	{
		[NSTimer scheduledTimerWithTimeInterval:delay target:self selector:@selector(cameraDismissTimerFireMethod:) userInfo:url repeats:NO];
	}
	else
	{
		NSLog( @"You've called mockCameraWithImageURL but you've not implemented didFinishPickingMediaWithInfo" );
	}
}

@end
