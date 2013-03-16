#import "___FILEBASENAMEASIDENTIFIER___.h"
#import "___FILEBASENAMEASIDENTIFIER___+Private.h"

static NSBundle *_bundle = nil;

@implementation ___FILEBASENAMEASIDENTIFIER___

+ (NSBundle *)bundle {
  NSString *path = nil;
    if (_bundle == nil) {
        path = [[NSBundle mainBundle] pathForResource:@"___PACKAGENAMEASIDENTIFIER___"
                                               ofType:@"bundle"];
        if (_bundle == nil) {
            path = [[NSBundle mainBundle] pathForResource:@"___PACKAGENAMEASIDENTIFIER___" 
                                                   ofType:@"framework"];

        }
    }
    _bundle = [NSBundle bundleWithPath:path];
    return _bundle;
}

+ (void)setBundle:(NSBundle *)bundle {
    _bundle = bundle;
}

@end