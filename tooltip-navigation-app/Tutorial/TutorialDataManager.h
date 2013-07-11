//
// Created by azu on 2013/07/02.
//


#import <Foundation/Foundation.h>

@class TutorialData;


typedef NS_ENUM(NSUInteger, TutorialType) {
    TUTORIAL_NONE = 0,
    TUTORIAL_STEP1,
    TUTORIAL_STEP2,
    TUTORIAL_STEP3,
    TUTORIAL_STEP4,
};

@interface TutorialDataManager : NSObject

@property TutorialType checkPoint;
- (BOOL)hasCheckPoint:(TutorialType) checkpoint;
// チュートリアルをリセットして最初からやり直す
- (void)resetCheckPoint;
// 次のチュートリアルがあるならそれを返す。ない場合はnilを返す
- (TutorialData *)nextTutorialData;
@end