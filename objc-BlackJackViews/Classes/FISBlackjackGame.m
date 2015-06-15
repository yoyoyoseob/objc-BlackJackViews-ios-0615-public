//
//  FISBlackjackGame.m
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"
#import "FISBlackjackGameViewController.h"

@implementation FISBlackjackGame

-(instancetype)init
{
    self = [super init];
    if (self){
        _playingCardDeck = [[FISPlayingCardDeck alloc]init];
        _handScore = @0;
        _isBusted = NO;
        _hand = [[NSMutableArray alloc]init];
        _isBlackjack = NO;
    }
    return self;
}

-(void)hit
{
    if (!([self.hand count] == 0) && (self.isBusted == NO)){
        FISPlayingCard *randomCard = [self.playingCardDeck drawRandomCard];
        [self.hand addObject:randomCard];
        NSLog(@"You got a %@ of %@", randomCard.rank, randomCard.suit);
    }
}

-(void)deal
{
    // NSMutableString *cardsInHand = [[NSMutableString alloc]initWithString:@"You have a:"];
    
    for (NSUInteger i=0; i < 2; i++){
        FISPlayingCard *randomCard = [self.playingCardDeck drawRandomCard];
        [self.hand addObject:randomCard];
        // [cardsInHand appendFormat:@"\r%@ of %@", randomCard.rank, randomCard.suit];
        
    }

    // NSLog(@"%@", cardsInHand);
}

-(void)checkIfBusted
{
    NSLog(@"Your total is %@", self.handScore);
    
    if ([self.handScore integerValue] >= 22){
        self.isBusted = YES;
        NSLog(@"Busted!");
    }
    else if ([self.handScore integerValue] == 21){
        self.isBlackjack = YES;
        NSLog(@"Blackjack!");
    }
    else {
        self.isBusted = NO;
        self.isBlackjack = NO;
    }
}

-(void)calculateHandScore
{
    self.foundAce = NO;
    
    self.handScore = @0;
    
    for (FISPlayingCard *cards in self.hand){
        if ([cards.rank isEqual:@11] || [cards.rank isEqual:@12] || [cards.rank isEqual:@13]){
            self.handScore = [NSNumber numberWithInteger:(10 + [self.handScore integerValue])];
        }
        else if ([cards.rank isEqual:@1]){
            self.foundAce = YES;
            self.handScore = [NSNumber numberWithInteger:(1 + [self.handScore integerValue])];
        }
        else{
            self.handScore = [NSNumber numberWithInteger:([cards.rank integerValue] + [self.handScore integerValue])];
        }
    }
    if (([self.handScore integerValue] < 12) && self.foundAce == YES){
        self.handScore = [NSNumber numberWithInteger:(10 +[self.handScore integerValue])];
    }
}

-(void)setHand:(NSMutableArray *)hand
{
    _hand = hand;
    _handScore = @0;
    _isBusted = NO;
    _isBlackjack = NO;
    _foundAce = NO;
    
    [self calculateHandScore];
    [self checkIfBusted];
}

-(void)startNewGame
{
    self.handScore = @0;
    [self.hand removeAllObjects];
    self.foundAce = NO;
    self.isBlackjack = NO;
    self.isBusted = NO;
    self.playingCardDeck = [[FISPlayingCardDeck alloc]init];
}

@end
