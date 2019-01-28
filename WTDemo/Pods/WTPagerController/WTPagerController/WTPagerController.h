//
//  WTPagerController.h
//  WTPagerControllerDemo
//
//  Created by jienliang on 16/4/13.
//  Copyright © 2016年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTPagerViewLayout.h"

NS_ASSUME_NONNULL_BEGIN

@class WTPagerController;
@protocol WTPagerControllerDataSource <NSObject>

// viewController's count in pagerController
- (NSInteger)numberOfControllersInPagerController;

/* 1.viewController at index in pagerController
   2.if prefetching is YES,the controller is preload,not display.
   3.if controller will display,will call viewWillAppear.
   4.you can register && dequeue controller, usage like tableView
 */
- (UIViewController *)pagerController:(WTPagerController *)pagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching;

@end

@protocol WTPagerControllerDelegate <NSObject>

@optional

// Display customization
// the same to viewWillAppear, also can use viewController's viewWillAppear
- (void)pagerController:(WTPagerController *)pagerController viewWillAppear:(UIViewController *)viewController forIndex:(NSInteger)index;
- (void)pagerController:(WTPagerController *)pagerController viewDidAppear:(UIViewController *)viewController forIndex:(NSInteger)index;

// Disappear customization
// the same to viewWillDisappear, also can use viewController's viewWillDisappear
- (void)pagerController:(WTPagerController *)pagerController viewWillDisappear:(UIViewController *)viewController forIndex:(NSInteger)index;
- (void)pagerController:(WTPagerController *)pagerController viewDidDisappear:(UIViewController *)viewController forIndex:(NSInteger)index;

// Transition animation customization

- (void)pagerController:(WTPagerController *)pagerController transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex animated:(BOOL)animated;

- (void)pagerController:(WTPagerController *)pagerController transitionFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress;


// ScrollViewDelegate

- (void)pagerControllerDidScroll:(WTPagerController *)pagerController;
- (void)pagerControllerWillBeginScrolling:(WTPagerController *)pagerController animate:(BOOL)animate;
- (void)pagerControllerDidEndScrolling:(WTPagerController *)pagerController animate:(BOOL)animate;

@end

@interface WTPagerController : UIViewController

@property (nonatomic, weak, nullable) id<WTPagerControllerDataSource> dataSource;
@property (nonatomic, weak, nullable) id<WTPagerControllerDelegate>   delegate;
// pagerController's layout,don't set layout's dataSource to other
@property (nonatomic, strong, readonly) WTPagerViewLayout<UIViewController *> *layout;
@property (nonatomic, weak, readonly) UIScrollView *scrollView;

@property (nonatomic, assign, readonly) NSInteger countOfControllers;
@property (nonatomic, assign, readonly) NSInteger curIndex;// default -1

@property (nonatomic, strong, nullable, readonly) NSArray<UIViewController *> *visibleControllers;

@property (nonatomic, assign) BOOL automaticallySystemManagerViewAppearanceMethods;// default YES.if YES system auto call view Appearance Methods(eg. viewWillAppear...)

@property (nonatomic, assign) UIEdgeInsets contentInset;

//if not visible, prefecth, cache view at index, return nil
- (UIViewController *_Nullable)controllerForIndex:(NSInteger)index;

// register && dequeue's usage like tableView
- (void)registerClass:(Class)Class forControllerWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forControllerWithReuseIdentifier:(NSString *)identifier;
- (UIViewController *)dequeueReusableControllerWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

// scroll to index
- (void)scrollToControllerAtIndex:(NSInteger)index animate:(BOOL)animate;

//  update data and layout,but don't reset propertys(curIndex,visibleDatas,prefechDatas)
- (void)updateData;

// reload data and reset propertys
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END