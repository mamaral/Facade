//
//  ProfileViewController.m
//  Facade
//
//  Created by Mike on 4/27/15.
//  Copyright (c) 2015 Mike Amaral. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIView+Facade.h"

static NSString * const kLabelFont = @"OpenSans-Semibold";

@interface ProfileViewController () {
    UIScrollView *_scrollView;

    UIImageView *_headerImageView;

    UIButton *_facebookButton;
    UIButton *_twitterButton;
    UIButton *_googleButton;
    UIButton *_pinterestButton;

    UIImageView *_avatarImageView;
    UILabel *_nameLabel;
    UILabel *_usernameLabel;
    UILabel *_bioLabel;
    UIButton *_followButton;

    UIButton *_messageButton;
    UIButton *_addButton;
    UIButton *_statsButton;

    UILabel *_messageLabel;
    UILabel *_addLabel;
    UILabel *_statsLabel;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:11/255.0 green:179/255.0 blue:252/255.0 alpha:1.0];;

    UILabel *titleLabel = [UILabel new];
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 NSFontAttributeName: [UIFont fontWithName:kLabelFont size:20.0],
                                 NSKernAttributeName: @4.0
                                 };

    titleLabel.attributedText = [[NSAttributedString alloc] initWithString:@"PROFILE" attributes:attributes];
    [titleLabel sizeToFit];

    self.navigationItem.titleView = titleLabel;

    [self setupSubviews];
}

- (void)setupSubviews {
    UIColor *componentColor = [UIColor colorWithRed:11/255.0 green:179/255.0 blue:252/255.0 alpha:1.0];

    _scrollView = [UIScrollView new];
    _scrollView.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:35/255.0 alpha:1.0];
    [self.view addSubview:_scrollView];

    _headerImageView = [UIImageView new];
    _headerImageView.image = [UIImage imageNamed:@"skyline.jpg"];
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImageView.clipsToBounds = YES;
    _headerImageView.userInteractionEnabled = YES;
    [_scrollView addSubview:_headerImageView];

    _facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_facebookButton setImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
    _facebookButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _facebookButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_headerImageView addSubview:_facebookButton];

    _twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_twitterButton setImage:[UIImage imageNamed:@"twitter"] forState:UIControlStateNormal];
    _twitterButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _twitterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_headerImageView addSubview:_twitterButton];

    _googleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_googleButton setImage:[UIImage imageNamed:@"google"] forState:UIControlStateNormal];
    _googleButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _googleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_headerImageView addSubview:_googleButton];

    _pinterestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_pinterestButton setImage:[UIImage imageNamed:@"pinterest"] forState:UIControlStateNormal];
    _pinterestButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _pinterestButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_headerImageView addSubview:_pinterestButton];

    _avatarImageView = [UIImageView new];
    _avatarImageView.image = [UIImage imageNamed:@"flying.jpg"];
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.layer.cornerRadius = 50;
    _avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarImageView.layer.borderWidth = 1.5;
    [_scrollView addSubview:_avatarImageView];

    _nameLabel = [UILabel new];
    _nameLabel.text = @"Mike Amaral";
    _nameLabel.font = [UIFont boldSystemFontOfSize:25];
    _nameLabel.attributedText = [self attributedSpacedStringFromString:@"Mike Amaral" withColor:[UIColor whiteColor] withFont:[UIFont fontWithName:kLabelFont size:25]];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:_nameLabel];

    _usernameLabel = [UILabel new];
    _usernameLabel.attributedText = [self attributedSpacedStringFromString:@"mamaral" withColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0] withFont:[UIFont fontWithName:kLabelFont size:17]];
    _usernameLabel.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:_usernameLabel];

    _bioLabel = [UILabel new];
    _bioLabel.text = @"\"I live for three things: programming binges, rapid caffeine ingestion, and vindication. I also maintain a few unhealthy relationships with a number of my READMEs.\"";
    _bioLabel.numberOfLines = 0;
    _bioLabel.textColor = [UIColor lightGrayColor];
    _bioLabel.font = [UIFont italicSystemFontOfSize:12];
    _bioLabel.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:_bioLabel];

    _followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_followButton setAttributedTitle:[self attributedSpacedStringFromString:@"FOLLOW" withColor:[UIColor whiteColor] withFont:[UIFont fontWithName:kLabelFont size:18]] forState:UIControlStateNormal];
    [_followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_followButton setBackgroundColor:componentColor];
    _followButton.layer.cornerRadius = 5;
    _followButton.layer.borderWidth = 1;
    _followButton.layer.borderColor = componentColor.CGColor;
    [_scrollView addSubview:_followButton];

    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    _addButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _addButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_scrollView addSubview:_addButton];

    UIColor *addColor = [UIColor colorWithRed:230/255.0 green:76/255.0 blue:60/255.0 alpha:1.0];
    _addLabel = [UILabel new];
    _addLabel.attributedText = [self attributedSpacedStringFromString:@"ADD" withColor:addColor withFont:[UIFont fontWithName:kLabelFont size:12]];
    _addLabel.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:_addLabel];

    _statsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_statsButton setImage:[UIImage imageNamed:@"stats"] forState:UIControlStateNormal];
    _statsButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _statsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_scrollView addSubview:_statsButton];

    UIColor *statsColor = [UIColor colorWithRed:236/255.0 green:148/255.0 blue:34/255.0 alpha:1.0];
    _statsLabel = [UILabel new];
    _statsLabel.attributedText = [self attributedSpacedStringFromString:@"STATS" withColor:statsColor withFont:[UIFont fontWithName:kLabelFont size:12]];
    _statsLabel.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:_statsLabel];

    _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_messageButton setImage:[UIImage imageNamed:@"messages"] forState:UIControlStateNormal];
    _messageButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    _messageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [_scrollView addSubview:_messageButton];

    UIColor *messageColor = [UIColor colorWithRed:42/255.0 green:177/255.0 blue:224/255.0 alpha:1.0];
    _messageLabel = [UILabel new];
    _messageLabel.attributedText = [self attributedSpacedStringFromString:@"MESSAGE" withColor:messageColor withFont:[UIFont fontWithName:kLabelFont size:12]];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:_messageLabel];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    [self layoutFacade];
}

- (void)layoutFacade {
    [_scrollView fillSuperview];

    [_headerImageView anchorTopCenterFillingWidthWithLeftAndRightPadding:0 topPadding:0 height:250];

    NSArray *shareButtons = @[_facebookButton, _twitterButton, _googleButton, _pinterestButton];
    [_headerImageView groupVertically:shareButtons centerRightWithRightPadding:7 spacing:7 width:45 height:45];

    [_avatarImageView alignUnder:_headerImageView matchingCenterWithTopPadding:-50 width:100 height:100];
    [_nameLabel alignUnder:_avatarImageView centeredFillingWidthWithLeftAndRightPadding:7 topPadding:14 height:28];
    [_usernameLabel alignUnder:_nameLabel centeredFillingWidthWithLeftAndRightPadding:7 topPadding:2 height:19];

    [_bioLabel sizeToFit];
    [_bioLabel alignUnder:_usernameLabel centeredFillingWidthWithLeftAndRightPadding:15 topPadding:10 height:CGRectGetHeight(_bioLabel.frame)];

    [_followButton alignUnder:_bioLabel matchingCenterWithTopPadding:20 width:250 height:44];

    [_scrollView groupHorizontally:@[_messageButton, _statsButton, _addButton] centeredUnderView:_followButton topPadding:30 spacing:40 width:60 height:60];
    [_messageLabel alignUnder:_messageButton matchingCenterWithTopPadding:7 width:80 height:13];
    [_statsLabel alignUnder:_statsButton matchingCenterWithTopPadding:7 width:80 height:13];
    [_addLabel alignUnder:_addButton matchingCenterWithTopPadding:7 width:80 height:13];

    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), MAX(CGRectGetHeight(self.view.frame), CGRectGetMaxY(_messageLabel.frame) + 20));
}

- (NSAttributedString *)attributedSpacedStringFromString:(NSString *)string withColor:(UIColor *)color withFont:(UIFont *)font {
    NSString *safeString = string ?: @"";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:safeString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, safeString.length)];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, safeString.length)];
    [attributedString addAttribute:NSKernAttributeName value:@(2.0) range:NSMakeRange(0, safeString.length)];
    return attributedString;
}

@end
