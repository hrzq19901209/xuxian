//
//  CollectionLayout.m
//  xuxian
//
//  Created by BugHunter on 15/10/1.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "CollectionLayout.h"

// Column sizes are determined in sizeForItemWithColumnType:

static NSUInteger kSectionHeight = 40;
static NSUInteger kHeaderHeight = 150;
static NSInteger kInterSet = 10;//两个item之间的间隔
static NSUInteger numberOfColumnsInRow = 2;

@interface CollectionLayout()

@property (strong, nonatomic) NSMutableArray *itemAttributes;
@property (nonatomic, assign) CGSize contentSize;

@end
@implementation CollectionLayout

#pragma mark -UICollectionViewLayout Implementation

-(id)init
{
    self = [super init];
    if (self)
    {
        [self setItemOffset:UIOffsetMake(0,0)];
    }
    return self;
}

-(void)prepareLayout{
    [self setItemAttributes:nil];
    _itemAttributes = [[NSMutableArray alloc] init];
    
    NSUInteger column = 0;    // Current column inside row
    
    CGFloat xOffset = _itemOffset.horizontal;
    CGFloat yOffset = _itemOffset.vertical+kHeaderHeight;
    CGFloat rowHeight = 0.0;
    
    CGFloat contentWidth = 0.0;         // Used to determine the contentSize
    CGFloat contentHeight = 0.0;        // Used to determine the contentSize
    // We'll create a dynamic layout. Each row will have a random number of columns//
    NSUInteger numberOfSections = [self.collectionView numberOfSections];
    // Loop through all items and calculate the UICollectionViewLayoutAttributes for each one
    
    for (NSUInteger i = 0;i < numberOfSections;i++) {
        NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:i];
        //添加HeaderView
        NSIndexPath *sectionPath = [NSIndexPath indexPathForItem:0 inSection:i];
        UICollectionViewLayoutAttributes *sa = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:sectionPath];
        sa.frame = CGRectMake(0,yOffset, self.collectionView.bounds.size.width, kSectionHeight);
        [_itemAttributes addObject:sa];
        
        yOffset = kSectionHeight+yOffset;
        
        for (NSUInteger index = 0; index < numberOfItems; index++)
        {
            CGSize itemSize = [self sizeForItemWithColumnType:column];
            if (itemSize.height > rowHeight)
                rowHeight = itemSize.height;
            
            // Create the actual UICollectionViewLayoutAttributes and add it to your array. We'll use this later in layoutAttributesForItemAtIndexPath:
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:i];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height));
            [_itemAttributes addObject:attributes];
            
            xOffset = xOffset+itemSize.width+_itemOffset.horizontal;
            column++;
            
            // Create a new row if this was the last column
            //当某行已经填充完毕或者某一个section的所有item已经显示完毕  换行重新开始
            if (column == numberOfColumnsInRow || index == numberOfItems - 1)
            {
                if (xOffset > contentWidth)
                    contentWidth = xOffset;
                // Reset values
                column = 0;
                xOffset = _itemOffset.horizontal;
                yOffset += rowHeight+_itemOffset.vertical;
            }else{
                xOffset += kInterSet;
            }
        }

    }
    
    // Get the last item to calculate the total height of the content
    UICollectionViewLayoutAttributes *attributes = [_itemAttributes lastObject];
    contentHeight = attributes.frame.origin.y+attributes.frame.size.height;
    
    // Return this in collectionViewContentSize
    _contentSize = CGSizeMake(contentWidth, contentHeight);
}
-(CGSize)collectionViewContentSize
{
    return _contentSize;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _itemAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}


#pragma mark -
#pragma mark Helpers

-(CGSize)sizeForItemWithColumnType:(NSUInteger)indexInRow
{
    NSInteger offSet = kInterSet *(numberOfColumnsInRow - 1)/numberOfColumnsInRow;
    CGFloat bl = 1.0/numberOfColumnsInRow;
    if (indexInRow == 0 || indexInRow == numberOfColumnsInRow - 1) {
        return CGSizeMake(self.collectionView.bounds.size.width*bl-_itemOffset.horizontal-offSet, self.collectionView.bounds.size.width*bl+30);
    }else{
        return CGSizeMake(self.collectionView.bounds.size.width*bl-_itemOffset.horizontal-2*offSet, self.collectionView.bounds.size.width*bl+30);
    }
    

}
@end
