//
//  Assets.m
//  RingSeq
//
//  Created by Nir Boneh on 10/12/14.
//  Copyright (c) 2014 Clouby. All rights reserved.
//

#import "Assets.h"
#import "Instrument.h"
#include <stdlib.h>
#import "ObjectAL.h"

@implementation Assets
static NSArray* ERASE_SOUNDS;
static NSArray *INSTRUMENTS;
+(void) initialize{
    [OALSimpleAudio sharedInstance].allowIpod = NO;
    
    // Mute all audio if the silent switch is turned on.
    [OALSimpleAudio sharedInstance].honorSilentSwitch = YES;
    
}

+(NSArray *)INSTRUMENTS{
    if(!INSTRUMENTS){
        NSMutableArray *instrumentMut = [[NSMutableArray alloc] init];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Acoustic Guitar" color: [UIColor redColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Electric Guitar" color: [UIColor blueColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Drums" color:[UIColor brownColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Bass" color:[UIColor greenColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Xylophone" color:[UIColor cyanColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Trumpet" color:[UIColor yellowColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Trombone" color:[UIColor magentaColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Saxophone" color:[UIColor orangeColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Orchestra Hit" color:[UIColor grayColor] ]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"High Piano" color:[UIColor purpleColor]]];
        [instrumentMut addObject:[[Instrument alloc] initWithName:@"Low Piano" color:[UIColor purpleColor] ]];
        INSTRUMENTS  = [[NSArray alloc]initWithArray:instrumentMut];
    }
    return INSTRUMENTS;
}


+(void) playEraseSound{
    if(!ERASE_SOUNDS){
        ERASE_SOUNDS = [[NSArray alloc] initWithObjects:@"delete1.wav", @"delete2.wav", @"delete3.wav",@"delete4.wav", nil];
    }
    [[OALSimpleAudio sharedInstance] playEffect:[ERASE_SOUNDS objectAtIndex: arc4random_uniform((int)ERASE_SOUNDS.count)]];
}

@end
