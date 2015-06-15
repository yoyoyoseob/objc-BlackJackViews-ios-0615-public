//
//  FISBlackjackGameViewController.m
//  objc-BlackJackViews
//
//  Created by Yoseob Lee on 6/11/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGameViewController.h"
#import "FISBlackjackGame.h"
#import "FISPlayingCardDeck.h"
#import "FISPlayingCard.h"

@interface FISBlackjackGameViewController ()


@end

@implementation FISBlackjackGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blackjackGame = [[FISBlackjackGame alloc]init];
    
    self.arrayOfLabels = [NSArray arrayWithObjects:self.card1, self.card2, self.card3, self.card4, self.card5, nil];
    
    [self.blackjackGame deal];
    
    for (NSUInteger i = 0; i < 2; i++){
        
        FISPlayingCard *dealCards = self.blackjackGame.hand[i];
        
        NSString *cardDisplay = [NSString stringWithFormat:@"%@ %@", dealCards.rank, dealCards.suit];
        
        [self editUILabels:i withDisplay:cardDisplay];
    }
    [self.blackjackGame calculateHandScore];
    [self.blackjackGame checkIfBusted];
    
    NSString *scoreDisplay = [NSString stringWithFormat:@"%@", self.blackjackGame.handScore];
    self.score.text = scoreDisplay;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





- (IBAction)hit:(id)sender
{
//    if (self.blackjackGame.isBlackjack){
//        [self ifBlackjack];
//    }
    
    //if (!(self.blackjackGame.isBusted) || (self.blackjackGame.isBlackjack)){
    if (![self.blackjackGame isBusted] && ![self.blackjackGame isBlackjack]) {
        [self.blackjackGame hit];
        [self updateUI];
    }
    else {
        NSLog(@"!!!");
        return;
    }
}

- (IBAction)deal:(id)sender
{
    self.result.text = @"";
    self.result.hidden = YES;
    
    [self.blackjackGame startNewGame];
    [self resetUILabels];
    [self.blackjackGame deal];
//    [self updateCardLabels];
    [self updateUI];
}

-(void)updateUI
{
    [self resetUILabels]; // CHECK WHY THIS WORKED TO PASS THAT INFERNAL TEST
    [self.blackjackGame calculateHandScore];
    [self updateCardLabels];
    [self.blackjackGame checkIfBusted];
    [self editResultLabel];
    NSString *scoreDisplay = [NSString stringWithFormat:@"%@", self.blackjackGame.handScore];
    self.score.text = scoreDisplay;
}

-(void)editResultLabel
{
    if (self.blackjackGame.isBusted == YES || self.blackjackGame.isBlackjack == YES){
        if (self.blackjackGame.isBusted == YES){
            NSString *resultDisplay = @"Busted!";
            self.result.text = resultDisplay;
            self.result.hidden = NO;
        }
        if (self.blackjackGame.isBlackjack == YES){
            NSString *resultDisplay = @"Blackjack!";
            self.result.text = resultDisplay;
            self.result.hidden = NO;
        }
    }
}

-(void)updateCardLabels
{
    for (NSUInteger i = 0; i < [self.blackjackGame.hand count]; i++){
        FISPlayingCard *dealCards = self.blackjackGame.hand[i];
        NSString *cardDisplay = [NSString stringWithFormat:@"%@ %@", dealCards.rank, dealCards.suit];
        [self editUILabels:i withDisplay:cardDisplay];
    }
}

-(void)editUILabels:(NSUInteger)number withDisplay:(NSString *)cardDisplay
{
    UILabel *labelToEdit = self.arrayOfLabels[number];
    labelToEdit.text = cardDisplay;
    labelToEdit.hidden = NO;
}

-(void)resetUILabels
{
    for (UILabel *labels in self.arrayOfLabels){
        labels.text = @"";
        labels.hidden = YES;
    }
}

@end
