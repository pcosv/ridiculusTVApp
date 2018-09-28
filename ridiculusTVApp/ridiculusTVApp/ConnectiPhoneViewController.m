//
//  ConnectiPhoneViewController.m
//  ridiculusTVApp
//
//  Created by Paula Vaz on 26/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

#import "ConnectiPhoneViewController.h"
#import "ridiculusTVApp-Swift.h"
#import "MPCHandler.h"

@interface ConnectiPhoneViewController ()

@property (strong, nonatomic) AppDelegate *appDelegate;

@end

@implementation ConnectiPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.appDelegate.mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    [self.appDelegate.mpcHandler setupSession];
    [self.appDelegate.mpcHandler advertiseSelf: YES];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerChangedStateWithNotification:)
                                                 name:@"MPCDemo_DidChangeStateNotification"
                                               object:nil];
    
    printf("oi");
}

- (void)peerChangedStateWithNotification:(NSNotification *)notification {
    // Get the state of the peer.
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    printf("oioioi");
    
    // We care only for the Connected and the Not Connected states.
    // The Connecting state will be simply ignored.
    if (state != MCSessionStateConnecting) {
        // We'll just display all the connected peers (players) to the text view.
        NSString *allPlayers = @"Other players connected with:\n\n";
        
        for (int i = 0; i < self.appDelegate.mpcHandler.session.connectedPeers.count; i++) {
            NSString *displayName = [[self.appDelegate.mpcHandler.session.connectedPeers objectAtIndex:i] displayName];
            
            allPlayers = [allPlayers stringByAppendingString:@"\n"];
            allPlayers = [allPlayers stringByAppendingString:displayName];
        }
    }
}


- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}


- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}


@end
