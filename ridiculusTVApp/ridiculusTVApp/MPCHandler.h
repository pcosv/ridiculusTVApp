//
//  MPCHandler.h
//  MPCDemo
//
//  Created by Paula Vaz on 21/09/2018.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

NS_ASSUME_NONNULL_BEGIN

// will be in charge of managing a multipeer session
@interface MPCHandler : NSObject <MCSessionDelegate>

// represents a peer in a multipeer session
@property (nonatomic, strong) MCPeerID *peerID;

// manage communication between peers in a session
@property (nonatomic, strong) MCSession *session;

// takes care of presenting nearby devices to the user and helps establishing a multipeer session.
@property (nonatomic, strong) MCBrowserViewController *browser;

// is used to help with advertising a peer to nearby devices
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;

- (void)setupPeerWithDisplayName:(NSString *)displayName;
- (void)setupSession;
- (void)setupBrowser;
- (void)advertiseSelf:(BOOL)advertise;

@end

NS_ASSUME_NONNULL_END
