//
//  AppDelegateTests.m
//  objc-BlackJackViews
//
//  Created by Al Tyus on 6/16/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISAppDelegate.h"


SpecBegin(FISBlackjackGame)


describe(@"FISAppDelegate", ^{
    
    beforeAll(^{
        
    });
    
    beforeEach(^{

    });
    
    describe(@"init", ^{
        it(@"should initialize a game with a deck handscore and hand", ^{

            
        });
    });
    describe(@"deal", ^{
        it(@"should deal two cards", ^{

        });
    });
    describe(@"hit", ^{
        it(@"should add one card to a dealt hand", ^{

        });
        it(@"should not hit if cards are not dealt", ^{

        });
        it(@"should not hit if hand is busted", ^{

        });
    });
    describe(@"isBusted", ^{
        it(@"should return YES if the handScore is greater than 21", ^{

        });
    });
    describe(@"hand", ^{
        it(@"should have an NSMutableArray property hand", ^{

        });
    });
    describe(@"handScore", ^{

        beforeEach(^{
        });
        it(@"should implement handScore", ^{
            expect(game).to.respondTo(@selector(handScore));
        });
        it(@"should return an NSNumber integer", ^{
        });
        it(@"should use ace as 11 whenever possible, but use ace as 1 if using it as an 11 would make the handscore greater than 21", ^{
            
        });
    });
});


SpecEnd