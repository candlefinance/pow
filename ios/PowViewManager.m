#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(PowViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(size, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(value, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(noSound, BOOL)

@end
