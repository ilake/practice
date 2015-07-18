#import "SomeString.h"

@implementation SomeString

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(get:(RCTResponseSenderBlock)callback) {
  // Change this depending on what you want to retrieve:
  NSString* someString = @"something";

  callback(@[someString]);
};

@end
