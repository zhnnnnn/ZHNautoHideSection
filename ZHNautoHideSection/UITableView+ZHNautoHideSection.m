//
//  UITableView+ZHNautoHideSection.m
//  ZHNautoHideSection
//
//  Created by zhn on 16/4/25.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "UITableView+ZHNautoHideSection.h"
#import <objc/runtime.h>


@implementation UITableView (ZHNautoHideSection)

- (void)setDefaultHeight:(NSInteger)defaultHeight{
    objc_setAssociatedObject(self, @"key", @(defaultHeight), OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)defaultHeight{
    return [objc_getAssociatedObject(self, @"key")integerValue];
}

- (void)auto_hideSection:(NSInteger)section{
    
    NSMutableIndexSet * sectionArray = objc_getAssociatedObject(self, @"arrayKey");
    if (sectionArray == nil) {
        sectionArray = [NSMutableIndexSet indexSet];
        objc_setAssociatedObject(self, @"arrayKey", sectionArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    // 多数组里面的数据做处理
    if([sectionArray containsIndex:section]){
        [sectionArray removeIndex:section];
    }else{
        [sectionArray addIndex:section];
    }

    NSIndexSet * set = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)autoCountRowHeightWithSection:(NSInteger)section{
    
    NSMutableIndexSet * sectionArray = objc_getAssociatedObject(self, @"arrayKey");
    if([sectionArray containsIndex:section]){
        return 0;
    }else{
        return self.defaultHeight;
    }
}

@end
