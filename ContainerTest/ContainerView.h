//
//  ContainerView.h
//  ContainerTest
//
//  Created by Zac Bowling on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerView : UIView {
    UIView *_bottomView;
    UIView *_topView;
}

@property (readonly,nonatomic) UIView *topView;
@property (readonly,nonatomic) UIView *bottomView;

@end
