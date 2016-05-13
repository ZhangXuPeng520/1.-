//
//  ZXCollectionController.m
//  1.绘画
//
//  Created by apple on 16/5/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZXCollectionController.h"

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeCenter;
        _imageView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height);
}

@end


@interface ZXCollectionController ()
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ZXCollectionController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
   
    CGFloat screenWidth = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    NSUInteger numberOfCellsInARow = screenWidth/100.f;
    
    CGFloat cellSide = (screenWidth-2.f-2.f-2.f*(numberOfCellsInARow-1))/numberOfCellsInARow;
    
    UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(2.f, 2.f, 2.f, 2.f);
    collectionViewLayout.itemSize = CGSizeMake(cellSide, cellSide);
    collectionViewLayout.minimumLineSpacing = 2.f;
    collectionViewLayout.minimumInteritemSpacing = 0;
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collectionViewLayout.headerReferenceSize = CGSizeZero;
    collectionViewLayout.footerReferenceSize = CGSizeZero;
    
    self = [super initWithCollectionViewLayout:collectionViewLayout];
    if (self)
    {
        self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.f];
        
        self.title = @"LGDrawer";
        
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
       
//        [self prepareData];
    }
    
    return self;
}


#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
