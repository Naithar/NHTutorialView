//
//  NHTutorialView.h
//  Pods
//
//  Created by Sergey Minakov on 26.05.15.
//
//

#import <UIKit/UIKit.h>

@interface NHTutorialView : UIView

@property (nonatomic, readonly, strong) UIView *containerView;
@property (nonatomic, readonly, strong) UIImageView *pointerImageView;
@property (nonatomic, readonly, strong) UIImageView *imageView;
@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UILabel *descriptionLabel;
@property (nonatomic, readonly, strong) UIButton *closeButton;

- (void)showAtPoint:(CGPoint)point;
- (void)showAtPoint:(CGPoint)point animated:(BOOL)animated;
- (void)showAtPoint:(CGPoint)point animated:(BOOL)animated inView:(UIView*)view;
- (void)hide;

@end
