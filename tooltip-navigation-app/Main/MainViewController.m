//
// Created by azu on 2013/07/11.
//


#import "MainViewController.h"
#import "MainModel.h"
#import "TutorialData.h"


@interface MainViewController ()
@property(nonatomic, strong) MainModel *model;
@property(nonatomic, strong) TutorialDataManager *tutorialModel;
@property(nonatomic, strong) CMPopTipView *popTipView;
@end

@implementation MainViewController {
}
- (MainModel *)model {
    if (_model == nil) {
        _model = [[MainModel alloc] init];
    }
    return _model;
}

- (TutorialDataManager *)tutorialModel {
    if (_tutorialModel == nil) {
        _tutorialModel = [[TutorialDataManager alloc] init];
    }
    return _tutorialModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // チュートリアル
    [self.tutorialModel addObserver:self forKeyPath:@"checkPoint" options:NSKeyValueObservingOptionNew context:@selector(showNextPopTip)];
}

- (void)viewDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];
    [self showNextPopTip];
}

- (void)observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context {
    if (context != nil) {
        [self performSelector:context withObject:nil afterDelay:0.0f];
    }
}

- (void)dealloc {
    [self.tutorialModel removeObserver:self forKeyPath:@"checkPoint"];
}

#pragma mark - outlets
#pragma mark - Tutorial
- (void)showTutorial:(TutorialData *) tutorialData {
    if (tutorialData == nil) {
        return;
    }
    self.popTipView = [[CMPopTipView alloc] initWithMessage:tutorialData.message];
    self.popTipView.textColor = [UIColor blackColor];
    self.popTipView.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:247 / 255.0 blue:204 / 255.0 alpha:1.0];
    self.popTipView.tag = tutorialData.tutorialType;
    self.popTipView.delegate = self;
    id viewAtPoint = [self viewForMainViewOutletType:tutorialData.outletType];
    if ([viewAtPoint isKindOfClass:[UIBarButtonItem class]]) {
        [self.popTipView presentPointingAtBarButtonItem:viewAtPoint animated:YES];
    } else {
        [self.popTipView presentPointingAtView:viewAtPoint inView:self.view animated:YES];
    }
}

- (void)showNextPopTip {
    // 同時に複数出ないようにする
    if (self.popTipView != nil) {
        return;
    }
    TutorialData *nextTutorialData = [self.tutorialModel nextTutorialData];
    [self showTutorial:nextTutorialData];
}
// ツールチップがクリックされたら、CheckPointを更新 -> KVOで検知
- (void)popTipViewWasDismissedByUser:(CMPopTipView *) popTipView {
    self.popTipView = nil;
    TutorialType tutorialType = (TutorialType)popTipView.tag;
    [self.tutorialModel setCheckPoint:tutorialType];
}

/**
* 渡されたtypeに対する実際のViewの参照を返す
*/
- (id)viewForMainViewOutletType:(MainViewOutletType) type {
    switch (type) {
        case MainView_InformationButton:
            return self.informationButtonItem;
        case MainView_FirstButton:
            return self.firstButton;
        case MainView_SecondButton:
            return self.secondButton;
        case MainView_ThirdButton:
            return self.thirdButton;
    }
    return nil;
}

- (IBAction)handleInformationButton:(id) sender {
    [self.tutorialModel resetCheckPoint];
    [self showNextPopTip];
}
@end