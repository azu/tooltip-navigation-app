//
// Created by azu on 2013/07/02.
//


#import "TutorialData.h"


@implementation TutorialData {

}
- (id)initWithMessage:(NSString *) message outletType:(MainViewOutletType) outletType tutorialType:(TutorialType) tutorialType {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    self.message = message;
    self.outletType = outletType;
    self.tutorialType = tutorialType;

    return self;
}

+ (id)dataWithMessage:(NSString *) message outletType:(MainViewOutletType) outletType tutorialType:(TutorialType) tutorialType {
    return [[self alloc] initWithMessage:message outletType:outletType tutorialType:tutorialType];
}

@end