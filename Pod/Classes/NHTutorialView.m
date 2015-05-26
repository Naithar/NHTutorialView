//
//  NHTutorialView.m
//  Pods
//
//  Created by Sergey Minakov on 26.05.15.
//
//

#import "NHTutorialView.h"

@interface NHTutorialView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *pointerImageView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation NHTutorialView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor redColor];
    
    self.pointerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.pointerImageView.backgroundColor = [UIColor darkGrayColor];
    self.pointerImageView.contentMode = UIViewContentModeTop;
    [self addSubview:self.pointerImageView];
    
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.layer.cornerRadius = 15;
    self.containerView.clipsToBounds = YES;
    [self addSubview:self.containerView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 35, 35)];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.containerView addSubview:self.imageView];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 35, 35)];
    self.closeButton.backgroundColor = [UIColor greenColor];
    [self.closeButton addTarget:self action:@selector(closeButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:self.closeButton];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"title";
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.backgroundColor = [UIColor lightGrayColor];
    [self.containerView addSubview:self.titleLabel];
    
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = @"decsription";
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail | NSLineBreakByWordWrapping;
    self.descriptionLabel.backgroundColor = [UIColor lightGrayColor];
    [self.containerView addSubview:self.descriptionLabel];
}

- (void)closeButtonTouch:(id)sender {
    [self hide];
}

- (void)showAtPoint:(CGPoint)point {
    [self showAtPoint:point animated:NO];
}

- (void)showAtPoint:(CGPoint)point animated:(BOOL)animated {
    [self showAtPoint:point animated:animated inView:self.superview];
}

- (void)showAtPoint:(CGPoint)point animated:(BOOL)animated inView:(UIView*)view {
    if ((view != self.superview
        || !self.superview)
        && view) {
        [self removeFromSuperview];
        
        [view addSubview:self];
    }
    
    CGRect frame = self.frame;
    frame.origin.y = point.y - frame.size.height - 5;
    self.frame = frame;
    
    CGRect pointerFrame = self.pointerImageView.frame;
    pointerFrame.origin.y = self.frame.size.height - pointerFrame.size.height;
    pointerFrame.origin.x = point.x - (pointerFrame.size.width / 2) - self.frame.origin.x;
    self.pointerImageView.frame = pointerFrame;
    
    CGRect containerFrame = self.bounds;
    containerFrame.size.height -= self.pointerImageView.frame.size.height;
    self.containerView.frame = containerFrame;
    
    CGRect closeButtonFrame = self.closeButton.frame;
    closeButtonFrame.origin.y = 10;
    closeButtonFrame.origin.x = self.containerView.frame.size.width - 40;
    self.closeButton.frame = closeButtonFrame;
    
    CGRect titleLabelFrame = CGRectZero;
    titleLabelFrame.origin.x = 45;
    titleLabelFrame.origin.y = 5;
    titleLabelFrame.size.height = 25;
    titleLabelFrame.size.width = self.containerView.frame.size.width - 90;
    self.titleLabel.frame = titleLabelFrame;
    
    CGRect descriptionLabelFrame = CGRectZero;
    descriptionLabelFrame.origin.y = 30;
    descriptionLabelFrame.origin.x = 45;
    descriptionLabelFrame.size.width = self.containerView.frame.size.width - 90;
    descriptionLabelFrame.size.height = self.containerView.frame.size.height - 35;
    self.descriptionLabel.frame = descriptionLabelFrame;
}

- (void)hide {
    [self removeFromSuperview];
}

@end
