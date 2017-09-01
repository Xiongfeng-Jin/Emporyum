//
//  mainViewController.m
//  Emporyum
//
//  Created by Jin on 12/24/13.
//  Copyright (c) 2013 Jin. All rights reserved.
//

#import "mainViewController.h"
#import "BubbleView.h"
#import "Behavior.h"
#import "ShowImageViewController.h"
#import "UIColor+Custom_Color.h"
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>


@interface mainViewController () <UIDynamicAnimatorDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,UICollisionBehaviorDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (strong,nonatomic) UIDynamicAnimator *animator;
@property (strong,nonatomic) Behavior *behavior;
@property (weak, nonatomic) IBOutlet UIView *displayImageView;
@property (strong,nonatomic) ShowImageViewController* imgVC;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *camaraButton;

@end

@implementation mainViewController

-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.contentView];
        _animator.delegate = self;
    }
    return _animator;
}

-(Behavior *)behavior{
    if (!_behavior) {
        _behavior = [[Behavior alloc] init];
        [self.animator addBehavior:_behavior];
        _behavior.collider.collisionDelegate=self;
    }
    return _behavior;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    //    self.navigationController.navigationBarHidden = YES;
    
    self.displayImageView.hidden = YES;
    self.contentView.delegate = self;
    self.contentView.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.contentView.bounds.size.height);
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"E_WhiteBG.png"]];
    
    //create a bubble
    [self makeBubbleWithImage:@"wagon_frontl_cropped.png" withRadius:80 atX:175 andY:200 withOvalColor: [UIColor empLimeColor]];
    [self makeBubbleWithImage:@"sports_trophy_cropped.png" withRadius:45 atX:30 andY:80 withOvalColor: [UIColor empLimeColor]];
    [self makeBubbleWithImage:@"guitar_pick_cropped.png" withRadius:40 atX:220 andY:140 withOvalColor: [UIColor empTealColor]];
    [self makeBubbleWithImage:@"SignedBaseball_cropped.png" withRadius:20 atX:200 andY:55 withOvalColor: [UIColor empTealColor]];
    [self makeBubbleWithImage:@"rubicsCube.png" withRadius:75 atX:35 andY:420 withOvalColor: [UIColor empTealColor]];
    [self makeBubbleWithImage:@"SpidermanToy_cropped" withRadius:40 atX:220 andY:430 withOvalColor: [UIColor empLimeColor]];
    
    [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideNavigationBar:)]];
}


-(void)addBubbleViewToView:(BubbleView*)b{
    if (self.contentView.contentSize.height < b.center.y+b.radius) {
        self.contentView.contentSize = CGSizeMake(self.contentView.bounds.size.width, b.center.y+2*b.radius);
    }
    [self.contentView addSubview:b];
    [b addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(changeVelocity:)]];
    [b addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage:)]];
    [self.behavior addItem:b];
}


-(void)changeVelocity:(UIPanGestureRecognizer*)sender{
    
    if (sender.state == UIGestureRecognizerStateBegan || sender.state == UIGestureRecognizerStateChanged) {
        CGPoint v;
        v.x = [sender velocityInView:self.view].x/15;
        v.y = [sender velocityInView:self.view].y/15;
        self.behavior.animationActions.resistance = 0;
        [self.behavior.animationActions addLinearVelocity:v forItem:sender.view];
    }
    else{
        [self.behavior.animationActions addLinearVelocity:CGPointZero forItem:sender.view];
        self.behavior.animationActions.resistance = 3;
    }
}


-(void)showImage:(UITapGestureRecognizer *)sender{
    self.displayImageView.hidden = !self.displayImageView.hidden;
    self.imgVC.imageView.image = ((BubbleView*)sender.view).image;
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(backButton:)];
    [UIView transitionWithView:self.displayImageView duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.navigationController.navigationBarHidden = NO;
    } completion:nil];
    [self.camaraButton setEnabled:self.displayImageView.hidden];
}

-(void)backButton:(UIBarButtonItem *)sender{
    self.navigationItem.leftBarButtonItem = nil;
    [UIView transitionWithView:self.displayImageView duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.displayImageView.hidden = YES;
    } completion:nil];
    [self.camaraButton setEnabled:self.displayImageView.hidden];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Show Image"]) {
        self.imgVC = (ShowImageViewController*)segue.destinationViewController;
    }
}

-(void)hideNavigationBar:(UITapGestureRecognizer *)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.navigationController.navigationBarHidden = !self.navigationController.navigationBarHidden;
    }];
}


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (velocity.y == 0) {
        self.behavior.collider.collisionMode = UICollisionBehaviorModeEverything;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.behavior.collider.collisionMode = UICollisionBehaviorModeEverything;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.behavior.collider.collisionMode = UICollisionBehaviorModeItems;
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2{
    BubbleView* b1 = (BubbleView*)item1;
    BubbleView* b2 = (BubbleView*)item2;
    if (b1.radius+b2.radius > [self getDistanceBetweenBubbleViews:b1 B2:b2]) {
        CGPoint p;
        p.x = (b1.center.x-b2.center.x);
        p.y = b1.center.y-b2.center.y;
        [self.behavior.animationActions addLinearVelocity:p forItem:b1];
    }
}

-(float)getDistanceBetweenBubbleViews:(BubbleView*)b1 B2:(BubbleView*)b2{
    return sqrt(pow(b1.center.x-b2.center.x, 2)+pow(b1.center.y-b2.center.y, 2));
}

- (IBAction)takePhoto:(UIBarButtonItem *)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]) {
        case AVAuthorizationStatusAuthorized:
            break;
        case AVAuthorizationStatusNotDetermined:
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted)
             {
                 if(!granted)
                 {
                     //Start card-io
                     exit(0);
                 }
                 
             }];
        default:
            break;
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    UIImage *tempImage = info[UIImagePickerControllerOriginalImage];
    CGSize imageSize = tempImage.size;
    imageSize.height = 626;
    imageSize.width = 413;
    
    tempImage = [self scaleImage:tempImage scaledToSize:imageSize];
    NSData *imagedata = UIImageJPEGRepresentation(tempImage, 0.00001);
#warning put bubble view in random place.
    BubbleView *b = [[BubbleView alloc] initWithRadius:50 atPoint:CGPointMake(200, 400)];
    b.circlebackgroundColor = [UIColor randomColor];
    b.image = [UIImage imageWithData:imagedata];
    [self addBubbleViewToView:b];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(UIImage *)scaleImage:(UIImage *)oldImage scaledToSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    [oldImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)makeBubbleWithImage: (NSString *)imageString withRadius:(CGFloat)radius atX:(CGFloat)x andY: (CGFloat)y withOvalColor: (UIColor *)color{
    BubbleView *b = [[BubbleView alloc] initWithRadius:radius atPoint:CGPointMake(x, y)];
    b.circleAlpha = 1.0;
    b.circlebackgroundColor = color;
    b.image = [UIImage imageNamed:imageString];
    [self addBubbleViewToView:b];
}



@end
