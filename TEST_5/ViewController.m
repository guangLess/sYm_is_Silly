//
//  ViewController.m
//  sYm
//
//  Created by Guang Zhu on 6/3/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self creatTimer];
    self.imageA = [[UIImageView alloc]init];
    self.imageB = [[UIImageView alloc]init];
    self.imageF = [[UIImageView alloc]init];
    self.imageG = [[UIImageView alloc]init];
    
    self.imageE = [[UIImageView alloc]init];
    self.imageH = [[UIImageView alloc]init];
    self.imageI = [[UIImageView alloc]init];
    
    self.imageHomA = [[UIImageView alloc]init];
    self.imageHomB = [[UIImageView alloc]init];
    self.imageHomC = [[UIImageView alloc]init];
    self.imageHomD = [[UIImageView alloc]init];
    
    self.monster = [[UIImageView alloc]init];
        self.w = self.view.frame.size.width;
        self.h = self.view.frame.size.height;

    
    self.path = [UIBezierPath bezierPath];
    self.shapeLayer = [CAShapeLayer layer];
    [self.view.layer addSublayer:self.shapeLayer];
    
   }

-(void) viewWillAppear:(BOOL)animated {

}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {


    self.mainUI = [UIScreen mainScreen];
    CGRect mainUISize = self.mainUI.bounds;
    self.w = mainUISize.size.width;
    self.h = mainUISize.size.height;
    NSLog(@"mainUI Screen is Ox=%f, Oy=%f, W=%f, H=%f", self.mainUI.bounds.origin.x,mainUISize.origin.y, mainUISize.size.width,mainUISize.size.height);
    
}

-(void)uibezer{

    [self.path removeAllPoints];
    [self.path moveToPoint:CGPointMake(self.cv.ww, self.cv.wh)];
    [self.path addLineToPoint:CGPointMake(self.cv.lin2Ox, self.cv.lin2Oy)];
    self.shapeLayer.path = self.path.CGPath;
    self.shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    self.shapeLayer.lineWidth = 11.0;
    self.shapeLayer.fillColor = [UIColor blackColor].CGColor;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)handlePan:(UIPanGestureRecognizer *)recognizer{
    
    [self.cv setNeedsDisplay];
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y );

    [self.bird removeFromSuperview];
    
    self.bird = [[UIImageView alloc]initWithFrame:CGRectMake(recognizer.view.frame.origin.x-100, recognizer.view.frame.origin.y -40,100,100)];

    NSMutableArray * images = [[NSMutableArray alloc]init];
    for ( int i = 0 ; i < 8 ; i++){
        NSString * imageName = [NSString stringWithFormat:@"tmp-%i.gif",i];
        [images addObject:[UIImage imageNamed:imageName]];
    }

    self.bird.animationImages = images;
    self.bird.animationDuration = 1.00f;
    [self.bird startAnimating];

    [self.view addSubview:self.bird];
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    float tempBlueOx = recognizer.view.frame.origin.x;
    float tempBlueOy = recognizer.view.frame.origin.y;
    
    self.cv.lin2Ox = tempBlueOx;
    self.cv.lin2Oy = tempBlueOy;
    
    float r1 = self.w/self.h;
    float r2 = self.h/self.w;
    
    self.blue = CGRectMake(tempBlueOx, tempBlueOy,60,60);
    [self drawRectWith:self.w-tempBlueOx H:self.h-tempBlueOy Color:[UIColor blueColor] inView:self.imageA];
    [self drawRectWith:self.w-tempBlueOx H:tempBlueOy Color:[UIColor blueColor] inView:self.imageB];
    [self drawRectWith:tempBlueOx H:self.h-tempBlueOy Color:[UIColor blueColor] inView:self.imageF];

    self.cv.ww = self.w-tempBlueOx;
    self.cv.wh = self.h-tempBlueOy;
    
    [self drawRectWith:self.w-tempBlueOy*r1 H:self.h-tempBlueOx*r2 Color:[UIColor blueColor] inView:self.imageHomD];
    [self drawRectWith:self.w-tempBlueOy*r1 H:tempBlueOx*r2 Color:[UIColor blueColor] inView:self.imageHomB];
    [self drawRectWith:tempBlueOy*r1 H:self.h-tempBlueOx*r2 Color:[UIColor blueColor] inView:self.imageHomC];
    [self drawRectWith:tempBlueOy*r1 H:tempBlueOx*r2 Color:[UIColor blueColor] inView:self.imageHomA];

}

- (IBAction)yellow:(UIPanGestureRecognizer *)recognizerB{
    [self.cv setNeedsDisplay];
    [self uibezer];

    CGPoint translation = [recognizerB translationInView:self.view];
    recognizerB.view.center = CGPointMake(recognizerB.view.center.x + translation.x,
                                         recognizerB.view.center.y + translation.y );
    [recognizerB setTranslation:CGPointMake(0, 0) inView:self.view];
    float tempBirdOx = recognizerB.view.frame.origin.x;
    float tempBirdOy = recognizerB.view.frame.origin.y;
    self.cv.linOx = tempBirdOx;
    self.cv.linOy = tempBirdOy;
    
    self.yellow = CGRectMake(tempBirdOx, tempBirdOy, recognizerB.view.frame.size.width, recognizerB.view.frame.size.height);
    self.fakeRuler = CGRectMake(0, 0, 0, 0);

    [self drawRectWith:self.w-tempBirdOx H:tempBirdOy Color:[UIColor whiteColor] inView:self.imageH];
    [self drawRectWith:tempBirdOx H:self.h-tempBirdOy Color:[UIColor whiteColor] inView:self.imageI];
    
    float r1 = self.w/self.h;
    float r2 = self.h/self.w;
    
    [self drawRectWith:self.w-tempBirdOy*r1 H:self.h-tempBirdOx*r2 Color:[UIColor whiteColor] inView:self.imageHomD];
    [self drawRectWith:self.w-tempBirdOy*r1 H:tempBirdOx*r2 Color:[UIColor whiteColor] inView:self.imageHomB];
    [self drawRectWith:tempBirdOy*r1 H:self.h-tempBirdOx*r2 Color:[UIColor whiteColor] inView:self.imageHomC];
    [self drawRectWith:tempBirdOy*r1 H:tempBirdOx*r2 Color:[UIColor whiteColor] inView:self.imageHomA];
    [self drawCC:self.w -tempBirdOx Y:self.h-tempBirdOy inView:self.monster];
}

-(void)drawCC: (CGFloat)monsterX Y:(CGFloat)monsterY inView:(UIImageView*)inView{
   
    inView.frame = CGRectMake(monsterX,monsterY, 50, 50);
    NSMutableArray * images = [[NSMutableArray alloc]init];
    for (int i = 1 ; i < 5 ; i++){
     NSString *imageName = [NSString stringWithFormat:@"monster-%i.png", i];
     [images addObject:[UIImage imageNamed:imageName]];
    }
    inView.animationImages = images;
    inView.animationDuration = 0.7;
    inView.alpha = 0.6;
    [self.view addSubview: inView];
    [inView startAnimating];
}

-(void)drawRectWith:(CGFloat)sx H:(CGFloat)sy Color:(UIColor*)color inView:(UIView*)inView{

   
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.13;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.98;
    color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    inView.frame = CGRectMake(sx, sy, 43, 43);
    inView.layer.borderColor = color.CGColor;
    inView.layer.backgroundColor = color.CGColor;
    inView.layer.borderWidth = .01f;
    inView.layer.cornerRadius = 45;
    inView.layer.masksToBounds = YES;
    [self.view addSubview:inView];
}

-(NSTimer *)creatTimer {
    self.currentTimeInSeconds = 0;
    return [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTicked:) userInfo:nil repeats:YES];
            }

-(void)timerTicked:(NSTimer *)timer{
    self.currentTimeInSeconds++;
    NSLog(@"%d",self.currentTimeInSeconds);
    NSLog (@" TIMER [ %@ ]",[self formattedTime:_currentTimeInSeconds]);
    if(self.currentTimeInSeconds==50){
        
        [timer invalidate];
        [self alert];
    }
}

-(void)alert{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Don't be greedy"
                                                                       message:@":D silly, you do not need to spend more time on another sillyness!"
                                                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK, I do something else." style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self performSelector:@selector(closeApp) withObject:nil afterDelay:4.0];
        [self exit];
    }];
    
    UIAlertAction * notOK = [UIAlertAction actionWithTitle:@"NOT OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self creatTimer];
    }];
    
    [alert addAction:ok];
    [alert addAction:notOK];
    [self presentViewController:alert animated:YES completion:nil];
}
                                        
-(void)closeApp{
    [UIView animateWithDuration: 5.5
                     animations:^{
                         self.view.alpha = 0.0;
                     }];
}

-(void)exit{
    exit(0);
}

- (NSString *)formattedTime:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}

@end
