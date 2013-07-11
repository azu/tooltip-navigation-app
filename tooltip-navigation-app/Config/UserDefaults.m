//
//  UserDefaults.m
#import "UserDefaults.h"

#define kTutorialCheckPoint  @"kTutorialCheckPoint"


@implementation UserDefaults {
    NSUserDefaults *defaults;
}
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    defaults = [NSUserDefaults standardUserDefaults];

    return self;
}

- (NSNumber *)tutorialCheckPoint {
    return [defaults objectForKey:kTutorialCheckPoint];
}

- (void)setTutorialCheckPoint:(NSNumber *) tutorialCheckPoint {
    [defaults setObject:tutorialCheckPoint forKey:kTutorialCheckPoint];
    [defaults synchronize];
}
@end
