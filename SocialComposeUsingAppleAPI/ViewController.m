//
//  ViewController.m
//  SocialComposeUsingAppleAPI
//
//  Created by devzkn on 07/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //判断服务是否可用
    /**
     SOCIAL_EXTERN NSString *const SLServiceTypeTwitter NS_AVAILABLE(10_8, 6_0);
     SOCIAL_EXTERN NSString *const SLServiceTypeFacebook NS_AVAILABLE(10_8, 6_0);
     SOCIAL_EXTERN NSString *const SLServiceTypeSinaWeibo NS_AVAILABLE(10_8, 6_0);
     SOCIAL_EXTERN NSString *const SLServiceTypeTencentWeibo NS_AVAILABLE(10_9, 7_0);
     SOCIAL_EXTERN NSString *const SLServiceTypeLinkedIn NS_AVAILABLE(10_9, NA);*/
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        return;//没有添加Weibo账号，将返回0
    }
    //创建socialVC
    SLComposeViewController *slSocialVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    // 设置一些属性
    slSocialVC.initialText =@"initialText";
    [slSocialVC addImage:[UIImage imageNamed:@"connection.jpg"]];
    //show SocialVC
    //    slSocialVC
    [self  presentViewController:slSocialVC animated:YES completion:nil];
    //监听分享状态
    slSocialVC.completionHandler = ^(SLComposeViewControllerResult result){
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                NSLog(@"SLComposeViewControllerResultCancelled");
                break;
                
            case SLComposeViewControllerResultDone:
                NSLog(@"SLComposeViewControllerResultDone");
                break;
        }
    };

}




@end
