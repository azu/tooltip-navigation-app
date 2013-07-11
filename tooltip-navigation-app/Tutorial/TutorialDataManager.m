//
// Created by azu on 2013/07/02.
//


#import "TutorialDataManager.h"
#import "UserDefaults.h"
#import "TutorialData.h"


@interface TutorialDataManager ()
@property(nonatomic, strong) NSArray *tutorialDataSource;
@end

@implementation TutorialDataManager {
    UserDefaults *defaults;
}

- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    defaults = [[UserDefaults alloc] init];

    return self;
}

- (TutorialType)checkPoint {
    NSInteger currentCheckPoint = [[defaults tutorialCheckPoint] integerValue];
    return (TutorialType)currentCheckPoint;
}

- (void)setCheckPoint:(TutorialType) checkpoint {
    NSInteger currentCheckPoint = [[defaults tutorialCheckPoint] integerValue];
    currentCheckPoint ^= (1 << checkpoint);
    [defaults setTutorialCheckPoint:@(currentCheckPoint)];
}

- (BOOL)hasCheckPoint:(TutorialType) checkpoint {
    int flag = (1 << checkpoint);
    NSInteger currentCheckPoint = [[defaults tutorialCheckPoint] integerValue];
    if (currentCheckPoint & flag) {
        return YES;
    }
    return NO;
}

- (void)resetCheckPoint {
    [defaults setTutorialCheckPoint:@(TUTORIAL_NONE)];
}


- (TutorialData *)nextTutorialData {
    for (TutorialData *tutorialData in self.tutorialDataSource) {
        if ([self hasCheckPoint:tutorialData.tutorialType] == NO) {
            return tutorialData;
        }
    }
    return nil;
}

/***
* 並び順がそのまま出現順となる
*/
- (NSArray *)tutorialDataSource {
    if (_tutorialDataSource != nil) {
        return _tutorialDataSource;
    }
    _tutorialDataSource = @[
        [TutorialData dataWithMessage:@"ここをタップする再度ヘルプを見られます" outletType:MainView_InformationButton tutorialType:TUTORIAL_STEP1],
        [TutorialData dataWithMessage:@"一番目のボタンです" outletType:MainView_FirstButton tutorialType:TUTORIAL_STEP2],
        [TutorialData dataWithMessage:@"二番目のボタンです" outletType:MainView_SecondButton tutorialType:TUTORIAL_STEP3],
        [TutorialData dataWithMessage:@"三番目のボタンです" outletType:MainView_ThirdButton tutorialType:TUTORIAL_STEP4],
    ];
    return _tutorialDataSource;
}


@end