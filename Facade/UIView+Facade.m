//
//  UIView+Facade.m
//  Facade
//
//  Created by Mike on 4/28/15.
//  Copyright (c) 2015 Mike Amaral. All rights reserved.
//

#import "UIView+Facade.h"

@implementation UIView (Facade)


#pragma mark - Frame Utilities

- (CGFloat)xMin {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)xMax {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)yMin {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)yMax {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}


#pragma mark - Alignment Relative To Superview

#pragma mark - Fill superview

- (void)fillSuperview {
    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.superview.frame), CGRectGetHeight(self.superview.frame));
}

- (void)fillSuperviewWithLeftPadding:(CGFloat)left rightPadding:(CGFloat)right topPadding:(CGFloat)top bottomPadding:(CGFloat)bottom {
    CGFloat width = CGRectGetWidth(self.superview.frame) - (left + right);
    CGFloat height = CGRectGetHeight(self.superview.frame) - (top + bottom);

    self.frame = CGRectMake(left, top, width, height);
}

#pragma mark - Corner alignment

- (void)anchorTopLeftWithLeftPadding:(CGFloat)left topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(left, top, width, height);
}

- (void)anchorTopRightWithRightPadding:(CGFloat)right topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetWidth(self.superview.frame) - width - right, top, width, height);
}

- (void)anchorBottomLeftWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(left, CGRectGetHeight(self.superview.frame) - height - bottom, width, height);
}

- (void)anchorBottomRightWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetWidth(self.superview.frame) - width - right, CGRectGetHeight(self.superview.frame) - height - bottom, width, height);
}


#pragma mark - Center alignment

- (void)anchorInCenterWithWidth:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake((CGRectGetWidth(self.superview.frame) / 2.0) - (width / 2.0), (CGRectGetHeight(self.superview.frame) / 2.0) - (height / 2.0), width, height);
}

- (void)anchorCenterLeftWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(left, (CGRectGetHeight(self.superview.frame) / 2.0) - (height / 2.0), width, height);
}

- (void)anchorCenterRightWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetWidth(self.superview.frame) - width - right, (CGRectGetHeight(self.superview.frame) / 2.0) - (height / 2.0), width, height);
}

- (void)anchorTopCenterWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake((CGRectGetWidth(self.superview.frame) / 2.0) - (width / 2.0), top, width, height);
}

- (void)anchorBottomCenterWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake((CGRectGetWidth(self.superview.frame) / 2.0) - (width / 2.0), CGRectGetHeight(self.superview.frame) - height - bottom, width, height);
}


#pragma mark - Filling width / height

- (void)anchorInCenterFillingWidthAndHeightWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom {
    self.frame = CGRectMake(leftAndRight, topAndBottom, CGRectGetWidth(self.superview.frame) - (2 * leftAndRight), CGRectGetHeight(self.superview.frame) - (2 * topAndBottom));
}

- (void)anchorTopCenterFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight topPadding:(CGFloat)top height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, top, CGRectGetWidth(self.superview.frame) - (2 * leftAndRight), height);
}

- (void)anchorBottomCenterFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight bottomPadding:(CGFloat)bottom height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, CGRectGetHeight(self.superview.frame) - height - bottom, CGRectGetWidth(self.superview.frame) - (2 * leftAndRight), height);
}

- (void)anchorCenterLeftFillingHeightWithTopPadding:(CGFloat)top bottomPadding:(CGFloat)bottom leftPadding:(CGFloat)left width:(CGFloat)width {
    self.frame = CGRectMake(left, top, width, CGRectGetHeight(self.superview.frame) - top - bottom);
}

- (void)anchorCenterRightFillingHeightWithTopPadding:(CGFloat)top bottomPadding:(CGFloat)bottom rightPadding:(CGFloat)right width:(CGFloat)width {
    self.frame = CGRectMake(CGRectGetWidth(self.superview.frame) - right - width, top, width, CGRectGetHeight(self.superview.frame) - top - bottom);
}

#pragma mark - Alignment Relative to Siblings

#pragma mark - To the right

- (void)alignToTheRightOf:(UIView *)view withLeftPadding:(CGFloat)left topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + left, top, width, height);
}

- (void)alignToTheRightOf:(UIView *)view fillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight topPadding:(CGFloat)top height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + leftAndRight, top, CGRectGetWidth(self.superview.frame) - CGRectGetMaxX(view.frame) - (2 * leftAndRight), height);
}

- (void)alignToTheRightOf:(UIView *)view matchingTopWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + left, CGRectGetMinY(view.frame), width, height);
}

- (void)alignToTheRightOf:(UIView *)view matchingTopAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + leftAndRight, CGRectGetMinY(view.frame), CGRectGetWidth(view.superview.frame) - CGRectGetMaxX(view.frame) - (2 * leftAndRight), height);
}

- (void)alignToTheRightOf:(UIView *)view matchingCenterWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + left, CGRectGetMidY(view.frame) - (height / 2.0), width, height);
}

- (void)alignToTheRightOf:(UIView *)view matchingCenterAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + leftAndRight, CGRectGetMidY(view.frame) - (height / 2.0), CGRectGetWidth(view.superview.frame) - CGRectGetMaxX(view.frame) - (2 * leftAndRight), height);
}

- (void)alignToTheRightOf:(UIView *)view matchingBottomWithLeftPadding:(CGFloat)left width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + left, CGRectGetMaxY(view.frame) - height, width, height);
}

- (void)alignToTheRightOf:(UIView *)view matchingBottomAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) + leftAndRight, CGRectGetMaxY(view.frame) - height, CGRectGetWidth(view.superview.frame) - CGRectGetMaxX(view.frame) - (2 * leftAndRight), height);
}


#pragma mark - To the left

- (void)alignToTheLeftOf:(UIView *)view fillingWidthAndHeightWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom {
    self.frame = CGRectMake(leftAndRight, topAndBottom, CGRectGetMinX(view.frame) - (2 * leftAndRight), CGRectGetHeight(self.superview.frame) - (2 * topAndBottom));
}

- (void)alignToTheLeftOf:(UIView *)view matchingTopWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame) - width - right, CGRectGetMinY(view.frame), width, height);
}

- (void)alignToTheLeftOf:(UIView *)view matchingTopAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, CGRectGetMinY(view.frame), CGRectGetMinX(view.frame) - (2 * leftAndRight), height);
}

- (void)alignToTheLeftOf:(UIView *)view matchingCenterWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame) - width - right, CGRectGetMidY(view.frame) - (height / 2.0), width, height);
}

- (void)alignToTheLeftOf:(UIView *)view matchingCenterAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, CGRectGetMidY(view.frame) - (height / 2.0), CGRectGetMinX(view.frame) - (2 * leftAndRight), height);
}

- (void)alignToTheLeftOf:(UIView *)view matchingBottomWithRightPadding:(CGFloat)right width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame) - width - right, CGRectGetMaxY(view.frame) - height, width, height);
}

- (void)alignToTheLeftOf:(UIView *)view matchingBottomAndFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, CGRectGetMaxY(view.frame) - height, CGRectGetMinX(view.frame) - (2 * leftAndRight), height);
}


#pragma mark - Under

- (void)alignUnder:(UIView *)view withLeftPadding:(CGFloat)left topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(left, CGRectGetMaxY(view.frame) + top, width, height);
}

- (void)alignUnder:(UIView *)view withRightPadding:(CGFloat)right topPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(self.superview.frame) - width - right, CGRectGetMaxY(view.frame) + top, width, height);
}

- (void)alignUnder:(UIView *)view matchingLeftWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMaxY(view.frame) + top, width, height);
}

- (void)alignUnder:(UIView *)view matchingLeftAndFillingWidthWithRightPadding:(CGFloat)right topPadding:(CGFloat)top height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMaxY(view.frame) + top, CGRectGetWidth(view.superview.frame) - CGRectGetMinX(view.frame) - right, height);
}

- (void)alignUnder:(UIView *)view matchingCenterWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMidX(view.frame) - (width / 2.0), CGRectGetMaxY(view.frame) + top, width, height);
}

- (void)alignUnder:(UIView *)view centeredFillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight topPadding:(CGFloat)top height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, CGRectGetMaxY(view.frame) + top, CGRectGetWidth(view.superview.frame) - (2 * leftAndRight), height);
}

- (void)alignUnder:(UIView *)view centeredFillingWidthAndHeightWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom {
    self.frame = CGRectMake(leftAndRight, CGRectGetMaxY(view.frame) + topAndBottom, CGRectGetWidth(view.superview.frame) - (2 * leftAndRight), CGRectGetHeight(self.superview.frame) - CGRectGetMaxY(view.frame) - topAndBottom - topAndBottom);
}

- (void)alignUnder:(UIView *)view matchingRightWithTopPadding:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) - width, CGRectGetMaxY(view.frame) + top, width, height);
}

- (void)alignUnder:(UIView *)view matchingRightAndFillingWidthWithLeftPadding:(CGFloat)left topPadding:(CGFloat)top height:(CGFloat)height {
    self.frame = CGRectMake(left, CGRectGetMaxY(view.frame) + top, CGRectGetMinX(view.frame) + CGRectGetWidth(view.frame) - left, height);
}

- (void)alignUnder:(UIView *)view matchingLeftAndRightFillingHeightWithTopPadding:(CGFloat)top bottomPadding:(CGFloat)bottom {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMaxY(view.frame) + top, CGRectGetWidth(view.frame), CGRectGetHeight(self.superview.frame) - CGRectGetMaxY(view.frame) - top - bottom);
}

- (void)alignUnder:(UIView *)view matchingLeftFillingWidthAndHeightWithRightPadding:(CGFloat)right topPadding:(CGFloat)top bottomPadding:(CGFloat)bottom {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMaxY(view.frame) + top, CGRectGetWidth(self.superview.frame) - CGRectGetMinX(view.frame) - right, CGRectGetHeight(self.superview.frame) - CGRectGetMaxY(view.frame) - top - bottom);
}

- (void)alignUnder:(UIView *)view matchingLeftAndRightWithTopPadding:(CGFloat)top height:(CGFloat)height
{
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMaxY(view.frame) + top, CGRectGetWidth(view.frame), height);
}


#pragma mark - Above

- (void)alignAbove:(UIView *)view withLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(left, CGRectGetMinY(view.frame) - height - bottom, width, height);
}

- (void)alignAbove:(UIView *)view withRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(self.superview.frame) - width - right, CGRectGetMinY(view.frame) - height - bottom, width, height);
}

- (void)alignAbove:(UIView *)view matchingLeftWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMinY(view.frame) - height - bottom, width, height);
}

- (void)alignAbove:(UIView *)view matchingLeftAndFillingWidthWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMinY(view.frame) - height - bottom, CGRectGetWidth(view.superview.frame) - CGRectGetMinX(view.frame) - right, height);
}

- (void)alignAbove:(UIView *)view matchingCenterWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMidX(view.frame) - (width / 2.0), CGRectGetMinY(view.frame) - height - bottom, width, height);
}

- (void)alignAbove:(UIView *)view fillingWidthWithLeftAndRightPadding:(CGFloat)leftAndRight bottomPadding:(CGFloat)bottom height:(CGFloat)height {
    self.frame = CGRectMake(leftAndRight, CGRectGetMinY(view.frame) - height - bottom, CGRectGetWidth(view.superview.frame) - (2 * leftAndRight), height);
}

- (void)alignAbove:(UIView *)view matchingRightWithBottomPadding:(CGFloat)bottom width:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMaxX(view.frame) - width, CGRectGetMinY(view.frame) - height - bottom, width, height);
}

- (void)alignAbove:(UIView *)view matchingRightAndFillingWidthWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom height:(CGFloat)height {
    self.frame = CGRectMake(left, CGRectGetMinY(view.frame) - height - bottom, CGRectGetMinX(view.frame) + CGRectGetWidth(view.frame) - left, height);
}

- (void)alignAbove:(UIView *)view matchingLeftAndRightWithBottomPadding:(CGFloat)bottom height:(CGFloat)height {
    self.frame = CGRectMake(CGRectGetMinX(view.frame), CGRectGetMinY(view.frame) - bottom - height, CGRectGetWidth(view.frame), height);
}


#pragma mark - Between

- (void)alignBetweenLeft:(UIView *)leftView andRight:(UIView *)rightView matchingTopWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    CGFloat xOrigin = CGRectGetMaxX(leftView.frame) + leftAndRight;
    self.frame = CGRectMake(xOrigin, CGRectGetMinY(leftView.frame), CGRectGetWidth(self.superview.frame) - xOrigin - (CGRectGetWidth(self.superview.frame) - CGRectGetMinX(rightView.frame)) - leftAndRight, height);
}

- (void)alignBetweenLeft:(UIView *)leftView andRight:(UIView *)rightView matchingCenterWithLeftAndRightPadding:(CGFloat)leftAndRight height:(CGFloat)height {
    CGFloat xOrigin = CGRectGetMaxX(leftView.frame) + leftAndRight;
    self.frame = CGRectMake(xOrigin, CGRectGetMidY(leftView.frame) - (height / 2.0), CGRectGetWidth(self.superview.frame) - xOrigin - (CGRectGetWidth(self.superview.frame) - CGRectGetMinX(rightView.frame)) - leftAndRight, height);
}

- (void)alignBetweenTop:(UIView *)topView andBottom:(UIView *)bottomView matchingLeftWithTopAndBottomPadding:(CGFloat)topAndBottom width:(CGFloat)width {
    CGFloat yOrigin = CGRectGetMaxY(topView.frame) + topAndBottom;
    self.frame = CGRectMake(CGRectGetMinX(topView.frame), CGRectGetMaxY(topView.frame) + topAndBottom, width, CGRectGetHeight(self.superview.frame) - yOrigin - (CGRectGetHeight(self.superview.frame) - CGRectGetMinY(bottomView.frame)) - topAndBottom);
}

- (void)alignBetweenTop:(UIView *)topView andBottom:(UIView *)bottomView centeredWithLeftAndRightPadding:(CGFloat)leftAndRight topAndBottomPadding:(CGFloat)topAndBottom {
    self.frame = CGRectMake(leftAndRight, CGRectGetMaxY(topView.frame) + topAndBottom, CGRectGetWidth(self.superview.frame) - (2 * leftAndRight), CGRectGetMinY(bottomView.frame) - CGRectGetMaxY(topView.frame) - (2 * topAndBottom));
}


#pragma mark - Subview groups

#pragma mark - Horizontal

- (void)groupHorizontally:(NSArray *)views centeredUnderView:(UIView *)view topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat xOrigin = (CGRectGetWidth(self.frame) - (views.count * width) - ((views.count - 1) * spacing)) / 2.0;

    for (UIView *subview in views) {
        subview.frame = CGRectMake(xOrigin, CGRectGetMaxY(view.frame) + top, width, height);

        xOrigin += width + spacing;
    }
}

- (void)groupHorizontally:(NSArray *)views centeredFillingHeightWithSpacing:(CGFloat)spacing width:(CGFloat)width {
    CGFloat xOrigin = (CGRectGetWidth(self.frame) - (views.count * width) - ((views.count - 1) * spacing)) / 2.0;

    for (UIView *subview in views) {
        subview.frame = CGRectMake(xOrigin, 0, width, self.height);

        xOrigin += width + spacing;
    }
}

- (void)groupHorizontally:(NSArray *)subviews fillingWidthAndHeightWithTopAndBottomPadding:(CGFloat)topAndBottom spacing:(CGFloat)spacing {
    NSInteger subviewCount = subviews.count;
    CGFloat width = (CGRectGetWidth(self.frame) - ((subviewCount + 1) * spacing)) / (CGFloat)subviewCount;
    CGFloat height = CGRectGetHeight(self.frame) - (2 * topAndBottom);
    CGFloat xOrigin = spacing;

    for (UIView *subview in subviews) {
        subview.frame = CGRectMake(xOrigin, topAndBottom, width, height);

        xOrigin += width + spacing;
    }
}

- (void)groupHorizontally:(NSArray *)views fillingHeightWithLeftPadding:(CGFloat)left spacing:(CGFloat)spacing topAndBottomPadding:(CGFloat)topAndBottom width:(CGFloat)width {
    CGFloat xOrigin = left;
    CGFloat height = CGRectGetHeight(self.frame) - (2 * topAndBottom);

    for (UIView *subview in views) {
        subview.frame = CGRectMake(xOrigin, topAndBottom, width, height);

        xOrigin += width + spacing;
    }
}

- (void)groupHorizontally:(NSArray *)views fillingWidthWithBottomPadding:(CGFloat)bottom leftPadding:(CGFloat)left rightPadding:(CGFloat)right spacing:(CGFloat)spacing height:(CGFloat)height {
    CGFloat xOrigin = left;
    CGFloat yOrigin = CGRectGetHeight(self.frame) - bottom - height;
    CGFloat width = (CGRectGetWidth(self.frame) - (views.count - 1) * spacing - left - right) / views.count;
    
    for (UIView *subview in views) {
        subview.frame = CGRectMake(xOrigin, yOrigin, width, height);
        xOrigin += width + spacing;
    }
}


#pragma mark - Vertical

- (void)groupVertically:(NSArray *)subviews inUpperRightWithRightPadding:(CGFloat)right topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = top;

    for (UIView *view in subviews) {
        view.frame = CGRectMake(CGRectGetWidth(self.frame) - width - right, yOrigin, width, height);

        yOrigin += height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews centerRightWithRightPadding:(CGFloat)right spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = (CGRectGetHeight(self.frame) - (subviews.count * height) - ((subviews.count - 1) * spacing)) / 2.0;

    for (UIView *view in subviews) {
        view.frame = CGRectMake(CGRectGetWidth(self.frame) - width - right, yOrigin, width, height);

        yOrigin += height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews inLowerRightWithRightPadding:(CGFloat)right bottomPadding:(CGFloat)bottom spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = CGRectGetHeight(self.frame) - height - bottom;

    for (UIView *view in subviews) {
        view.frame = CGRectMake(CGRectGetWidth(self.frame) - width - right, yOrigin, width, height);

        yOrigin -= height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews inUpperLeftWithLeftPadding:(CGFloat)left topPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = top;

    for (UIView *view in subviews) {
        view.frame = CGRectMake(left, yOrigin, width, height);

        yOrigin += height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews centerLeftWithLeftPadding:(CGFloat)left spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = (CGRectGetHeight(self.frame) - (subviews.count * height) - ((subviews.count - 1) * spacing)) / 2.0;

    for (UIView *view in subviews) {
        view.frame = CGRectMake(left, yOrigin, width, height);

        yOrigin += height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews inLowerLeftWithLeftPadding:(CGFloat)left bottomPadding:(CGFloat)bottom spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = CGRectGetHeight(self.frame) - height - bottom;

    for (UIView *view in subviews) {
        view.frame = CGRectMake(left, yOrigin, width, height);

        yOrigin -= height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews topCenterWithTopPadding:(CGFloat)top spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = top;

    for (UIView *view in subviews) {
        view.frame = CGRectMake((CGRectGetWidth(self.frame) / 2.0) - (width / 2.0), yOrigin, width, height);

        yOrigin += height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews centerWithSpacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = (CGRectGetHeight(self.frame) - (subviews.count * height) - ((subviews.count - 1) * spacing)) / 2.0;

    for (UIView *view in subviews) {
        view.frame = CGRectMake((CGRectGetWidth(self.frame) / 2.0) - (width / 2.0), yOrigin, width, height);

        yOrigin += height + spacing;
    }
}

- (void)groupVertically:(NSArray *)subviews bottomCenterWithBottomPadding:(CGFloat)bottom spacing:(CGFloat)spacing width:(CGFloat)width height:(CGFloat)height {
    CGFloat yOrigin = CGRectGetHeight(self.frame) - height - bottom;

    for (UIView *view in subviews) {
        view.frame = CGRectMake((CGRectGetWidth(self.frame) / 2.0) - (width / 2.0), yOrigin, width, height);

        yOrigin -= height + spacing;
    }
}


#pragma mark - Grid

- (void)groupGrid:(NSArray *)subviews fillingWidthWithColumnCount:(NSUInteger)columnCount spacing:(CGFloat)spacing {
    NSUInteger currentColumn = 0;
    CGFloat xOrigin = spacing;
    CGFloat yOrigin = spacing;
    CGFloat size = (CGRectGetWidth(self.frame) - ((columnCount + 1) * spacing)) / (CGFloat)columnCount;
    CGFloat offset = size + spacing;

    for (UIView *subview in subviews) {
        subview.frame = CGRectMake(xOrigin, yOrigin, size, size);

        if (currentColumn == columnCount - 1) {
            currentColumn = 0;

            xOrigin = spacing;
            yOrigin += offset;
        }

        else {
            currentColumn++;

            xOrigin += offset;
        }
    }
}

@end
