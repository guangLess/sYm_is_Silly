//
//  ViewController.h
//  TEST_5
//
//  Created by Aditya Narayan on 6/3/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contextView.h"
#import "Foundation/Foundation.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) UIScreen* mainUI;

@property (weak, nonatomic) IBOutlet UIImageView *imageC;//c
@property (weak, nonatomic) IBOutlet UIImageView *imageD;//d

@property (strong, nonatomic) UIImageView *imageA;
@property (strong, nonatomic) UIImageView *imageB;
@property (strong, nonatomic) UIImageView *imageF;
@property (strong, nonatomic) UIImageView *imageG;

@property (strong, nonatomic) UIImageView *imageE;
@property (strong, nonatomic) UIImageView *imageH;
@property (strong, nonatomic) UIImageView *imageI;

@property (strong, nonatomic) UIImageView *imageHomA;
@property (strong, nonatomic) UIImageView *imageHomB;
@property (strong, nonatomic) UIImageView *imageHomC;
@property (strong, nonatomic) UIImageView *imageHomD;


@property (strong, nonatomic) UIImageView *monster;


@property (weak, nonatomic) IBOutlet contextView *cv;


@property CGRect blue;
@property CGRect yellow;
@property CGRect fakeRuler;
@property (strong, nonatomic) UIImageView *rulerBox;
@property CGFloat w;
@property CGFloat h;
@property CGFloat elfOx;
@property CGFloat elfOy;

//@property CGPoint rA;

@property (strong, nonatomic) UIBezierPath * path;
@property (strong, nonatomic) CAShapeLayer * shapeLayer;
@property (strong, nonatomic) UIImageView * bird;

-(IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)yellow:(UIPanGestureRecognizer *)recognizerB;

@property (strong, nonatomic)UIImageView *animationImageView;

@property (weak, nonatomic)NSTimer *myTimer;
@property int currentTimeInSeconds;


@end

