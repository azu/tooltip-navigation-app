//
// Created by azu on 2013/07/02.
//


#import <Foundation/Foundation.h>
#import "TutorialDataManager.h"
#import "MainViewController.h"

// チュートリアルのデータをラップするだけのクラス
@interface TutorialData : NSObject
@property NSString *message;
@property MainViewOutletType outletType;
@property TutorialType tutorialType;

- (id)initWithMessage:(NSString *) message outletType:(MainViewOutletType) outletType tutorialType:(TutorialType) tutorialType;

+ (id)dataWithMessage:(NSString *) message outletType:(MainViewOutletType) outletType tutorialType:(TutorialType) tutorialType;

@end