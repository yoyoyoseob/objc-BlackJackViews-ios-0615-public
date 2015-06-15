//
//  FISBlackjackGameViewController.h
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"
#import "FISPlayingCardDeck.h"
#import "FISPlayingCard.h"

@interface FISBlackjackGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *card1;
@property (weak, nonatomic) IBOutlet UILabel *card2;
@property (weak, nonatomic) IBOutlet UILabel *card3;
@property (weak, nonatomic) IBOutlet UILabel *card4;
@property (weak, nonatomic) IBOutlet UILabel *card5;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (nonatomic, strong) FISBlackjackGame *blackjackGame;
@property (nonatomic, strong) NSArray *arrayOfLabels;

-(IBAction)hit:(id)sender;
-(IBAction)deal:(id)sender;
-(void)updateUI;
-(void)updateCardLabels;
-(void)resetUILabels;

@end
