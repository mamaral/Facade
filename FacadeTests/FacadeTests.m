//
//  FacadeTests.m
//  FacadeTests
//
//  Created by Mike on 4/27/15.
//  Copyright (c) 2015 Mike Amaral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UIView+Facade.h"

@interface FacadeTests : XCTestCase {
    UIView *_candidateView;
    UIView *_containerView;
    UIView *_siblingView;
}

@end

@implementation FacadeTests

- (void)setUp {
    [super setUp];

    _candidateView = [UIView new];

    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    [_containerView addSubview:_candidateView];

    _siblingView = [[UIView alloc] initWithFrame:CGRectMake(300, 300, 100, 100)];
    [_containerView addSubview:_siblingView];
}

- (void)tearDown {
    _candidateView = nil;
    _containerView = nil;
    _siblingView = nil;

    [super tearDown];
}


#pragma mark - Alignment Relative to Superview

#pragma mark - Fill superview

- (void)testFillSuperview {
    [_candidateView fillSuperview];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(0, 0, 1000, 1000)));
}


#pragma mark - Corner alignment

- (void)testTopLeft {
    [_candidateView anchorTopLeftWithLeftPadding:20 topPadding:30 width:100 height:200];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(20, 30, 100, 200)));
}

- (void)testTopRight {
    [_candidateView anchorTopRightWithRightPadding:20 topPadding:30 width:100 height:200];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(880, 30, 100, 200)));
}

- (void)testBottomLeft {
    [_candidateView anchorBottomLeftWithLeftPadding:40 bottomPadding:20 width:20 height:100];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(40, 880, 20, 100)));
}

- (void)testBottomRight {
    [_candidateView anchorBottomRightWithRightPadding:50 bottomPadding:80 width:150 height:75];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(800, 845, 150, 75)));
}


#pragma mark - Center alignment

- (void)testAnchorInCenter {
    [_candidateView anchorInCenterWithWidth:400 height:770];

    XCTAssertTrue(CGSizeEqualToSize(_candidateView.frame.size, CGSizeMake(400, 770)));
    XCTAssertTrue(CGPointEqualToPoint(_candidateView.center, _containerView.center));
}

- (void)testAnchorCenterLeft {
    [_candidateView anchorCenterLeftWithLeftPadding:40 width:100 height:300];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(40, 350, 100, 300)));
}

- (void)testAnchorCenterRight {
    [_candidateView anchorCenterRightWithRightPadding:10 width:300 height:240];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(690, 380, 300, 240)));
}

- (void)testAnchorTopCenter {
    [_candidateView anchorTopCenterWithTopPadding:70 width:400 height:20];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 70, 400, 20)));
}

- (void)testAnchorBottomCenter {
    [_candidateView anchorBottomCenterWithBottomPadding:40 width:40 height:25];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(480, 935, 40, 25)));
}


#pragma mark - Filling width / height

- (void)testCenterFillingWidthAndHeight {
    [_candidateView anchorInCenterFillingWidthAndHeightWithLeftAndRightPadding:40 topAndBottomPadding:99];

    XCTAssertTrue(CGSizeEqualToSize(_candidateView.frame.size, CGSizeMake(920, 802)));
    XCTAssertTrue(CGPointEqualToPoint(_candidateView.center, _containerView.center));
}

- (void)testTopCenterFillingWidth {
    [_candidateView anchorTopCenterFillingWidthWithLeftAndRightPadding:70 topPadding:30 height:44];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(70, 30, 860, 44)));
}

- (void)testBottomCenterFillingWidth {
    [_candidateView anchorBottomCenterFillingWidthWithLeftAndRightPadding:10 bottomPadding:100 height:111];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(10, 789, 980, 111)));
}

#pragma mark - Alignment Relative to Siblings

#pragma mark - To the right

- (void)testAlignToTheRightMatchingTop {
    [_candidateView alignToTheRightOf:_siblingView matchingTopWithLeftPadding:10 width:50 height:60];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(410, 300, 50, 60)));
}

- (void)testAlignToTheRightMatchingTopFillingWidth {
    [_candidateView alignToTheRightOf:_siblingView matchingTopAndFillingWidthWithLeftAndRightPadding:20 height:70];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(420, 300, 560, 70)));
}

- (void)testAlignToTheRightMatchingCenter {
    [_candidateView alignToTheRightOf:_siblingView matchingCenterWithLeftPadding:15 width:75 height:32];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(415, 334, 75, 32)));
}

- (void)testAlignToTheRightMatchingCenterFillingWidth {
    [_candidateView alignToTheRightOf:_siblingView matchingCenterAndFillingWidthWithLeftAndRightPadding:10 height:100];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(410, 300, 580, 100)));
}

- (void)testAlignToTheRightMatchingBottom {
    [_candidateView alignToTheRightOf:_siblingView matchingBottomWithLeftPadding:30 width:30 height:40];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(430, 360, 30, 40)));
}

- (void)testAlignToTheRightMatchingBottomFillingWidth {
    [_candidateView alignToTheRightOf:_siblingView matchingBottomAndFillingWidthWithLeftAndRightPadding:10 height:115];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(410, 285, 580, 115)));
}


#pragma mark - To the left

- (void)testAlignToTheLeftMatchingTop {
    [_candidateView alignToTheLeftOf:_siblingView matchingTopWithRightPadding:10 width:45 height:70];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(245, 300, 45, 70)));
}

- (void)testAlignToTheLeftMatchingTopFillingWidth {
    [_candidateView alignToTheLeftOf:_siblingView matchingTopAndFillingWidthWithLeftAndRightPadding:25 height:75];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(25, 300, 250, 75)));
}

- (void)testAlignToTheLeftMatchingCenter {
    [_candidateView alignToTheLeftOf:_siblingView matchingCenterWithRightPadding:20 width:66 height:44];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(214, 328, 66, 44)));
}

- (void)testAlignToTheLeftMatchingCenterFillingWidth {
    [_candidateView alignToTheLeftOf:_siblingView matchingCenterAndFillingWidthWithLeftAndRightPadding:10 height:100];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(10, 300, 280, 100)));
}

- (void)testAlignToTheLeftMatchingBottom {
    [_candidateView alignToTheLeftOf:_siblingView matchingBottomWithRightPadding:40 width:70 height:140];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(190, 260, 70, 140)));
}

- (void)testAlignToTheLeftMatchingBottomFillingWidth {
    [_candidateView alignToTheLeftOf:_siblingView matchingBottomAndFillingWidthWithLeftAndRightPadding:110 height:15];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(110, 385, 80, 15)));
}


#pragma mark - Under

- (void)testAlignUnderWithLeftPadding {
    [_candidateView alignUnder:_siblingView withLeftPadding:10 topPadding:20 width:50 height:100];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(10, 420, 50, 100)));
}

- (void)testAlignUnderWithRightPadding {
    [_candidateView alignUnder:_siblingView withRightPadding:20 topPadding:50 width:30 height:80];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(950, 450, 30, 80)));
}

- (void)testAlignUnderMatchingLeft {
    [_candidateView alignUnder:_siblingView matchingLeftWithTopPadding:5 width:15 height:15];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 405, 15, 15)));
}

- (void)testAlignUnderMatchingLeftFillingWidth {
    [_candidateView alignUnder:_siblingView matchingLeftAndFillingWidthWithRightPadding:40 topPadding:10 height:45];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 410, 660, 45)));
}

- (void)testAlignUnderMatchingCenter {
    [_candidateView alignUnder:_siblingView matchingCenterWithTopPadding:5 width:44 height:45];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(328, 405, 44, 45)));
}

- (void)testCenteredFillingWidth {
    [_candidateView alignUnder:_siblingView centeredFillingWidthWithLeftAndRightPadding:20 topPadding:25 height:30];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(20, 425, 960, 30)));
}

- (void)testCenteredFillingWidthAndHeight {
    [_candidateView alignUnder:_siblingView centeredFillingWidthAndHeightWithLeftAndRightPadding:15 topAndBottomPadding:50];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(15, 450, 970, 500)));
}

- (void)testAlignUnderMatchingRight {
    [_candidateView alignUnder:_siblingView matchingRightWithTopPadding:12 width:40 height:75];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(360, 412, 40, 75)));
}

- (void)testAlignUnderMatchingRightFillingWidth {
    [_candidateView alignUnder:_siblingView matchingRightAndFillingWidthWithLeftPadding:10 topPadding:10 height:110];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(10, 410, 390, 110)));
}

- (void)testMatchingLeftAndRightFillingHeight {
    [_candidateView alignUnder:_siblingView matchingLeftAndRightFillingHeightWithTopPadding:30 bottomPadding:30];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 430, 100, 540)));
}

- (void)testMatchingLeftFillingWidthAndHeight {
    [_candidateView alignUnder:_siblingView matchingLeftFillingWidthAndHeightWithRightPadding:20 topPadding:25 bottomPadding:20];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 425, 680, 555)));
}


/*

 TODO:

#pragma mark - Above

- (void)alignAbove:(UIView *)view matchingLeftWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingLeftAndFillingWidthWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingCenterWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingRightWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingRightAndFillingWidthWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom height:(CGFloat)height;


#pragma mark - Between

- (void)alignBetweenLeft:(UIView *)leftView andRight:(UIView *)rightView matchingTopWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignBetweenTop:(UIView *)topView andBottom:(UIView *)bottomView matchingLeftWithTopAndBottomPadding:(CGFloat)topAndBottom width:(CGFloat)width;

#pragma mark - Subview groups

#pragma mark - Horizontal

- (void)groupHorizontally:(NSArray *)subviews centeredUnderView:(UIView *)view topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;

#pragma mark - Vertical

- (void)groupVertically:(NSArray *)subviews inUpperRightWithRightPadding:(CGFloat)right topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupVertically:(NSArray *)subviews centerRightWithRightPadding:(CGFloat)right spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupVertically:(NSArray *)subviews inLowerRightWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;

- (void)groupVertically:(NSArray *)subviews inUpperLeftWithLeftPadding:(CGFloat)left topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupVertically:(NSArray *)subviews centerLeftWithLeftPadding:(CGFloat)left spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupVertically:(NSArray *)subviews inLowerLeftWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;

- (void)groupVertically:(NSArray *)subviews topCenterWithTopPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupVertically:(NSArray *)subviews centerWithSpacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupVertically:(NSArray *)subviews bottomCenterWithBottomPadding:(CGFloat)bottom spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;

 #pragma mark - Grid

 - (void)groupGrid:(NSArray *)subviews fillingWidthWithColumnCount:(NSUInteger)columnCount spacing:(CGFloat)spacing;
*/

@end
