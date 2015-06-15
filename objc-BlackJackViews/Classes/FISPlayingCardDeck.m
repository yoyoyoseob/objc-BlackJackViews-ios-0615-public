//
//  FISPlayingCardDeck.m
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCardDeck.h"

@implementation FISPlayingCardDeck
-(instancetype)init
{
    self = [super init];
    if (self){
        _cards = [[NSMutableArray alloc] init];
        
        NSArray *arrayOfSuits = [NSArray arrayWithObjects:@"♥️", @"♠️", @"♣️", @"♦️", nil];
        
        for (NSString *suits in arrayOfSuits){
            for (NSInteger i = 1; i < 14; i++){
                _card = [[FISPlayingCard alloc] initWithSuit:suits rank:[NSNumber numberWithInteger:i]];
                [_cards addObject:_card];
            }
        }
    }
    return self;
}

-(FISPlayingCard *)drawRandomCard
{
    FISPlayingCard *randomCard = [[FISPlayingCard alloc]init];
    
    if ([self.cards count] > 0){
        uint32_t rnd = arc4random_uniform([self.cards count]);
        randomCard = [self.cards objectAtIndex:rnd];
        [self.cards removeObjectAtIndex:rnd];
    }
    return randomCard;
}


@end
