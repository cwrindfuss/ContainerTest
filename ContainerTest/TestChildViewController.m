//
//  TestChildViewController.m
//  ContainerTest
//
//  Created by Zac Bowling on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestChildViewController.h"


UIColor* randomColor() {
    static NSArray *colors;
    if (!colors) colors = [NSArray arrayWithObjects:[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor grayColor],[UIColor brownColor],[UIColor redColor], nil];
    UIColor *color = [colors objectAtIndex:(arc4random() % [colors count])];
    return color;
}


@implementation TestChildViewController
@dynamic labelText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _labelText = [[NSDate date] description];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (NSString *)labelText {
    return _labelText;
}

- (void)setLabelText:(NSString *)labelText {
    _labelText = [labelText copy];
    if ([self isViewLoaded])
       _label.text = [NSString stringWithFormat:@"(Test child controller.) \r\n%@",_labelText];
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (!_label)
        _label = [[UILabel alloc] initWithFrame:CGRectInset(self.view.bounds, 10, 10)];
    else
        _label.frame = CGRectInset(self.view.bounds, 10, 10);
    
    _label.text = [NSString stringWithFormat:@"(Test child controller.) \r\n%@",_labelText];
    _label.lineBreakMode = UILineBreakModeWordWrap;
    _label.textAlignment = UITextAlignmentCenter;
    
    //[self setLabelText:_labelText];
    _label.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    _label.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = randomColor();
    //self.view = _label;
    [self.view addSubview:_label];

}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    _label = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self view];
    NSLog(@"Controller viewWillAppear: %@",self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"Controller viewDidAppear: %@",self);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"Controller viewWillDisappear: %@",self);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"Controller viewDidDisappear: %@",self);
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"Controller viewDidLayoutSubviews: %@",self);
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"Controller viewWillLayoutSubviews: %@",self);
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    NSLog(@"Controller willMoveToParentViewController %@",self);
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"Controller didMoveToParentViewController %@",self);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
