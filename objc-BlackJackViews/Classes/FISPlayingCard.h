//
//  FISPlayingCard.h
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISPlayingCard : NSObject
@property (nonatomic, strong) NSString *suit;
@property (nonatomic, strong) NSNumber *rank;

-(instancetype)init;
-(instancetype)initWithSuit:(NSString*)suit rank:(NSNumber*)rank;

@end
