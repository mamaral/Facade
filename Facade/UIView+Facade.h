//
//  UIView+Facade.h
//  Facade
//
//  Created by Mike on 4/28/15.
//  Copyright (c) 2015 Mike Amaral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Facade)


#pragma mark - Frame Utilities

- (CGFloat)xMin;
- (CGFloat)xMax;
- (CGFloat)yMin;
- (CGFloat)yMax;
- (CGFloat)width;
- (CGFloat)height;


#pragma mark - Alignment Relative to Superview

#pragma mark - Fill superview

- (void)fillSuperview;
- (void)fillSuperviewWithLeftPadding:(CGFloat)left rightPadding:(CGFloat)right topPadding:(CGFloat)top bottomPadding:(CGFloat)bottom;


#pragma mark - Corner alignment

- (void)anchorTopLeftWithLeftPadding:(CGFloat)left topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)anchorTopRightWithRightPadding:(CGFloat)right topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)anchorBottomLeftWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)anchorBottomRightWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;


#pragma mark - Center alignment

- (void)anchorInCenterWithWidth:(CGFloat)width height:(CGFloat)height;
- (void)anchorCenterLeftWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height;
- (void)anchorCenterRightWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height;
- (void)anchorTopCenterWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)anchorBottomCenterWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;


#pragma mark - Filling width / height

- (void)anchorInCenterFillingWidthAndHeightWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom;
- (void)anchorTopCenterFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight topPadding:(CGFloat)top height:(CGFloat)height;
- (void)anchorBottomCenterFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight bottomPadding:(CGFloat)bottom height:(CGFloat)height;
- (void)anchorCenterLeftFillingHeightWithTopPadding:(CGFloat)top bottomPadding:(CGFloat)bottom leftPadding:(CGFloat)left width:(CGFloat)width;
- (void)anchorCenterRightFillingHeightWithTopPadding:(CGFloat)top bottomPadding:(CGFloat)bottom rightPadding:(CGFloat)right width:(CGFloat)width;


#pragma mark - Alignment Relative to Siblings

#pragma mark - To the right

- (void)alignToTheRightOf:(UIView *)view withLeftPadding:(CGFloat)left topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view fillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight topPadding:(CGFloat)top height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view matchingTopWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view matchingTopAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view matchingCenterWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view matchingCenterAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view matchingBottomWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheRightOf:(UIView *)view matchingBottomAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;


#pragma mark - To the left

- (void)alignToTheLeftOf:(UIView *)view fillingWidthAndHeightWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom;
- (void)alignToTheLeftOf:(UIView *)view matchingTopWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheLeftOf:(UIView *)view matchingTopAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignToTheLeftOf:(UIView *)view matchingCenterWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheLeftOf:(UIView *)view matchingCenterAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignToTheLeftOf:(UIView *)view matchingBottomWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height;
- (void)alignToTheLeftOf:(UIView *)view matchingBottomAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;


#pragma mark - Under

- (void)alignUnder:(UIView *)view withLeftPadding:(CGFloat)left topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)alignUnder:(UIView *)view withRightPadding:(CGFloat)right topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)alignUnder:(UIView *)view matchingLeftWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)alignUnder:(UIView *)view matchingLeftAndFillingWidthWithRightPadding:(CGFloat)right topPadding:(CGFloat)top height:(CGFloat)height;
- (void)alignUnder:(UIView *)view matchingCenterWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)alignUnder:(UIView *)view centeredFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight topPadding:(CGFloat)top height:(CGFloat)height;
- (void)alignUnder:(UIView *)view centeredFillingWidthAndHeightWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom;
- (void)alignUnder:(UIView *)view matchingRightWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;
- (void)alignUnder:(UIView *)view matchingRightAndFillingWidthWithLeftPadding:(CGFloat)left topPadding:(CGFloat)top height:(CGFloat)height;
- (void)alignUnder:(UIView *)view matchingLeftAndRightFillingHeightWithTopPadding:(CGFloat)top bottomPadding:(CGFloat)bottom;
- (void)alignUnder:(UIView *)view matchingLeftFillingWidthAndHeightWithRightPadding:(CGFloat)right topPadding:(CGFloat)top bottomPadding:(CGFloat)bottom;
- (void)alignUnder:(UIView *)view matchingLeftAndRightWithTopPadding:(CGFloat)top height:(CGFloat)height;


#pragma mark - Above

- (void)alignAbove:(UIView *)view withLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view withRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingLeftWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingLeftAndFillingWidthWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingCenterWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view fillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight bottomPadding:(CGFloat)bottom height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingRightWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingRightAndFillingWidthWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom height:(CGFloat)height;
- (void)alignAbove:(UIView *)view matchingLeftAndRightWithBottomPadding:(CGFloat)bottom height:(CGFloat)height;


#pragma mark - Between

- (void)alignBetweenLeft:(UIView *)leftView andRight:(UIView *)rightView matchingTopWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignBetweenLeft:(UIView *)leftView andRight:(UIView *)rightView matchingCenterWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height;
- (void)alignBetweenTop:(UIView *)topView andBottom:(UIView *)bottomView matchingLeftWithTopAndBottomPadding:(CGFloat)topAndBottom width:(CGFloat)width;
- (void)alignBetweenTop:(UIView *)topView andBottom:(UIView *)bottomView centeredWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom;

#pragma mark - Subview groups

#pragma mark - Horizontal

- (void)groupHorizontally:(NSArray *)subviews centeredUnderView:(UIView *)view topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height;
- (void)groupHorizontally:(NSArray *)views centeredFillingHeightWithSpacing:(CGFloat)spacing width:(CGFloat)width;
- (void)groupHorizontally:(NSArray *)subviews fillingWidthAndHeightWithTopAndBottomPadding:(CGFloat)topAndBottom spacing:(CGFloat)spacing;
- (void)groupHorizontally:(NSArray *)views fillingHeightWithLeftPadding:(CGFloat)left spacing:(CGFloat)spacing topAndBottomPadding:(CGFloat)topAndBottom width:(CGFloat)width;
- (void)groupHorizontally:(NSArray *)views fillingWidthWithBottomPadding:(CGFloat)bottom leftPadding:(CGFloat)left rightPadding:(CGFloat)right spacing:(CGFloat)spacing height:(CGFloat)height;

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

@end
