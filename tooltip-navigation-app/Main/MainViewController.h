//
// Created by azu on 2013/07/11.
//


#import <Foundation/Foundation.h>
#import "CMPopTipView.h"

@class CMPopTipView;


typedef NS_ENUM(NSUInteger, MainViewOutletType){
    MainView_InformationButton,
    MainView_FirstButton,
    MainView_SecondButton,
    MainView_ThirdButton,
};

@interface MainViewController : UIViewController <CMPopTipViewDelegate> {
}

@property(weak, nonatomic) IBOutlet UIBarButtonItem *informationButtonItem;
@property(weak, nonatomic) IBOutlet UIButton *firstButton;
@property(weak, nonatomic) IBOutlet UIButton *secondButton;
@property(weak, nonatomic) IBOutlet UIButton *thirdButton;

- (IBAction)handleInformationButton:(id) sender;

@end