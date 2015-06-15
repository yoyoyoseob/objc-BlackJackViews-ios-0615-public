//
//  FISBlackjackGame.h
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : NSObject

@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck;
@property (strong, nonatomic) NSNumber *handScore; // Returns total value of cards (Ace = 1 || 11)
@property (strong, nonatomic) NSMutableArray *hand; // Returns cards in hands
@property (nonatomic) BOOL isBusted; // Returns YES if over 21
@property (nonatomic) BOOL isBlackjack; // Returns YES if handScore is 21
@property (nonatomic) BOOL foundAce;

// Initialize playingCardDeck with new deck, set handScore @0, isBusted = NO;
-(instancetype)init;

// Deal 2 new cards and add to NSMutableArray *hand
-(void)deal;

// Deal 1 card and add to NSMutableArray *hand
-(void)hit;

-(void)checkIfBusted;
-(void)calculateHandScore;
-(void)startNewGame;

@end
