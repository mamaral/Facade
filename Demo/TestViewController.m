//
//  TestViewController.m
//  Facade
//
//  Created by Mike on 5/6/15.
//  Copyright (c) 2015 Mike Amaral. All rights reserved.
//

#import "TestViewController.h"
#import "UIView+Facade.h"

@implementation TestViewController {
    UIView *_redView;
    UIView *_orangeView;
    UIView *_yellowView;
    UIView *_greenView;
    UIView *_blueView;
    UIView *_purpleView;
    UIView *_brownView;
    UIView *_grayView;
    UIView *_blackView;
    UIView *_cyanView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self createSubviews];
}

- (void)createSubviews {
    self.view.backgroundColor = [UIColor lightGrayColor];

    _redView = [UIView new];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];

    _orangeView = [UIView new];
    _orangeView.backgroundColor = [UIColor orangeColor];
    [_redView addSubview:_orangeView];

    _yellowView = [UIView new];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [_redView addSubview:_yellowView];

    _greenView = [UIView new];
    _greenView.backgroundColor = [UIColor greenColor];
    [_redView addSubview:_greenView];

    _blueView = [UIView new];
    _blueView.backgroundColor = [UIColor blueColor];
    [_redView addSubview:_blueView];

    _purpleView = [UIView new];
    _purpleView.backgroundColor = [UIColor purpleColor];
    [_redView addSubview:_purpleView];

    _brownView = [UIView new];
    _brownView.backgroundColor = [UIColor brownColor];
    [_redView addSubview:_brownView];

    _grayView = [UIView new];
    _grayView.backgroundColor = [UIColor grayColor];
    [_redView addSubview:_grayView];

    _blackView = [UIView new];
    _blackView.backgroundColor = [UIColor blackColor];
    [_redView addSubview:_blackView];

    _cyanView = [UIView new];
    _cyanView.backgroundColor = [UIColor cyanColor];
    [_redView addSubview:_cyanView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    [self layoutFacade];
}

- (void)layoutFacade {
    [_redView anchorInCenterFillingWidthAndHeightWithLeftAndRightPadding:10 topAndBottomPadding:10];
    [_orangeView anchorTopLeftWithLeftPadding:10 topPadding:10 width:50 height:50];
    [_yellowView anchorTopRightWithRightPadding:10 topPadding:10 width:50 height:50];
    [_greenView anchorBottomLeftWithLeftPadding:10 bottomPadding:10 width:50 height:50];
    [_blueView anchorBottomRightWithRightPadding:10 bottomPadding:10 width:50 height:50];

    [_purpleView alignBetweenLeft:_orangeView andRight:_yellowView matchingTopWithLeftAndRightPadding:10 height:50];
    [_brownView alignBetweenTop:_orangeView andBottom:_greenView matchingLeftWithTopAndBottomPadding:10 width:50];
    [_grayView alignBetweenLeft:_greenView andRight:_blueView matchingTopWithLeftAndRightPadding:10 height:50];
    [_cyanView alignBetweenTop:_yellowView andBottom:_blueView matchingLeftWithTopAndBottomPadding:10 width:50];
}

@end
