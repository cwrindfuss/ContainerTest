//
//  TestChildViewController.h
//  ContainerTest
//
//  Created by Zac Bowling on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestChildViewController : UIViewController {
    UILabel *_label;
    NSString *_labelText;
}


@property (copy, nonatomic) NSString *labelText;

@end
