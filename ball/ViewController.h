//
//  ViewController.h
//  ball
//
//  Created by Ahmed Hussien on 29/10/1443 AH.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *ball;
@property UIDynamicAnimator *animator;
@property bool cChange;
-(void) demoGravity;
@end

