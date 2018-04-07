//
//  MLRadioStreamManager.h
//  MLRadioStream
//
//  Created by Matheus Stefanello Luz on 06/04/18.
//  Copyright © 2018 myaK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "MLRadioStream-Swift.h"

@interface MLRadioStreamManager : NSObject //<RCTBridgeModule>
+ (MLRadioStream *)sharedPlayer;
@end
