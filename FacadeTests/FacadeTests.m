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
    UIView *_containerView;

    UIView *_candidateView;

    UIView *_siblingView;
    UIView *_siblingView2;

    UIView *_groupView1;
    UIView *_groupView2;
    UIView *_groupView3;
    UIView *_groupView4;

    NSArray *_groupViews;
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

    _siblingView2 = [[UIView alloc] initWithFrame:CGRectZero];
    [_containerView addSubview:_siblingView2];

    _groupView1 = [UIView new];
    [_containerView addSubview:_groupView1];

    _groupView2 = [UIView new];
    [_containerView addSubview:_groupView2];

    _groupView3 = [UIView new];
    [_containerView addSubview:_groupView3];

    _groupView4 = [UIView new];
    [_containerView addSubview:_groupView4];

    _groupViews = @[_groupView1, _groupView2, _groupView3, _groupView4];
}

- (void)tearDown {
    _containerView = nil;

    _candidateView = nil;

    _siblingView = nil;
    _siblingView2 = nil;

    _groupView1 = nil;
    _groupView2 = nil;
    _groupView3 = nil;
    _groupView4 = nil;

    _groupViews = nil;

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

- (void)testAlignUnderMatchingLeftAndRightFillingHeight {
    [_candidateView alignUnder:_siblingView matchingLeftAndRightFillingHeightWithTopPadding:30 bottomPadding:30];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 430, 100, 540)));
}

- (void)testAlignUnderMatchingLeftFillingWidthAndHeight {
    [_candidateView alignUnder:_siblingView matchingLeftFillingWidthAndHeightWithRightPadding:20 topPadding:25 bottomPadding:20];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 425, 680, 555)));
}


#pragma mark - Above

- (void)testAlignAboveMatchingLeft {
    [_candidateView alignAbove:_siblingView matchingLeftWithBottomPadding:10 width:40 height:100];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 190, 40, 100)));
}

- (void)testAlignAboveMatchingLeftFillingWidth {
    [_candidateView alignAbove:_siblingView matchingLeftAndFillingWidthWithRightPadding:40 bottomPadding:20 height:30];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 250, 660, 30)));
}

- (void)testAlignAboveMatchingCenter {
    [_candidateView alignAbove:_siblingView matchingCenterWithBottomPadding:5 width:10 height:15];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(345, 280, 10, 15)));
}

- (void)testAlignAboveFillingWidth {
    [_candidateView alignAbove:_siblingView fillingWidthWithLeftAndRightPadding:10 bottomPadding:15 height:50];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(10, 235, 980, 50)));
}

- (void)testAlignAboveMatchingRight {
    [_candidateView alignAbove:_siblingView matchingRightWithBottomPadding:40 width:50 height:60];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(350, 200, 50, 60)));
}

- (void)testAlignAboveMatchingRightFillingWidth {
    [_candidateView alignAbove:_siblingView matchingRightAndFillingWidthWithLeftPadding:20 bottomPadding:20 height:120];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(20, 160, 380, 120)));
}


#pragma mark - Between

- (void)testAlignBetweenHorizontal {
    _siblingView2.frame = CGRectMake(900, 300, 50, 50);

    [_candidateView alignBetweenLeft:_siblingView andRight:_siblingView2 matchingTopWithLeftAndRightPadding:20 height:70];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(420, 300, 460, 70)));
}

- (void)testAlignBetweenVertical {
    _siblingView2.frame = CGRectMake(300, 800, 100, 80);

    [_candidateView alignBetweenTop:_siblingView andBottom:_siblingView2 matchingLeftWithTopAndBottomPadding:30 width:200];

    XCTAssertTrue(CGRectEqualToRect(_candidateView.frame, CGRectMake(300, 430, 200, 340)));
}


#pragma mark - Subview groups

#pragma mark - Horizontal

- (void)testGroupHorizontallyCenteredUnder {
    [_containerView groupHorizontally:_groupViews centeredUnderView:_siblingView topPadding:10 spacing:15 width:50 height:70];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(377.5, 410, 50, 70)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(442.5, 410, 50, 70)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(507.5, 410, 50, 70)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(572.50, 410, 50, 70)));
}

- (void)testGroupHorizontallyFillingHeight {
    [_containerView groupHorizontally:_groupViews fillingHeightWithLeftPadding:20 spacing:25 topAndBottomPadding:15 width:40];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(20, 15, 40, 970)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(85, 15, 40, 970)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(150, 15, 40, 970)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(215, 15, 40, 970)));
}


#pragma mark - Vertical

- (void)testGroupVerticallyUpperRight {
    [_containerView groupVertically:_groupViews inUpperRightWithRightPadding:10 topPadding:10 spacing:15 width:50 height:60];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(940, 10, 50, 60)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(940, 85, 50, 60)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(940, 160, 50, 60)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(940, 235, 50, 60)));
}

- (void)testGroupVerticallyCenterRight {
    [_containerView groupVertically:_groupViews centerRightWithRightPadding:20 spacing:10 width:40 height:50];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(940, 385, 40, 50)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(940, 445, 40, 50)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(940, 505, 40, 50)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(940, 565, 40, 50)));
}

- (void)testGroupVerticallyLowerRight {
    [_containerView groupVertically:_groupViews inLowerRightWithRightPadding:5 bottomPadding:100 spacing:20 width:100 height:20];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(895, 880, 100, 20)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(895, 840, 100, 20)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(895, 800, 100, 20)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(895, 760, 100, 20)));
}

- (void)testGroupVerticallyUpperLeft {
    [_containerView groupVertically:_groupViews inUpperLeftWithLeftPadding:7 topPadding:10 spacing:30 width:80 height:40];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(7, 10, 80, 40)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(7, 80, 80, 40)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(7, 150, 80, 40)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(7, 220, 80, 40)));
}

- (void)testGroupVerticallyCenterLeft {
    [_containerView groupVertically:_groupViews centerLeftWithLeftPadding:12 spacing:10 width:110 height:150];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(12, 185, 110, 150)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(12, 345, 110, 150)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(12, 505, 110, 150)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(12, 665, 110, 150)));
}

- (void)testGroupVerticallyLowerLeft {
    [_containerView groupVertically:_groupViews inLowerLeftWithLeftPadding:0 bottomPadding:0 spacing:5 width:10 height:10];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(0, 990, 10, 10)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(0, 975, 10, 10)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(0, 960, 10, 10)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(0, 945, 10, 10)));
}

- (void)testGroupVerticallyTopCenter {
    [_containerView groupVertically:_groupViews topCenterWithTopPadding:25 spacing:20 width:200 height:100];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(400, 25, 200, 100)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(400, 145, 200, 100)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(400, 265, 200, 100)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(400, 385, 200, 100)));
}

- (void)testGroupVerticallyCenter {
    [_containerView groupVertically:_groupViews centerWithSpacing:10 width:120 height:160];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(440, 165, 120, 160)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(440, 335, 120, 160)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(440, 505, 120, 160)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(440, 675, 120, 160)));
}

- (void)testGroupVerticallyBottomCenter {
    [_containerView groupVertically:_groupViews bottomCenterWithBottomPadding:100 spacing:100 width:200 height:15];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(400, 885, 200, 15)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(400, 770, 200, 15)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(400, 655, 200, 15)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(400, 540, 200, 15)));
}


#pragma mark - Grid

- (void)testGroupGrid {
    [_containerView groupGrid:_groupViews fillingWidthWithColumnCount:1 spacing:200];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(200, 200, 600, 600)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(200, 1000, 600, 600)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(200, 1800, 600, 600)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(200, 2600, 600, 600)));

    [_containerView groupGrid:_groupViews fillingWidthWithColumnCount:2 spacing:100];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(100, 100, 350, 350)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(550, 100, 350, 350)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(100, 550, 350, 350)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(550, 550, 350, 350)));

    [_containerView groupGrid:_groupViews fillingWidthWithColumnCount:3 spacing:55];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(55, 55, 260, 260)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(370, 55, 260, 260)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(685, 55, 260, 260)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(55, 370, 260, 260)));

    [_containerView groupGrid:_groupViews fillingWidthWithColumnCount:4 spacing:60];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(60, 60, 175, 175)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(295, 60, 175, 175)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(530, 60, 175, 175)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(765, 60, 175, 175)));

    [_containerView groupGrid:_groupViews fillingWidthWithColumnCount:5 spacing:10];

    XCTAssertTrue(CGRectEqualToRect(_groupView1.frame, CGRectMake(10, 10, 188, 188)));
    XCTAssertTrue(CGRectEqualToRect(_groupView2.frame, CGRectMake(208, 10, 188, 188)));
    XCTAssertTrue(CGRectEqualToRect(_groupView3.frame, CGRectMake(406, 10, 188, 188)));
    XCTAssertTrue(CGRectEqualToRect(_groupView4.frame, CGRectMake(604, 10, 188, 188)));
}

@end
