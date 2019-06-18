//
//  AppDelegate.m
//  Wallet
//
//  All rights reserved.
//

#import "AppDelegate.h"
#import "AppState.h"
#import "TouchIDTool.h"
#import "VStoryboard.h"
#import "WalletMgr.h"
#import "PasswordInputViewController.h"
#import "AppDelegate+DismissKeyboard.h"
#import "ApiServer.h"
#import "WindowManager.h"
#import "VAlertViewController.h"
#import "Language.h"

static NSString* const urlServer    = @"http://version.t.top/v1/appVsersion";
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self enableAutoDismissKeyboard];
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
    
    if (AppState.shareInstance.hasWallet) {
        self.window.rootViewController = VStoryboard.Password.instantiateInitialViewController;
    } else {
        self.window.rootViewController = VStoryboard.Generate.instantiateInitialViewController;
    }
    sleep(1.f);
    [self updateApp];

    return YES;
}

- (NSDictionary *)jsonStringToDictionary:(NSString *)jsonStr{
    if (jsonStr == nil){
        return nil;
    }
    
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error && [dict[@"message"] isEqualToString:@"success"]){
        return nil;
    }
    
    return dict;
}

- (void) updateApp {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    int localVersion =  [[infoDictionary objectForKey:@"CFBundleVersion"] intValue];
    
    NSURL *appUrl = [NSURL URLWithString:[NSString stringWithFormat:urlServer]];
    NSString *appMsg = [NSString stringWithContentsOfURL:appUrl encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *appMsgDict = [self jsonStringToDictionary:appMsg];
    int remoteVersion = 0;
    NSString* urlDownload = NULL;
    if(appMsgDict){
        remoteVersion   =   [appMsgDict[@"data"][@"hotAppIosVersion"] intValue];
        urlDownload     =   appMsgDict[@"data"][@"hotIosUrl"];
    }
    
    if(localVersion < remoteVersion){
        UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        alertWindow.rootViewController = [[UIViewController alloc] init];
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        [alertWindow makeKeyAndVisible];
        VAlertViewController *alertController = [[VAlertViewController alloc] initWithTitle:VLocalize(@"") secondTitle:VLocalize(@"nav.title.update") contentView:^(UIStackView * _Nonnull view) {
            
        } cancelTitle:VLocalize(@"cancel") confirmTitle:VLocalize(@"confirm") cancel:^{
            
        } confirm:^{
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:urlDownload]];
            NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES};
            [[UIApplication sharedApplication] openURL:url options:options completionHandler:nil];
        }];
        [alertWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self auth];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [self auth];
}

- (void)auth {
    if (AppState.shareInstance.hasWallet) {
        UIViewController *topVC = WindowManager.topViewControllerDismissAlert;
        if ([topVC isKindOfClass:PasswordInputViewController.class]) {
            return;
        }
        PasswordInputViewController *pwdInputVC = [[PasswordInputViewController alloc] initWithResult:^(BOOL success) {
            if (success) {
                [topVC dismissViewControllerAnimated:YES completion:nil];
            }
        }];
        [topVC presentViewController:pwdInputVC animated:YES completion:nil];
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)sendEvent:(UIEvent *)event {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(update) object:nil];
    [self performSelector:@selector(update) withObject:nil afterDelay:AppState.shareInstance.autoLockTime == 10 ? 600 : 300];
    [super sendEvent:event];
}

- (void)update {
    NSLog(@"auto lock");
    [self auth];
}

@end
