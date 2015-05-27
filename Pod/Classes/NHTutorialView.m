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
    self.backgroundColor = [UIColor clearColor];
    
    self.pointerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.pointerImageView.backgroundColor = [UIColor whiteColor];
    self.pointerImageView.contentMode = UIViewContentModeTop;
    [self addSubview:self.pointerImageView];
    
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.layer.cornerRadius = 12.5;
    self.containerView.clipsToBounds = YES;
    [self addSubview:self.containerView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 35, 35)];
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.contentMode = UIViewContentModeCenter;
    [self.containerView addSubview:self.imageView];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 15, 35, 35)];
    [self.closeButton setTitle:@"x" forState:UIControlStateNormal];
    self.closeButton.backgroundColor = [UIColor whiteColor];
    [self.closeButton addTarget:self action:@selector(closeButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton.imageView.contentMode = UIViewContentModeTopRight;
    self.closeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.closeButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    [self.containerView addSubview:self.closeButton];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"title_a\ntitle_b sadas dsa as asd a";
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail | NSLineBreakByWordWrapping;
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    [self.containerView addSubview:self.titleLabel];
    
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = @"decsription\na\nb\nc";
    self.descriptionLabel.numberOfLines = 5;
    self.descriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail | NSLineBreakByWordWrapping;
    self.descriptionLabel.backgroundColor = [UIColor whiteColor];
    [self.containerView addSubview:self.descriptionLabel];
}

- (void)closeButtonTouch:(id)sender {
    [self hide];
}

- (void)setContainerBackgroundColor:(UIColor*)color {
    self.containerView.backgroundColor = color;
    self.closeButton.backgroundColor = color;
    self.titleLabel.backgroundColor = color;
    self.descriptionLabel.backgroundColor = color;
    self.imageView.backgroundColor = color;
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
    
    CGFloat offsetHeight = 20;
    CGFloat labelWidth = self.frame.size.width - 110;
    
    CGFloat titleHeight = [self.titleLabel.text
                           boundingRectWithSize:CGSizeMake(labelWidth, [UIFont systemFontOfSize:17].lineHeight * 2)
                           options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{
                                        NSFontAttributeName : [UIFont systemFontOfSize:17]
                                        }
                           context:nil].size.height;
    
    CGFloat descriptionHeight = [self.descriptionLabel.text
                           boundingRectWithSize:CGSizeMake(labelWidth, [UIFont systemFontOfSize:17].lineHeight * 5)
                           options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{
                                        NSFontAttributeName : [UIFont systemFontOfSize:17]
                                        }
                           context:nil].size.height;
    
    CGRect frame = self.frame;
    frame.origin.y = point.y - frame.size.height - 5;
    frame.size.height = round(offsetHeight + titleHeight + descriptionHeight + self.pointerImageView.frame.size.height);
    self.frame = frame;
    
    CGRect pointerFrame = self.pointerImageView.frame;
    pointerFrame.origin.y = self.frame.size.height - pointerFrame.size.height;
    pointerFrame.origin.x = point.x - (pointerFrame.size.width / 2) - self.frame.origin.x;
    self.pointerImageView.frame = pointerFrame;
    
    CGRect containerFrame = self.bounds;
    containerFrame.size.height -= (self.pointerImageView.frame.size.height - 1);
    self.containerView.frame = containerFrame;
    
    CGRect closeButtonFrame = self.closeButton.frame;
    closeButtonFrame.origin.y = 15;
    closeButtonFrame.origin.x = self.containerView.frame.size.width - 45;
    self.closeButton.frame = closeButtonFrame;

    CGRect titleLabelFrame = CGRectZero;
    titleLabelFrame.origin.x = 55;
    titleLabelFrame.origin.y = 15;
    titleLabelFrame.size.height = titleHeight;
    titleLabelFrame.size.width = labelWidth;
    self.titleLabel.frame = titleLabelFrame;

    CGRect descriptionLabelFrame = CGRectZero;
    descriptionLabelFrame.origin.y = titleHeight + 15;
    descriptionLabelFrame.origin.x = 55;
    descriptionLabelFrame.size.width = labelWidth;
    descriptionLabelFrame.size.height = descriptionHeight;
    self.descriptionLabel.frame = descriptionLabelFrame;
}

- (void)hide {
    [self removeFromSuperview];
}

@end
