//
//  IWAppDelegate.m
//  Daniel Hickey Assign 2
//
//  Created by Daniel Hickey on 03/11/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import "IWAppDelegate.h"
#import "Media.h"
#import "MediaViewController.h"


@implementation IWAppDelegate

{
    NSMutableArray *_movies;
    NSMutableArray *_music;
    NSMutableArray *_games;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _movies = [NSMutableArray arrayWithCapacity:20];
       
    Media *movies = [[Media alloc] init];
    movies.title = @"8 Mile";
    [_movies addObject:movies];
    
    movies = [[Media alloc] init];
    movies.title = @"The Godfather";
    [_movies addObject:movies];
    
    movies = [[Media alloc]init];
    movies.title = @"Apocalypto";
    [_movies addObject:movies];
    
    movies = [[Media alloc]init];
    movies.title = @"2 Guns";
    [_movies addObject:movies];
    
    
    /*
    [_movies sortUsingDescriptors:
    [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"title"
                                                            ascending:YES
                                                             selector:@selector(caseInsensitiveCompare:)]]];*/
    _music = [NSMutableArray arrayWithCapacity:20];
    
    Media *music = [[Media alloc] init];
    music.title = @"What's the difference";
    [_music addObject:music];
    
    music = [[Media alloc] init];
    music.title = @"Eminem";
    [_music addObject:music];
    
    music = [[Media alloc]init];
    music.title = @"The Dubliners";
    [_music addObject:music];
    
    music = [[Media alloc]init];
    music.title = @"Add";
    [_music addObject:music];
 

    _games = [NSMutableArray arrayWithCapacity:20];
    Media *games = [[Media alloc] init];
    games.title = @"Assassins Creed 2";
    [_games addObject:games];
    
    games = [[Media alloc] init];
    games.title = @"Grand Theft Auto";
    [_games addObject:games];
    
    games = [[Media alloc] init];
    games.title = @"assassins Creed";
    [_games addObject:games];  

    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    
    [_movies sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    [_music sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    [_games sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    
    
    //looks up rootViewController and casts it to the UITabBarController
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    
    //mediaViewController sits inside the navigation controller.
    UINavigationController *navigationController = [tabBarController viewControllers][0];
    
    
    //asks for root view controller which is the mediaViewController
    MediaViewController *mediaViewController = [navigationController viewControllers][0];
    mediaViewController.media = _movies;
        
    navigationController = [tabBarController viewControllers][1];
    mediaViewController = [navigationController viewControllers][0];
    mediaViewController.media = _music;
    	
    navigationController = [tabBarController viewControllers][2];
    mediaViewController = [navigationController viewControllers][0];
    mediaViewController.media = _games;
    
  
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. data if appropriate. See also applicationDidEnterBackground:.
}

@end
