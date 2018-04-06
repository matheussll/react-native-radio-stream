//
//  MLRadioStreamManager.m
//  MLRadioStream
//
//  Created by Matheus Stefanello Luz on 06/04/18.
//  Copyright © 2018 myaK. All rights reserved.
//

#import "MLRadioStreamManager.h"

@implementation MLRadioStreamManager
+ (MLRadioStream *)sharedPlayer {
    static MLRadioStream *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[MLRadioStream alloc] init];
    });
    
    return _sharedInstance;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(play:(NSString *)stringUrl)
{
    [[MLRadioStreamManager sharedPlayer] playWithStreamUrl:stringUrl];
}

RCT_EXPORT_METHOD(stop)
{
    [[MLRadioStreamManager sharedPlayer] stop];
}

RCT_EXPORT_METHOD(setupRadio:(NSString *)radioTitle: (NSString *)radioArtist)
{
    [[MLRadioStreamManager sharedPlayer] setupRadioWithRadioTitle:radioTitle radioArtist:radioArtist];
}

RCT_EXPORT_METHOD(isPlaying:(RCTResponseSenderBlock)callback)
{
    BOOL isPlaying = [[MLRadioStreamManager sharedPlayer] isPlaying];
    callback(@[[NSNumber numberWithBool:isPlaying]]);
}
@end
