#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(PowViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(size, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(value, NSString)
RCT_EXPORT_VIEW_PROPERTY(isSoundOn, BOOL)
RCT_EXPORT_VIEW_PROPERTY(animationType, NSString)

@end
