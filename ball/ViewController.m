#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cChange = false;
    _ball.layer.cornerRadius = 50.0;
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self demoGravity];
}

-(void) demoGravity{
     
    //gravity
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    [self.animator addBehavior:gravity];
    
    //collision
    UICollisionBehavior * collision = [[UICollisionBehavior alloc] initWithItems:@[self.ball]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionDelegate=self;
    [self.animator addBehavior:collision];
    
    //behavior
    UIDynamicItemBehavior  *item = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ball]];
    item.resistance= 1;
    item.elasticity=1.5;
    [self.animator addBehavior:item];
}

-(void) collisionBehavior:(UICollisionBehavior *)behavior  beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if(self.cChange){
        self.ball.backgroundColor  = [UIColor blueColor];
        _cChange = NO;
    }
    else{
        self.ball.backgroundColor  = [UIColor redColor];
        _cChange = YES;
    }
    
    
}

@end
