//
//  FISPlayingCard.m
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCard.h"

@implementation FISPlayingCard

-(instancetype)init
{
    return [self initWithSuit:@"" rank:@0];
}

-(instancetype)initWithSuit:(NSString *)manualSuit rank:(NSNumber *)manualRank
{
    self = [super init];
    
    if (self){
        if ([manualSuit isEqualToString:@"♥️" ] || [manualSuit isEqualToString:@"♠️" ] || [manualSuit isEqualToString:@"♣️" ] || [manualSuit isEqualToString:@"♦️"]){
            _suit = manualSuit;
        }
        else {
            _suit = @"";
        }
        
        if ([manualRank integerValue] > 13){
            _rank = @0;
        }
        else {
            _rank = manualRank;
        }
    }
    
    return self;
    
}

-(void)setSuit:(NSString *)manualSuit
{
    if ([manualSuit isEqualToString:@"♥️" ] || [manualSuit isEqualToString:@"♠️" ] || [manualSuit isEqualToString:@"♣️" ] || [manualSuit isEqualToString:@"♦️"]){
        _suit = manualSuit;
    }
    else {
        _suit = @"";
    }
}

-(void)setRank:(NSNumber *)manualRank
{
    if ([manualRank integerValue] > 13){
        _rank = @0;
    }
    else {
        _rank = manualRank;
    }
}


@end
