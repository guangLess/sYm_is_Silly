# sYm_is_Silly

Context: 

A funky mathematical symmetry based, one-page game, build with objective C.
This app turns itself off after one minutes. 
It is a reminder of its silliness is not worth of more than one minute of human attention.

<img src="./TEST_5/images/iOS Simulator Screen Shot Jul 9, 2015, 12.36.31 PM.png" width="320">
<img src="./TEST_5/images/iOS Simulator Screen Shot Jul 9, 2015, 12.36.49 PM.png" width="320">

Code: 

It is an awesome excise for the following methods. 
Draw a line with CGContextRef context
                    VS
                    
    self.path = [UIBezierPath bezierPath];
    
    self.shapeLayer = [CAShapeLayer layer];
    
  CGContextRef requires a subclass of UIView. 
  CAShapeLayer does not. It takes UIBezierPath as a property and adds it to the layer of the UIview ->
  
    [self.view.layer addSublayer:self.shapeLayer];

Use NSArray *animationImages to display gifs in UIImageView.

Track UIPanGestureRecognizer's current location to determine its symmetrical UIImageViews' locations

    CGPoint translation = [recognizer translationInView:self.view];
    
    recognizer.view.frame.origin gets the location of panMovement.
  
Add a timer to push an Alert then exit.

Use basic geometry method to manage coordinate dynamically.

If a square has always be on a top right corner of a screen. Its easier to use some mathematical thinking. 
 
    square.orgin.x = screen.width – square.size.width 
    
    square.orgin.y = 0 
    
 This way, we leave the calculation for xcode, as most of the time, UIView, UILayer, etc have the method to get thecurrent frame.
