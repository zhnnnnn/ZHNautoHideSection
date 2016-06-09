//
//  UITableView+ZHNautoHideSection.h
//  ZHNautoHideSection
//
//  Created by zhn on 16/4/25.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZHNautoHideSection)
/**
 *  cell 的默认显示情况下的高度 这个值在你调用隐藏方法前必须要先赋值
 */
@property (nonatomic,assign) NSInteger defaultHeight;
/**
 *  自动隐藏或者显示第几组
 *
 *  @param section 第几组
 */
- (void)auto_hideSection:(NSInteger)section;
/**
 *  获取第几组当前情况下cell的高度（0 或者是默认高度）
 *
 *  @param section 第几组
 *
 *  @return 高度值
 */
- (CGFloat)autoCountRowHeightWithSection:(NSInteger)section;
@end
