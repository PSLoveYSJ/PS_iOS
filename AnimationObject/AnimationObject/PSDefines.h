//
//  Header.h
//  Text
//
//  Created by Peng on 2019/6/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, PSDeviceType) {
    PSDeviceTypeUnknow,
    PSDeviceType4, // 4 4S 分辨率320x480，像素640x960，@2x
    PSDeviceType5, // 5C 5 5S se 分辨率320x568，像素640x1136，@2x
    PSDeviceType6, // 6 6s 7 8 分辨率375x667，像素750x1334，@2x
    PSDeviceType6P, // 6p 6sp 7p 8p xs 分辨率414x736，像素1242x2208，@3x
    PSDeviceTypeX, // X 分辨率373x812，像素1125x2436，@3x
    PSDeviceTypeXR,
    PSDeviceTypeXSMax,
};

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenBounds [UIScreen mainScreen].bounds

//判断是否 Retina屏、设备是否iPhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//#define weakify(x)  __weak typeof(x) weak##x = x;
#define weakify(x)  __weak __typeof__(x) weak##x = x;
#define normalize(x) __typeof__(x) x = weak##x;

/** 判断是否为iPhone */
#define isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 判断是否是iPad */
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是否为iPod */
#define isiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/** 应用商店版本号 */
#define APP_SHORT_VERSION               [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** 应用构建版本号 */
#define APP_BUNDLE_VERSION              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** 应用商店和构建版本号 */
#define APP_VERSION                     [NSString stringWithFormat:@"%@ (%@)", APP_SHORT_VERSION, APP_BUNDLE_VERSION]
/** 应用标识 */
#define APP_BUNDLE_IDENTIFIER           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

//LOAD LOCAL IMAGE FILE     读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
//DEFINE IMAGE      定义UIImage对象//    imgView.image = IMAGE(@"Default.png");
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
//DEFINE IMAGE      定义UIImage对象
#define UIImageNamed(_pointer) [UIImage imageNamed:[NSString stringWithFormat:@"%@",_pointer]]

#define NameToString(_name) @#_name
#define ClassName(_name) [NSClassFromString(@#_name) new]

#ifdef DEBUG
    #define PS_Log(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
    #define PS_Log(...)
#endif


static inline PSDeviceType currentDeviceType() {
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        CGSize currentSize = [[UIScreen mainScreen] currentMode].size;
        if (CGSizeEqualToSize(currentSize, CGSizeMake(640, 960))) {
            return PSDeviceType4;
        } else if (CGSizeEqualToSize(currentSize, CGSizeMake(640, 1136))) {
            return PSDeviceType5;
        } else if (CGSizeEqualToSize(currentSize, CGSizeMake(750, 1334))) {
            return PSDeviceType6;
        } else if (CGSizeEqualToSize(currentSize, CGSizeMake(1242, 2208))) {
            return PSDeviceType6P;
        } else if (CGSizeEqualToSize(currentSize, CGSizeMake(1125, 2436))) {
            return PSDeviceTypeX;
        } else if (CGSizeEqualToSize(currentSize, CGSizeMake(828, 1792))) {
            return PSDeviceTypeXR;
        } else if (CGSizeEqualToSize(currentSize, CGSizeMake(1242, 2688))) {
            return PSDeviceTypeXSMax;
        }
    } else {
        return PSDeviceTypeUnknow;
    }
    return PSDeviceTypeUnknow;
}

static inline CGFloat currentDeviceVersion() {
    return [[UIDevice currentDevice] systemVersion].doubleValue;
}

// .h
#define singleton_interface  + (instancetype)shared ;
// .m
#define singleton_implementation(class) \
static class *_showInstance; \
+ (id)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_showInstance = [super allocWithZone:zone]; \
}); \
return _showInstance; \
} \
+ (instancetype)shared { \
if (nil == _showInstance) { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_showInstance = [[class alloc] init]; \
}); \
} \
return _showInstance; \
} \
- (id)copyWithZone:(NSZone *)zone{ \
return _showInstance; \
} \
- (id)mutableCopyWithZone:(NSZone *)zone{ \
return _showInstance; \
} \

CG_INLINE void dispatch_after_P(CGFloat time,dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

static inline BOOL isIphoneX() {
    if ([[UIDevice currentDevice] userInterfaceIdiom] != UIUserInterfaceIdiomPhone) {
        return NO;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (window.safeAreaInsets.bottom > 0) {
            return YES;
        }
    }
    
    return NO;
}

#define isIphoneX isIphoneX()

#define navBarHeight (isIphoneX ? 88 : 64)
#define statusBarHeight (isIphoneX ? 44 : 20)
#define tabBarHeight (isIphoneX ? 83 : 49)
#define homeIndicatiorHeight (isIphoneX ? 34 : 0)

/**
 获取文字大小宽高
 
 @param string 文字
 @param font 宽度
 @param maxWidth 最大宽度
 @return 大小Size
 */
static inline CGSize textWidthWithString(NSString *string, UIFont *font, CGFloat maxWidth){
    CGSize size = [string boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine
                                    attributes:@{NSFontAttributeName:font}
                                       context:nil].size;
    return size;
}


static inline UIViewController *getTopViewController(UIViewController *originVC) {
    if ([originVC isKindOfClass:[UINavigationController class]]) {
        return [(UINavigationController *) originVC topViewController];
    } else if ([originVC isKindOfClass:[UITabBarController class]]) {
        return [(UITabBarController *) originVC selectedViewController];
    } else {
        return originVC;
    }
    
    return originVC;
}

static inline UIViewController *getCurrentViewController() {
    UIViewController *viewController = getTopViewController([UIApplication sharedApplication].keyWindow.rootViewController);
    while (viewController.presentedViewController != nil) {
        getTopViewController(viewController);
    }
    return viewController;
}


#endif /* Header_h */
