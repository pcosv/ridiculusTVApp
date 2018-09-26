//
//  MPCHandler.m
//  MPCDemo
//
//  Created by Paula Vaz on 21/09/2018.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

#import "MPCHandler.h"

@implementation MPCHandler

// we create an instance of the MCPeerID class and pass it displayName
- (void)setupPeerWithDisplayName:(NSString *)displayName {
    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
}

// we create an MCSession instance by passing the peerID instance variable and set the session's delegate to our MPCHandler instance
- (void)setupSession {
    self.session = [[MCSession alloc] initWithPeer:self.peerID];
    self.session.delegate = self;
}

// initialize an instance of MCBrowserViewController by passing the service type and the session we created in setupSession
- (void)setupBrowser {
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"my-game" session:_session];
}

// start the assistant and begin advertising the service
- (void)advertiseSelf:(BOOL)advertise {
    if (advertise) {
        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"my-game" discoveryInfo:nil session:self.session];
        [self.advertiser start];
        
    } else {
        [self.advertiser stop];
        self.advertiser = nil;
    }
}

// is called every time the device receives data from another peer
- (void)session:(nonnull MCSession *)session didReceiveData:(nonnull NSData *)data fromPeer:(nonnull MCPeerID *)peerID {
    NSDictionary *userInfo = @{ @"data": data,
                                @"peerID": peerID };
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidReceiveDataNotification"
                                                            object:nil
                                                          userInfo:userInfo];
    });
}

// is called every time the connection state of a peer changes
- (void)session:(nonnull MCSession *)session peer:(nonnull MCPeerID *)peerID didChangeState:(MCSessionState)state {
    NSDictionary *userInfo = @{ @"peerID": peerID,
                                @"state" : @(state) };
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidChangeStateNotification"
                                                            object:nil
                                                          userInfo:userInfo];
    });
}

@end
