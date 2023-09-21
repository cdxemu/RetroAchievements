// High Stakes Gambling
// #ID = 4210

// ************************************************************************************************
//                                   Memory Accessors/Value Dictionaries
// ************************************************************************************************

// $C206: [16-bit] Showing Bet Results?
//        (Craps)
//        0001 = no (player has control or during dice roll)
//        100c = yes (evaluating/showing results of bets following dice roll)
//function ShowingBetResults() => word(0x00C206)
//ShowingBetResultsDict = {"No": 0x0001, "Yes": 0x100c}

// $C236: [8-bit] Is Player's Card 1 Held
// $C23A: [8-bit] Is Player's Card 2 Held
// $C23E: [8-bit] Is Player's Card 3 Held
// $C242: [8-bit] Is Player's Card 4 Held
// $C246: [8-bit] Is Player's Card 5 Held
//        (Video Poker/Draw Poker)
//        00 = No (hold not yet selected)
//        03 = No (hold deselected or during 2nd draw)
//        05 = initial value at title screen
//        06 = Yes (hold selected)
//        1e/20/22/24/26 = at Shady
//        64/65/69 = during Jackpot payout
//function IsPlayersCard1Held() => byte(0x00C236)
//function IsPlayersCard2Held() => byte(0x00C23A)
//function IsPlayersCard3Held() => byte(0x00C23E)
//function IsPlayersCard4Held() => byte(0x00C242)
//function IsPlayersCard5Held() => byte(0x00C246)
//IsPlayersCardHeldDict = {"Not Selected": 0x00, "Deselected": 0x03, "Selected": 0x06}

// $C280: [8-bit] Bonus Item Y Position
//        (Slots)
//        00 = not visible or not at slot machine
//        20 = not visible (at craps table)
//        34 = above slot machine (pre-purchase)
//        60 = slot machine line 2 (top row)
//        70 = slot machine line 1 (middle row)
//        77 = not visible (at Shady)
//        80 = slot machine line 3 (bottom row)
//        90 = below slot machine (purchased)
function BonusItemYPosition() => byte(0x00C280)
BonusItemYPositionDict = {"NotVisible": 0x00, "Line2": 0x60, "Line1": 0x70, "Line3": 0x80} 

// $C281: [8-bit] Bonus Item X Position
//        (Slots)
//        00 = not visible or not at slot machine
//        10 = Player's slot machine column 1
//        28 = Player's slot machine column 2
//        40 = Player's slot machine column 3
//        4a-aa = not visible (at craps table)
//        4c = centered (pre-purchase)
//        5f = not visible (at Shady)
//        TBD = Opponent's slot machine
function BonusItemXPosition() => byte(0x00C281)
BonusItemXPositionDict = {"NotVisible": 0x00, "PlayerCol1": 0x10, "PlayerCol2": 0x28, "PlayerCol3": 0x40
}

// $C2AC: [8-bit] "Topmost" Card in Play?
//        (Blackjack/Draw Poker - see 0xcbec for list)
//        During deal: last card drawn
//        During cheat use: "See Next Card", "See Deal Down", or "Swap Card" (opponent's) card
//        Otherwise: dealer's face-up card (Blackjack) or last card in active hand (Draw Poker)
function TopmostCardRank() => high4(0x00C2AC)

// $C2AD: [8-bit] Active Hand Point Value
//        (Blackjack - can be player's main or split hand, opponent's hand, or dealer's hand)
function ActiveHandPointValue() => byte(0x00C2AD)

// $C2AE: [8-bit] Controller Input
//        (Bit Flags)
//        Bit0 = A
//        Bit1 = B
//        Bit2 = select
//        Bit3 = start
//        Bit4 = right
//        Bit5 = left
//        Bit6 = up
//        Bit7 = down
function ControllerInputAFlag() => bit0(0x00C2AE)

// $C2B1: [8-bit] Current Casino Game
//        (or last game played if went back to main menu)
//        00 = none
//        01 = Blackjack
//        02 = Craps
//        04 = Draw Poker
//        08 = Slots
//        10 = Video Poker
function CurrentCasinoGame() => byte(0x00C2B1)
CurrentCasinoGameDict = {"Blackjack": 0x01, "Craps": 0x02, "DrawPoker": 0x04, "Slots": 0x08, "VideoPoker": 0x10}

// $C2B2: [8-bit] Game State
//        (Note: The casino game gameplay is loaded for a moment before Shady.)
//        00 = Video Poker Gameplay
//        01 = Pre/Post-Mission Cutscene, Post-Mission Score Display, Continue Screen
//        02 = Pre-Mission Gangster Portrait
//        04 = Cash Prize Display (after casino game, if player won)
//        05 = Mode Select, Play/Password Select
//        06 = Shady
//        07 = Entry Fee/Ante Display, Competitive Slots Gameplay
//        08 = Blackjack/Draw Poker Gameplay
//        09 = Title Screen
//        0a = Password Screen (both entry and display-only)
//        0b = Score Card
//        20 = Copyright Screen (appears before Title Screen)
//        (Unmodified/Keeps Prev Value) = Practice Slots/Craps Gameplay, Practice Game Select, Credits, Pre-Mission Cash Display, Out of Cash Screen
function GameState() => byte(0x00C2B2)
GameStateDict = {"VideoPoker": 0x00, "MissionScore": 0x01, "GangsterPortrait": 0x02, "CashPrize": 0x04, "ModeOrPlayPasswordSelect": 0x05, "Shady": 0x06,
    "CompetitiveSlots":0x07, "BlackjackOrDrawPoker": 0x08, "TitleScreen": 0x09, "ScoreCard": 0x0B, "CopyrightScreen": 0x20
}

// $C2B4: [8-bit] Combined Dice Roll
//        (Craps)
function CombinedDiceRoll() => byte(0x00C2B4)

// $C2BC: [8-bit] Unknown Menu Property?
//        08 = Practice Mode Insurance Yes/No Menu
//        (many other values not noted/used)
function UnknownMenuProperty() => byte(0x00C2BC)
UnknownMenuPropertyDict = {"Insurance": 0x08}

// $C2C5: [8-bit] Game Progress Indicator?
//        (Upper4)
//        0 = No progress made in Practice Mode
//        1 = Made progress in Practice Mode
//        4 = Competitive Mode - Game Over just initiated?
//        (Lower4)
//        0 = Competitive Mode not started
//        6 = Competitive Mode started
// 
// Observed values:
//        00 = initial value/no game active
//        06 = started Competitive Mode (cleared upon return to copyright screen after Game Over/Ending)
//        10 = after exiting a casino game in Practice Mode
//        16 = started Competitive Mode after exiting a casino game in Practice Mode
//        46 = Game Over initiated in Competitive Mode (only for the first 8-9 frames of the "bad end" music, before the screen changes)
function CompetitiveProgressIndicator() => low4(0x00C2C5)
CompetitiveProgressIndicatorDict = {"Started": 0x6}

// $C2C6: [8-bit] Current Mission
//        (Temporarily Persistent - not cleared after Game Ending until Competitive Mode is restarted)
//        00 = Mission 1 (Machine Gun Max), Main Menu, Practice
//        01 = Mission 2 (Suitcase Sam)
//        02 = Mission 3 (Hitman Harry)
//        03 = Mission 4 (Lucky Louis)
//        04 = Mission 5 (Al Cologne)
function CurrentMission() => byte(0x00C2C6)

// $C2C7: [8-bit] Casino Game Mode?
//        (Temporarily Persistent - not cleared after Game Over/Ending until casino game gameplay starts)
//        00 = initial value, Practice Mode
//        04 = Competitive Mode
function CasinoGameMode() => byte(0x00C2C7)
CasinoGameModeDict = {"Practice": 0x00, "Competitive": 0x04}

// $C2C8: Is Opponent's Turn?
//        (Video Poker/Draw Poker)
//        00 = player (or neither) has control
//        01 = opponent/AI has control
function IsOpponentsTurn() => byte(0x00C2C8)

// $C2C9: [8-bit] Hand Number
//        (Blackjack/Video Poker/Draw Poker - 1-based value)
function HandNumber() => byte(0x00C2C9)

// $C2E0: [8-bit] Menu Type?
//        00 = Mode Select, Play/Password Select, Shady
//        02 = Shady Exit Menu, Casino Game Gameplay (when action menu or Craps table active)
//        03 = Practice Game Select, Casino Game Gameplay (when bet menu or Video Poker hold selection active), Continue Screen
//        06 = Craps Menu
//        80 = Copyright Screen, Title Screen
//        (Unmodified/Keeps Prev Value) - Password Screen, Pre/Post-Mission, Credits
function MenuType() => byte(0x00C2E0)
MenuTypeDict = {"ModeOrPlayPasswordSelect": 0x00, "CopyrightOrTitleScreen": 0x80}

// $C2EF: [8-bit] Menu Cursor Y Position
//        90 = Blackjack - Insurance-Yes
//        98 = Blackjack - Insurance-No
//        (many other values not noted/used)
function MenuCursorYPosition() => byte(0x00C2EF)
MenuCursorYPositionDict = {"InsuranceYes": 0x90, "InsuranceNo": 0x98}

// $C2F9: [8-bit] Draw Number
//        (Video Poker/Draw Poker - set once all cards for the draw have been dealt)
//        00 = initial value
//        01 = 1st draw
//        02 = 2nd draw
function DrawNumber() => byte(0x00C2F9)

// $CB45: [16-bit] Last Placed Bet Amount
//        (Draw Poker - from either player or opponent; the last bet/bet raise, or zero if pass/see bet/call)
function LastPlacedBetAmount() => word(0x00CB45)

// $CB79: [32-bit] Player's Mission 1 Cash Winnings
// $CB81: [32-bit] Player's Mission 2 Cash Winnings
// $CB6D: [32-bit] Player's Mission 3 Cash Winnings
// $CB7D: [32-bit] Player's Mission 4 Cash Winnings
// $CB71: [32-bit] Player's Mission 5 Cash Winnings
//        (Set at end of mission; not set when password loaded; doesn't include accumulated cash from previous missions)
function PlayersMission1CashWinnings() => dword(0x00CB79)
function PlayersMission2CashWinnings() => dword(0x00CB81)
function PlayersMission3CashWinnings() => dword(0x00CB6D)
function PlayersMission4CashWinnings() => dword(0x00CB7D)
function PlayersMission5CashWinnings() => dword(0x00CB71)

// $CB75: [32-bit] Player's Password Cash Winnings
//        (Set when password loaded - total cash winnings from completed missions in password data)
function PlayersPasswordCashWinnings() => dword(0x00CB75)

// $CB8F: [8-bit] Dealer's Hand Card Count
//        (Blackjack)
function DealersHandCardCount() => byte(0x00CB8F)

// $CB90: [8-bit] Dealer's Card 1
// $CB91: [8-bit] Dealer's Card 2
//        (Blackjack - see 0xcbec for list)
function DealersHandCardRank1() => high4(0x00CB90)
function DealersHandCardRank2() => high4(0x00CB91)

// $CBB2: [8-bit] Dealer's Hand Point Value
//        (Blackjack)
function DealersHandPointValue() => byte(0x00CBB2)

// $CBEB: [8-bit] Player's Hand Card Count
//        (Blackjack/Video Poker/Draw Poker)
function PlayersHandCardCount() => byte(0x00CBEB)

// $CBEC: [8-bit] Player's Hand Card 1
// $CBED: [8-bit] Player's Hand Card 2
// $CBEE: [8-bit] Player's Hand Card 3
// $CBEF: [8-bit] Player's Hand Card 4
// $CBF0: [8-bit] Player's Hand Card 5
//        (Blackjack/Video Poker/Draw Poker)
//        (Upper4) Rank: 2-9 = pips, a = 10, b = Jack, c = Queen, d = King, e = Ace, f = Joker
//        (Lower4) Suit: 0 = none, 2 = Hearts, 4 = Diamonds, 6 = Spades, 8 = Clubs
//        (Bit Flag) Bit0 = card is face-down
function PlayersHandCard1() => byte(0x00CBEC)
function PlayersHandCard2() => byte(0x00CBED)
function PlayersHandCard3() => byte(0x00CBEE)
function PlayersHandCard4() => byte(0x00CBEF)
function PlayersHandCard5() => byte(0x00CBF0)
function PlayersHandCardRank1() => high4(0x00CBEC)
function PlayersHandCardRank2() => high4(0x00CBED)
function PlayersHandCardRank3() => high4(0x00CBEE)
function PlayersHandCardRank4() => high4(0x00CBEF)
function PlayersHandCardRank5() => high4(0x00CBF0)
CardRankDict = {"Jack": 0xB, "Queen": 0xC, "King": 0xD, "Ace": 0xE, "Joker": 0xF}
function PlayersCard1FaceDownFlag() => bit0(0x00CBEC)
function PlayersCard2FaceDownFlag() => bit0(0x00CBED)
function PlayersCard3FaceDownFlag() => bit0(0x00CBEE)
function PlayersCard4FaceDownFlag() => bit0(0x00CBEF)
function PlayersCard5FaceDownFlag() => bit0(0x00CBF0)

// $CC0D: [8-bit] Player's Hand Result
//        (Blackjack - Bit Flags)
//        Bit0 = hand was BJ (if won) or Bust (if lost)
//        Bit1 = hands are split
//        Bit2 = hand doubled down
//        Bit3 = hand is active
//        Bit4 = hands are split aces
//        Bit5 = hand won
//        Bit6 = hand tied
//        Bit7 = hand won or tied
//        
//        (Draw Poker)
//        08 = Didn't Fold
//        09 = Fold
function PlayersHandResult() => byte(0x00CC0D)
function PlayersHandResult_IsSpecialFlag() => bit0(0x00CC0D)
function PlayersHandResult_IsSplitFlag() => bit1(0x00CC0D)
function PlayersHandResult_IsDoubleFlag() => bit2(0x00CC0D)
//function PlayersHandResult_IsActiveFlag() => bit3(0x00CC0D) // unneeded - main hand is always active
function PlayersHandResult_IsWonFlag() => bit5(0x00CC0D)
function PlayersHandResult_IsTiedFlag() => bit6(0x00CC0D)
function PlayersHandResult_IsWonOrTiedFlag() => bit7(0x00CC0D)
DrawPoker_HandResultDict = {"Fold": 0x09}

// $CC05: [32-bit] Player's Cash
//        (Blackjack/Video Poker/Draw Poker)
function PlayersCash() => dword(0x00CC05)

// $CC0E: [8-bit] Player's Hand Point Value
//        (Blackjack)
function PlayersHandPointValue() => byte(0x00CC0E)

// $CC16: [8-bit] Player's Hand Ranking
//        (Video Poker/Draw Poker - value updated after each draw or swap completed, not just at end of hand)
//        (Upper4) Hand ranking
//        0 = nothing
//        1 = one pair
//        2 = two pair
//        3 = 3 of a kind
//        4 = straight
//        5 = flush
//        6 = full house
//        7 = 4 of a kind
//        8 = straight flush
//        9 = royal flush
//        a = 5 of a kind
//        (Lower4) Highest card rank involved (see 0xcbec for list)
function PlayersHandRanking() => byte(0x00CC16)
Poker_HandRankingDict = {"PairOfJacks": 0x1b}
function PlayersHandRankingType() => high4(0x00CC16)
function PlayersHandRankingCardRank() => low4(0x00CC16)
Poker_HandRankingTypeDict = {"None": 0x0, "OnePair": 0x1, "TwoPair": 0x2, "3OfKind": 0x3, "Straight": 0x4, "Flush": 0x5,
    "FullHouse": 0x6, "4OfKind": 0x7, "StraightFlush": 0x8, "RoyalFlush": 0x9, "5OfKind": 0xa}

// $CC1D: [8-bit] Player's Cheat Card 1 Quantity
//        (Blackjack/Video Poker/Draw Poker - Swap Hand/Joker/Joker)
// $CC1E: [8-bit] Player's Cheat Card 2 Quantity
//        (Blackjack/Video Poker/Draw Poker - Swap Card/Swap Card/See Next Card)
// $CC1F: [8-bit] Player's Cheat Card 3 Quantity
//        (Blackjack/Video Poker - Ace/See Next Card)
// $CC20: [8-bit] Player's Cheat Card 4 Quantity
//        (Blackjack - King)
// $CC21: [8-bit] Player's Cheat Card 5 Quantity
//        (Blackjack - See Next Card)
// $CC22: [8-bit] Player's Cheat Card 6 Quantity
//        (Blackjack - See Deal Down)
function PlayersCheatCard1Quantity() => byte(0x00CC1D)
function PlayersCheatCard2Quantity() => byte(0x00CC1E)
function PlayersCheatCard3Quantity() => byte(0x00CC1F)
function PlayersCheatCard4Quantity() => byte(0x00CC20)
function PlayersCheatCard5Quantity() => byte(0x00CC21)
function PlayersCheatCard6Quantity() => byte(0x00CC22)

// $CC26: [8-bit] Card Draw/Hold Flags
//        (Video Poker/Draw Poker - Bit Flags; 0 = card held or already drawn, 1 = card not held/will be drawn)
//        Bit0 = Card 1
//        Bit1 = Card 2
//        Bit2 = Card 3
//        Bit3 = Card 4
//        Bit4 = Card 5
//function PlayersCard1DrawFlag() => bit0(0x00CC26)
//function PlayersCard2DrawFlag() => bit1(0x00CC26)
//function PlayersCard3DrawFlag() => bit2(0x00CC26)
//function PlayersCard4DrawFlag() => bit3(0x00CC26)
//function PlayersCard5DrawFlag() => bit4(0x00CC26)

// $CC2B: [32-bit] Player's Actual Payout
//        (Blackjack/Video Poker/Draw Poker)
function PlayersActualPayout() => dword(0x00CC2B)

// $CC2F: [16-bit] Player's Last Actual Bet Amount
//        (Blackjack/Draw Poker)
function PlayersLastActualBetAmount() => word(0x00CC2F)

// $CC33: [32-bit] Player's Current Mission Cash Total
//        (Excluding cash put into current casino game)
function PlayersCurrentMissionCashTotal() => dword(0x00CC33)

// $CC41: [8-bit] Player's Score Card Total (Draw Poker Credits AKA Draw Poker Points)
function PlayersScoreCardTotal() => byte(0x00CC41)

// $CC42: [8-bit] Player's Current Mission Games Won
//        (Temporarily Persistent - not cleared after Game Ending until number of Players is selected. Value = 1 if player won, 0 otherwise; all flags reset to 0 at start of each mission after the cutscene.)
//        (Bit Flags)
//        Bit0 = Blackjack
//        Bit2 = Draw Poker
//        Bit3 = Slots
//        Bit4 = Video Poker
function PlayerWonBlackjackFlag() => bit0(0x00CC42)
function PlayerWonDrawPokerFlag() => bit2(0x00CC42)
function PlayerWonSlotsFlag() => bit3(0x00CC42)
function PlayerWonVideoPokerFlag() => bit4(0x00CC42)

// $CC47: [8-bit] Player's Split Hand Card Count
//        (Blackjack - not cleared at end of hand)
function PlayersSplitHandCardCount() => byte(0x00CC47)

// $CC69: [8-bit] Player's Split Hand Result
//        (Blackjack - see 0xcc0d for list; if the split hand is inactive, the other bit values may vary and should be ignored)
function PlayersSplitHandResult() => byte(0x00CC69)
function PlayersSplitHandResult_IsSpecialFlag() => bit0(0x00CC69)
function PlayersSplitHandResult_IsActiveFlag() => bit3(0x00CC69)
function PlayersSplitHandResult_IsWonFlag() => bit5(0x00CC69)
function PlayersSplitHandResult_IsTiedFlag() => bit6(0x00CC69)
function PlayersSplitHandResult_IsWonOrTiedFlag() => bit7(0x00CC69)

// $CC6A: [8-bit] Player's Split Hand Point Value
//        (Blackjack)
function PlayersSplitHandPointValue() => byte(0x00CC6A)

// $CC79: [8-bit] Player's Cheat Coin 1 Quantity at Shady
//        (Slots - Sevens AKA Gold Coin; set to 0 upon exiting Shady)
// $CC7A: [8-bit] Player's Cheat Coin 2 Quantity at Shady
//        (Slots - Bars AKA Silver Coin; set to 1 upon exiting Shady)
function PlayersCheatCoin1QuantityAtShady() => byte(0x00CC79)
function PlayersCheatCoin2QuantityAtShady() => byte(0x00CC7A)

// $CCA3: [8-bit] Opponent's Hand Card Count
//        (Blackjack/Video Poker/Draw Poker)
function OpponentsHandCardCount() => byte(0x00CCA3)

// $CCBD: [32-bit] Opponent's Cash
//        (Blackjack/Video Poker/Draw Poker)
function OpponentsCash() => dword(0x00CCBD)

// $CCC5: [8-bit] Opponent's Hand Result
//        (Blackjack/Draw Poker - see 0xcc0d for list)
function OpponentsHandResult() => byte(0x00CCC5)
function OpponentsHandResult_IsSpecialFlag() => bit0(0x00CCC5)
function OpponentsHandResult_IsWonOrTiedFlag() => bit7(0x00CCC5)

// $CCC6: [8-bit] Opponent's Hand Point Value
//        (Blackjack)
function OpponentsHandPointValue() => byte(0x00CCC6)

// $CCCE: [8-bit] Opponent's Hand Ranking
//        (Video Poker/Draw Poker - value updated after each draw or swap completed, not just at end of hand)
//        (Upper4) Hand ranking (see 0xcc16 for list)
//        (Lower4) Highest card rank involved (see 0xcbec for list)
function OpponentsHandRanking() => byte(0x00CCCE)

// $CCD6: [8-bit] Opponent's Cheat Card 2 Quantity
//        (Blackjack/Video Poker/Draw Poker - Swap Card/Swap Card/See Next Card)
function OpponentsCheatCard2Quantity() => byte(0x00CCD6)

// $CCE7: [16-bit] Opponent's Last Actual Bet Amount
//        (Blackjack/Draw Poker)
function OpponentsLastActualBetAmount() => word(0x00CCE7)

// $CCFF: [8-bit] Opponent's Split Hand Card Count
// (Blackjack)
function OpponentsSplitHandCardCount() => byte(0x00CCFF)

// $CD21: [8-bit] Opponent's Split Hand Result
//        (Blackjack - see 0xcc0d for list; if the split hand is inactive, the other bit values may vary and should be ignored)
function OpponentsSplitHandResult() => byte(0x00CD21)
function OpponentsSplitHandResult_IsSpecialFlag() => bit0(0x00CD21)
function OpponentsSplitHandResult_IsWonOrTiedFlag() => bit7(0x00CD21)

// $CD22: [8-bit] Opponent's Split Hand Point Value
//        (Blackjack)
function OpponentsSplitHandPointValue() => byte(0x00CD22)

// $D444: [8-bit] Player's Bet Multiplier
//        (Slots - range: 1-3, or 0 when no bet)
function SlotsPlayersBetMultiplier() => byte(0x00D444)

// $D446: [8-bit] Spin Number
//        (Slots - 0-based value)
function SpinNumber() => byte(0x00D446)

// $D44D: [16-bit] Player's Reel 1 Position
//        (Slots - list denotes the symbols from top to bottom when the reel stops, unless replaced with a cheat/bonus item)
//        0000 = orange/cherry/bell
//        0010 = cherry/bell/plum
//        0020 = bell/plum/orange
//        0030 = plum/orange/melon
//        0040 = orange/melon/plum
//        0050 = melon/plum/bar
//        0060 = plum/bar/melon
//        0070 = bar/melon/seven
//        0080 = melon/seven/orange
//        0090 = seven/orange/cherry
//        00a0 = orange/cherry/plum
//        00b0 = cherry/plum/cherry
//        00c0 = plum/cherry/bell
//        00d0 = cherry/bell/melon
//        00e0 = bell/melon/orange
//        00f0 = melon/orange/cherry
//        0100 = orange/cherry/bar
//        0110 = cherry/bar/plum
//        0120 = bar/plum/orange
//        0130 = plum/orange/cherry
function PlayersReel1Position() => word(0x00D44D)

// $D459: [16-bit] Player's Payout Line 1 Bet Multiplier
// $D45B: [16-bit] Player's Payout Line 2 Bet Multiplier
// $D45D: [16-bit] Player's Payout Line 3 Bet Multiplier
//        (Slots - not set until end of spin)
function PlayersPayoutLine1BetMultiplier() => word(0x00D459)
function PlayersPayoutLine2BetMultiplier() => word(0x00D45B)
function PlayersPayoutLine3BetMultiplier() => word(0x00D45D)
// Slots Payouts (from Game Manual):
// Cherry-Any-Any       = 2x
// Cherry-Cherry-Any    = 5x
// Cherry-Cherry-Cherry = 10x
// Orange-Orange-Any    = 12x
// Orange-Orange-Orange = 15x
// Plum-Plum-Plum       = 20x
// Melon-Melon-Melon    = 25x
// Bell-Bell-Bell       = 50x
// Bar-Bar-Bar          = 100x
// 7-7-7                = 200x
// 7-7-7 (3rd line)     = Jackpot (multiplier not set)
SlotsPayoutMultiplierDict = {"1Cherry": 2, "2Cherry": 5, "3Cherry": 10, "2Orange": 12, "3Orange": 15, "3Plum": 20, "3Melon": 25, "3Bell": 50, "3Bar": 100, "777": 200}

// $D490: [8-bit] Player's Cheat Coin 1 Quantity
//        (Slots - Sevens AKA Gold Coin; initial value 4; set after exiting Shady; decremented when spin starts if cheat used)
function PlayersCheatCoin1Quantity() => byte(0x00D490)

// $D491: [8-bit] Player's Cheat Coin 2 Quantity
//        (Slots - Bars AKA Silver Coin; initial value 0; set after exiting Shady; decremented when spin starts if cheat used)
function PlayersCheatCoin2Quantity() => byte(0x00D491)

// $D4D6: [16-bit] "Pass" Bet Amount
// $D4D8: [16-bit] "Don't Pass" Bet Amount
// $D4DA: [16-bit] "Odds Come 4" Bet Amount
// $D4DC: [16-bit] "Odds Come 5" Bet Amount
// $D4DE: [16-bit] "Odds Come 6" Bet Amount
// $D4E0: [16-bit] "Odds Come 8" Bet Amount
// $D4E2: [16-bit] "Odds Come 9" Bet Amount
// $D4E4: [16-bit] "Odds Come 10" Bet Amount
// $D4E6: [16-bit] "Odds Don't Come 4" Bet Amount
// $D4E8: [16-bit] "Odds Don't Come 5" Bet Amount
// $D4EA: [16-bit] "Odds Don't Come 6" Bet Amount
// $D4EC: [16-bit] "Odds Don't Come 8" Bet Amount
// $D4EE: [16-bit] "Odds Don't Come 9" Bet Amount
// $D4F0: [16-bit] "Odds Don't Come 10" Bet Amount
// $D4F2: [16-bit] "Come" Bet Amount
// $D4F4: [16-bit] "Don't Come" Bet Amount
// $D4F6: [16-bit] "Lay 4" Bet Amount
// $D4F8: [16-bit] "Lay 5" Bet Amount
// $D4FA: [16-bit] "Lay 6" Bet Amount
// $D4FC: [16-bit] "Lay 8" Bet Amount
// $D4FE: [16-bit] "Lay 9" Bet Amount
// $D501: [16-bit] "Lay 10" Bet Amount
// $D502: [16-bit] "Seven" Bet Amount
// $D504: [16-bit] "Buy 4" Bet Amount
// $D506: [16-bit] "Buy 5" Bet Amount
// $D508: [16-bit] "Buy 6" Bet Amount
// $D50A: [16-bit] "Buy 8" Bet Amount
// $D50C: [16-bit] "Buy 9" Bet Amount
// $D50E: [16-bit] "Buy 10" Bet Amount
// $D510: [16-bit] "Hard 4" Bet Amount
// $D512: [16-bit] "Hard 10" Bet Amount
// $D514: [16-bit] "Place 4" Bet Amount
// $D516: [16-bit] "Place 5" Bet Amount
// $D518: [16-bit] "Place 6" Bet Amount
// $D51A: [16-bit] "Place 8" Bet Amount
// $D51C: [16-bit] "Place 9" Bet Amount
// $D51E: [16-bit] "Place 10" Bet Amount
// $D520: [16-bit] "Hard 6" Bet Amount
// $D522: [16-bit] "Hard 8" Bet Amount
// $D524: [16-bit] "Craps 2" Bet Amount
// $D526: [16-bit] "Horn" Bet Amount
// $D528: [16-bit] "Craps 12" Bet Amount
// $D52A: [16-bit] "Big 6" Bet Amount
// $D52C: [16-bit] "Field" Bet Amount
// $D52E: [16-bit] "Craps 3" Bet Amount
// $D530: [16-bit] "Yoleven" Bet Amount
// $D532: [16-bit] "Big 8" Bet Amount
// $D534: [16-bit] "Any Craps" Bet Amount
// $D536: [16-bit] "C and E" Bet Amount
// $D59A: [16-bit] "Pass Odds" Bet Amount
// $D59C: [16-bit] "Don't Pass Odds" Bet Amount
//        (Craps)
function PassBetAmount() => word(0x00D4D6)
function DontPassBetAmount() => word(0x00D4D8)
function ComeBetAmount() => word(0x00D4F2)
function DontComeBetAmount() => word(0x00D4F4)
function OddsCome4BetAmount() => word(0x00D4DA)
function OddsCome5BetAmount() => word(0x00D4DC)
function OddsCome6BetAmount() => word(0x00D4DE)
function OddsCome8BetAmount() => word(0x00D4E0)
function OddsCome9BetAmount() => word(0x00D4E2)
function OddsCome10BetAmount() => word(0x00D4E4)
function OddsDontCome4BetAmount() => word(0x00D4E6)
function OddsDontCome5BetAmount() => word(0x00D4E8)
function OddsDontCome6BetAmount() => word(0x00D4EA)
function OddsDontCome8BetAmount() => word(0x00D4EC)
function OddsDontCome9BetAmount() => word(0x00D4EE)
function OddsDontCome10BetAmount() => word(0x00D4F0)
function Lay4BetAmount() => word(0x00D4F6)
function Lay5BetAmount() => word(0x00D4F8)
function Lay6BetAmount() => word(0x00D4FA)
function Lay8BetAmount() => word(0x00D4FC)
function Lay9BetAmount() => word(0x00D4FE)
function Lay10BetAmount() => word(0x00D501)
function SevenBetAmount() => word(0x00D502)
function Buy4BetAmount() => word(0x00D504)
function Buy5BetAmount() => word(0x00D506)
function Buy6BetAmount() => word(0x00D508)
function Buy8BetAmount() => word(0x00D50A)
function Buy9BetAmount() => word(0x00D50C)
function Buy10BetAmount() => word(0x00D50E)
function Hard4BetAmount() => word(0x00D510)
function Hard10BetAmount() => word(0x00D512)
function Place4BetAmount() => word(0x00D514)
function Place5BetAmount() => word(0x00D516)
function Place6BetAmount() => word(0x00D518)
function Place8BetAmount() => word(0x00D51A)
function Place9BetAmount() => word(0x00D51C)
function Place10BetAmount() => word(0x00D51E)
function Hard6BetAmount() => word(0x00D520)
function Hard8BetAmount() => word(0x00D522)
function Craps2BetAmount() => word(0x00D524)
function HornBetAmount() => word(0x00D526)
function Craps12BetAmount() => word(0x00D528)
function Big6BetAmount() => word(0x00D52A)
function FieldBetAmount() => word(0x00D52C)
function Craps3BetAmount() => word(0x00D52E)
function YolevenBetAmount() => word(0x00D530)
function Big8BetAmount() => word(0x00D532)
function AnyCrapsBetAmount() => word(0x00D534)
function CAndEBetAmount() => word(0x00D536)
function PassOddsBetAmount() => word(0x00D59A)
function DontPassOddsBetAmount() => word(0x00D59C)

// $D646: [8-bit] Practice - Spin Counter
//        (Practice Mode Slots - value starts at 1 and increments each spin, otherwise initial value is 0x20 and last value persists)
function PracticeSpinCounter() => byte(0x00D646)

// $D64A: [16-bit BE] Player's Actual Bet Amount (BCD)
//        (Slots - pre-multipler value; in Competitive Mode, defaults to 100 at start of each spin before bet placed)
function PlayersActualBetAmountBCD() => word_be(0x00D64A)

// $D659: [8-bit] Is Player's Turn?
//        (Craps)
//        00 = player control paused (during dice roll, showing bet results, or changing bet amount)
//        01 = player has control of craps table
function IsCrapsPlayersTurn() => byte(0x00D659)

// $FFB7: [8-bit] Is Casino Game Active?
//        00 = no (initial value; set when Competitive Mode casino game ends; also set at title screen)
//        01 = yes (set when Practice or Competitive Mode casino game starts; also set during game ending)
function IsCasinoGameActive() => byte(0x00FFB7)

// $FFCC: [8-bit] Current Bet Type
//        (Craps - bet currently highlighted by player or being evaluated)
//        00/01 = Pass (or Pass Odds)/Don't Pass (or Don't Pass Odds)
//        02-07 = Odds Come 4/5/6/8/9/10
//        08-0d = Odds Don't Come 4/5/6/8/9/10
//        0e/0f = Come/Don't Come
//        10-15 = Lay 4/5/6/8/9/10
//        16 = Seven
//        17-1c = Buy 4/5/6/8/9/10
//        1d/1e = Hard 4/10
//        1f-24 = Place 4/5/6/8/9/10
//        25/26 = Hard 6/8
//        27 = Craps 2
//        28 = Horn
//        29 = Craps 12
//        2a = Big 6
//        2b = Field
//        2c = Craps 3
//        2d = Yoleven
//        2e = Big 8
//        2f = Any Craps
//        30 = C and E
//        88 = (none being evaluated - during dice roll/bet evaluation)
//        ff = (none highlighted - during player's turn)
//        (Note: "Come" and "Don't Come" are evaluated even when those bets are not in play, and are always evaluated first. I suspect the reason
//        is related to them being the only bets that cause a different bet ("Odds Come" or "Odds Don't Come") to be added during bet evaluation,
//        even though those added bets won't be active until the next roll. Some other bets are also evaluated even when no bet is placed/active on them,
//        such as those on the right side of the table, but only sometimes.)
function CrapsBetType() => byte(0x00FFCC)
CrapsBetTypeDict = {"Pass":0x00, "DontPass":0x01, "PassOdds":0x00, "DontPassOdds": 0x01,
    "OddsCome4": 0x02, "OddsCome5": 0x03, "OddsCome6": 0x04, "OddsCome8": 0x05, "OddsCome9": 0x06, "OddsCome10": 0x07,
    "OddsDontCome4": 0x08, "OddsDontCome5": 0x09, "OddsDontCome6": 0x0a, "OddsDontCome8": 0x0b, "OddsDontCome9": 0x0c, "OddsDontCome10": 0x0d,
    "Come": 0x0e, "DontCome": 0x0f,
    "Lay4": 0x10, "Lay5": 0x11, "Lay6": 0x12, "Lay8": 0x13, "Lay9": 0x14, "Lay10": 0x15,
    "Seven": 0x16,
    "Buy4": 0x17, "Buy5": 0x18, "Buy6": 0x19, "Buy8": 0x1a, "Buy9": 0x1b, "Buy10": 0x1c,
    "Hard4": 0x1d, "Hard10": 0x1e,
    "Place4": 0x1f, "Place5": 0x20, "Place6": 0x21, "Place8": 0x22, "Place9": 0x23, "Place10": 0x24,
    "Hard6": 0x25, "Hard8": 0x26, "Craps2": 0x27, "Horn": 0x28, "Craps12": 0x29, "Big6": 0x2a, "Field": 0x2b, "Craps3": 0x2c,
    "Yoleven": 0x2d, "Big8": 0x2e, "AnyCraps": 0x2f, "CAndE": 0x30}

// $FFC9: [8-bit] Established Point Number
//        (Craps)
function EstablishedPointNumber() => byte(0x00FFC9)

// $FFCE: [8-bit] Spin/Roll Outcome Flags
//        (Slots - Bit Flags; bits 2-7 set when reels stop, but not otherwise cleared)
//        Bit0 = Competitive Mode
//        Bit1 = Practice Mode spin in progress (set when reels start, cleared when reels stop)
//        Bit2 = Player line 1 won
//        Bit3 = Player line 2 won
//        Bit4 = Player line 3 won
//        Bit5 = Opponent line 1 won
//        Bit6 = Opponent line 2 won
//        Bit7 = Opponent line 3 won
//        
//        (Craps - Bit Flags)
//        Bit1 = always 1 during game?
//        Bit2 = always 1 after first roll starts?
//        Bit3 = current bet result being evaluated was won
function IsCrapsBetWon() => bit3(0x00FFCE)

// $FFCF: [8-bit] Jackpot/Cheat Flags
//        (Slots - Bit Flags)
//        Bit1 = Player won jackpot (cleared on payout)
//        Bit2 = Opponent won jackpot (cleared on payout)
//        Bit3 = Competitive Mode
//        Bit4 = Player used a cheat this spin (cleared on next spin)
//        Not tracked - Opponent used cheat
function SlotsPlayerWonJackpotFlag() => bit1(0x00FFCF)

// $FFD1: [32-bit BE] Player's Cash (BCD)
//        (Slots/Craps)
function PlayersCashBCD() => dword_be(0x00FFD1)

// $FFD9: [32-bit BE] Player's Currently Displayed Bet/Payout Amount (BCD)
//        (Slots)
//function PlayersCurrentBetPayoutAmountBcd() => dword_be(0x00FFD9)

// ************************************************************************************************
//                                   Helper Functions (General)
// ************************************************************************************************

function Changed(val) => val != prev(val)
function Unchanged(val) => val == prev(val)
function Increased(val) => val > prev(val)
function Decreased(val) => val < prev(val)
function ZeroedOut(val) => val == 0 && prev(val) > 0

function DisplayedMissionNumber() => CurrentMission() + 1

function IsPlayingBlackjack() => CurrentCasinoGame() == CurrentCasinoGameDict["Blackjack"]
function IsPlayingSlots() => CurrentCasinoGame() == CurrentCasinoGameDict["Slots"]
function IsPlayingVideoPoker() => CurrentCasinoGame() == CurrentCasinoGameDict["VideoPoker"]
function IsPlayingDrawPoker() => CurrentCasinoGame() == CurrentCasinoGameDict["DrawPoker"]
function IsPlayingCraps() => CurrentCasinoGame() == CurrentCasinoGameDict["Craps"]
function IsPlayingPoker() => __ornext(IsPlayingDrawPoker() || IsPlayingVideoPoker())

function IsPracticeMode() => CasinoGameMode() == CasinoGameModeDict["Practice"]
function IsCompetitiveMode() => CompetitiveProgressIndicator() == CompetitiveProgressIndicatorDict["Started"]

function GetGangsterName(mission_num) {
    if (mission_num == 1)
        return "Machine Gun Max"
    else if (mission_num == 2)
        return "Suitcase Sam"
    else if (mission_num == 3)
        return "Hitman Harry"
    else if (mission_num == 4)
        return "Lucky Louis"
    else if (mission_num == 5)
        return "Al Cologne"
}

FinalCasinoGameName = "Draw Poker"

function GetCasinoGameName(casino_game_num) {
    // game_num = sequential order that the casino game appears in competitive mode
    if (casino_game_num == 1)
        return "Blackjack"
    else if (casino_game_num == 2)
        return "Slots"
    else if (casino_game_num == 3)
        return "Video Poker"
    else if (casino_game_num == 4)
        return "Draw Poker"
}

function PlayerWonCasinoGameThisFrame(casino_game_name) {
    if (casino_game_name == "Blackjack")
        return Increased(PlayerWonBlackjackFlag())
    else if (casino_game_name == "Slots")
       return Increased(PlayerWonSlotsFlag())
    else if (casino_game_name == "Video Poker")
        return Increased(PlayerWonVideoPokerFlag())
    else if (casino_game_name == "Draw Poker")
        return Increased(PlayerWonDrawPokerFlag())
}

function PlayerWonAllCasinoGamesThisFrame() {
    return PlayerWonBlackjackFlag() == 1 &&
           PlayerWonSlotsFlag() == 1 &&
           PlayerWonVideoPokerFlag() == 1 &&
           Increased(PlayerWonDrawPokerFlag())
}

function PlayerWonHand_ThisFrame() {
    HavePayout = PlayersActualPayout() > 0
    CashIncreasedByPayout = PlayersCash() == prev(PlayersCash()) + PlayersActualPayout()
    return HavePayout && CashIncreasedByPayout
    // Original version was just checking if Player's Cash increased, but would falsely trigger if player decreased their bet while choosing bet amount
    // Increased(PlayersCash())
    // Increased(PlayersActualPayout())
}

function IsAtScreen(screen) => GameState() == GameStateDict[screen]
function IsAtMenu(menu) => MenuType() == MenuTypeDict[menu]

function StartedCasinoGameThisFrame(casino_game_name) {
    if (casino_game_name == "Blackjack")
        return Changed(CurrentCasinoGame()) && IsPlayingBlackjack()
    else if (casino_game_name == "Slots")
        return Changed(CurrentCasinoGame()) && IsPlayingSlots()
    else if (casino_game_name == "Video Poker")
        return Changed(CurrentCasinoGame()) && IsPlayingVideoPoker()
    else if (casino_game_name == "Draw Poker")
        return Changed(CurrentCasinoGame()) && IsPlayingDrawPoker()
    else if (casino_game_name == "Craps")
        return Changed(CurrentCasinoGame()) && IsPlayingCraps()        
}

// Competitive Mode only - currently unused
//function EndedCasinoGameThisFrame(casino_game_name) {
//    if (casino_game_name == "Blackjack")
//        PrevScreen = GameStateDict("BlackjackOrDrawPoker")
//    else if (casino_game_name == "Slots")
//        PrevScreen = GameStateDict("CompetitiveSlots")
//    else if (casino_game_name == "Video Poker")
//        PrevScreen = GameStateDict("VideoPoker")
//    else if (casino_game_name == "Draw Poker")
//        PrevScreen = GameStateDict("BlackjackOrDrawPoker")
//
//    CurScreen = __ornext(IsAtScreen("CashPrize") || IsAtScreen("ScoreCard"))    
//    return prev(GameState()) == PrevScreen && GameState() == CurScreen
//}

// Competitive Mode only - Practice casino games do not clear this value at the end
function EndedCasinoGameThisFrame() => Decreased(IsCasinoGameActive())

function StartedMissionThisFrame() {
    // The Gangster Portrait screen seems to be the most consistent and easily identifiable way to determine a mission has started
    return IsAtScreen("GangsterPortrait") && Changed(GameState())
}

function StartedCompetitiveModeThisFrame() {
   return IsCompetitiveMode() &&
          prev(CompetitiveProgressIndicator()) != CompetitiveProgressIndicatorDict["Started"]
}

function StartedCompetitiveModeNewGameThisFrame() {
   return StartedCompetitiveModeThisFrame() && DisplayedMissionNumber() == 1
}

function WonMissionThisFrame() {
    return PlayerWonCasinoGameThisFrame(FinalCasinoGameName)
//    && CasinoGameEnded(FinalCasinoGameName)
}

function WonCompetitiveModeThisFrame() {
    FinalMissionNum = 5
    return IsCompetitiveMode() && DisplayedMissionNumber() == FinalMissionNum && WonMissionThisFrame()
}

//function CasinoGameEnded(casino_game_name) {
//    FinalCasinoGameName = "Draw Poker"
//    if (casino_game_name == FinalCasinoGameName)
//        // Beating the final casino game of the mission will show the mission score screen
//        return IsAtScreen("MissionScore") &&
//               // Only check at start to avoid false triggering because mission number will change partway through
//               prev(GameState()) != GameStateDict["MissionScore"]
//     else
//        // Beating a preliminary casino game will show the score card screen
//        return IsAtScreen("ScoreCard")
//}

function UsedCompetitiveModePassword() {
    // Password protection: can check if have any password-loaded cash winnings, since any real password will have some
    // alternatively, we might be able to check if previously at password entry screen before game started, but I think it is difficult because
    // that screen shares the same "Game State" value as the password display screen at the end of a mission
    // Caveat: not protect against potential fake/hacked passwords with no cash winnings (if such a thing exists)
    return PlayersPasswordCashWinnings() > 0

    // Older version - not a reliable way to check (see code note for more info)
//    return WasCompetitiveModePasswordUsed() == WasCompetitiveModePasswordUsedDict["NotUsed"]    
}

function Winnings(mission) {
    if (mission == 1)
        return PlayersMission1CashWinnings()
    else if (mission == 2)
        return PlayersMission2CashWinnings()
    else if (mission == 3)
        return PlayersMission3CashWinnings()
    else if (mission == 4)
        return PlayersMission4CashWinnings()
    else if (mission == 5)
        return PlayersMission5CashWinnings()
}

function TotalMissionWinnings() {
    return Winnings(1) + Winnings(2) + Winnings(3) + Winnings(4) +  Winnings(5)
}

function AnyMissionWinningsAtLeast(cash_amount) {
    return (Increased(Winnings(1)) && Winnings(1) >= cash_amount) ||
           (Increased(Winnings(2)) && Winnings(2) >= cash_amount) ||
           (Increased(Winnings(3)) && Winnings(3) >= cash_amount) ||
           (Increased(Winnings(4)) && Winnings(4) >= cash_amount) ||
           (Increased(Winnings(5)) && Winnings(5) >= cash_amount)
}

//function TotalCheatCardQuantity() {
//    return PlayersCheatCard1Quantity() + PlayersCheatCard2Quantity() + PlayersCheatCard3Quantity() + PlayersCheatCard4Quantity() + PlayersCheatCard5Quantity() +
//           PlayersCheatCard6Quantity()
//           // + PlayersCheatCoin1QuantityAtShady() + PlayersCheatCoin2QuantityAtShady()
//}

function PlayerPurchasedCheat(slots_only) {
    // We check if these are equal to 1 (or 2) rather than using >= because:
    // * Cheats must be purchased one at a time, so it should always hit quantity 1 first. (Exception: Cheat Coin qty can increase directly from 0 to 2
    //   upon exiting Shady)
    // * These values aren't always zeroed out when the player hasn't purchased any cheats. More specifically, they all have value 0xff when the game
    //   is initialized, and Cheat Coin 1 Quantity is reset to 0x04 on a new game (until Slots starts) for seemingly no reason.
    CheatCardPurchased = PlayersCheatCard1Quantity() == 1 || PlayersCheatCard2Quantity() == 1 || PlayersCheatCard3Quantity() == 1 ||
                         PlayersCheatCard4Quantity() == 1 || PlayersCheatCard5Quantity() == 1 || PlayersCheatCard6Quantity() == 1
    CheatCoinPurchased = PlayersCheatCoin1Quantity() == 1 || PlayersCheatCoin2Quantity() == 1 ||
                         PlayersCheatCoin1Quantity() == 2 || PlayersCheatCoin2Quantity() == 2
    
    if (slots_only == true)
        return CheatCoinPurchased
    else
        return CheatCardPurchased || CheatCoinPurchased
//    return TotalCheatCardQuantity() > 0 || SlotsPlayer_PurchasedCheat()
}

function PlayerPurchasedCheatThisFrame() {
    return Increased(PlayersCheatCard1Quantity()) || Increased(PlayersCheatCard2Quantity()) || Increased(PlayersCheatCard3Quantity()) ||
           Increased(PlayersCheatCard4Quantity()) || Increased(PlayersCheatCard5Quantity()) || Increased(PlayersCheatCard6Quantity()) ||
           // Use Cheat Coin Quantity at Shady because the other (in-game) cheat coin quantity is not set until Shady was exited
           // It is unreliable in that it may not be reset consistently when exiting Shady, but it should be sufficient for tracking purchases (when its value increases)
           Increased(PlayersCheatCoin1QuantityAtShady()) || Increased(PlayersCheatCoin2QuantityAtShady())
//           Increased(PlayersCheatCoin1Quantity()) || Increased(PlayersCheatCoin2Quantity())
}

// Cheats available per mission by casino game
//     Blackjack:   6 types * 2 qty * 2 Shady visits = 24
//     Slots:       2 types * 2 qty * 2 Shady visits =  8
//     Video Poker: 3 types * 2 qty * 2 Shady visits = 12
//     Draw Poker:  2 types * 1 qty * 2 Shady visits =  4
//     --------------------------------------------------
//     Per-Mission Total                             = 48
// Note: While you can revisit Shady during rounds 1 & 6, it's not possible to repurchase a cheat after it was used that round.
MaxCheatsPerMission = 48

// ************************************************************************************************
//                             Helper Functions (Casino Game-Specific)
// ************************************************************************************************

function BlackjackPlayer_WonMainHand() => PlayersHandResult_IsWonFlag() == 1 // && PlayersHandResult_IsActiveFlag() == 1
function BlackjackPlayer_WonSplitHand() => PlayersSplitHandResult_IsActiveFlag() == 1 && PlayersSplitHandResult_IsWonFlag() == 1
function BlackjackPlayer_WonMainHandWithBlackjack() => BlackjackPlayer_WonMainHand() && PlayersHandResult_IsSpecialFlag() == 1
function BlackjackPlayer_WonSplitHandWithBlackjack() => BlackjackPlayer_WonSplitHand() && PlayersSplitHandResult_IsSpecialFlag() == 1
function BlackjackPlayer_WonMainHandWithBlackjackThisFrame() => Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHandWithBlackjack()
function BlackjackPlayer_WonSplitHandWithBlackjackThisFrame() => Changed(PlayersSplitHandResult()) && BlackjackPlayer_WonSplitHandWithBlackjack()
function BlackjackPlayer_WonEitherWithBlackjackThisFrame() => BlackjackPlayer_WonMainHandWithBlackjackThisFrame() ||  BlackjackPlayer_WonSplitHandWithBlackjackThisFrame()

function BlackjackPlayer_WonMainHandThisFrame() => Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHand()
function BlackjackPlayer_WonSplitHandThisFrame() => Changed(PlayersSplitHandResult()) && BlackjackPlayer_WonSplitHand()
//function BlackjackPlayer_WonEitherHandThisFrame() => BlackjackPlayer_WonMainHandThisFrame() || BlackjackPlayer_WonSplitHandThisFrame()

function BlackjackPlayer_WonBothSplitHandsThisFrame() {
    return PlayersHandResult_IsSplitFlag() == 1  && Changed(PlayersSplitHandResult()) && 
           BlackjackPlayer_WonMainHand()  && BlackjackPlayer_WonSplitHand()
}

function BlackjackPlayer_DoubledDownAndWonThisFrame() {
    // Note: the game does not let you double down after a split, so we don't need to check the split hand
    return PlayersHandResult_IsDoubleFlag() == 1 && Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHand()
}

function BlackjackPlayer_BoughtInsurance() {
    // I was unable to find any memory addresses that track whether insurance was purchased/refused, despite my best efforts,
    // so instead I check for the button press event when "Yes" or "No" is selected in the "Insurance?" menu
    return MenuCursorYPosition() == MenuCursorYPositionDict["InsuranceYes"] && UnknownMenuProperty() == UnknownMenuPropertyDict["Insurance"] &&
           ControllerInputAFlag() == 1
}

function BlackjackPlayer_DeclinedInsurance() {
    return MenuCursorYPosition() == MenuCursorYPositionDict["InsuranceNo"] && UnknownMenuProperty() == UnknownMenuPropertyDict["Insurance"] &&
           ControllerInputAFlag() == 1
}

function BlackjackPlayer_StartedMainHandThisFrame() => PlayersHandCardCount() == 2 && prev(PlayersHandCardCount()) == 1
function BlackjackPlayer_StartedSplitHandThisFrame() => PlayersSplitHandCardCount() == 2 && prev(PlayersSplitHandCardCount()) == 1
function BlackjackPlayer_StartedEitherHandThisFrame() => __ornext(BlackjackPlayer_StartedMainHandThisFrame() || BlackjackPlayer_StartedSplitHandThisFrame())

//function BlackjackOpponent_BustedMainHand() {
//    return PlayersHandResult_IsActive() == 1 && PlayersHandResult_IsWon() == 1 && PlayersHandResult_IsSpecial() == 1
//}

//function BlackjackOpponent_WonSplitHandWithBlackjack() {
//    return PlayersSplitHandResult_IsActive() == 1 && PlayersSplitHandResult_IsWon() == 1 && PlayersSplitHandResult_IsSpecial() == 1
//}

function BlackjackOpponent_MainHandBusted() => OpponentsHandResult_IsWonOrTiedFlag() == 0 && OpponentsHandResult_IsSpecialFlag() == 1
function BlackjackOpponent_SplitHandBusted() => OpponentsSplitHandResult_IsWonOrTiedFlag() == 0 && OpponentsSplitHandResult_IsSpecialFlag() == 1

function BlackjackOpponent_SwappedThisFrame(min_points) {
    return (OpponentsHandPointValue() > min_points && prev(OpponentsHandPointValue()) <= min_points && OpponentsHandCardCount() == prev(OpponentsHandCardCount())) ||
    (OpponentsSplitHandPointValue() > min_points && prev(OpponentsSplitHandPointValue()) <= min_points && OpponentsSplitHandCardCount() == prev(OpponentsSplitHandCardCount()))
}

function BlackjackOpponent_BustedThisFrame(min_points) {
    return (Changed(OpponentsHandResult()) && BlackjackOpponent_MainHandBusted() && OpponentsHandPointValue() >= min_points) ||
           (Changed(OpponentsSplitHandResult()) && BlackjackOpponent_SplitHandBusted() && OpponentsSplitHandPointValue() >= min_points)
}

function BlackjackPlayer_UsedSwapCardCheatThisFrame()    => Decreased(PlayersCheatCard2Quantity())
function BlackjackPlayer_GainedSwapCardCheatThisFrame()  => Increased(PlayersCheatCard2Quantity())
function BlackjackPlayer_UsedSeeNextCardCheatThisFrame() => Decreased(PlayersCheatCard5Quantity())
function BlackjackPlayer_UsedSeeDealDownCheatThisFrame() => Decreased(PlayersCheatCard6Quantity())

//function BlackjackPlayer_OnceSawNextCardWouldBust(max_hand_value) {
//    HandPointValue = ActiveHandPointValue()
//    NextCardRank = TopmostCardRank() 
//    IsFaceCard = __ornext(NextCardRank == CardRankDict["Jack"] || NextCardRank == CardRankDict["Queen"] || NextCardRank == CardRankDict["King"])
//    IsAce = NextCardRank == CardRankDict["Ace"]
//    
//    // once() logic had to be made internal to this function due to the complexity otherwise causing a compile error
//    return once(HandPointValue <= max_hand_value && BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && IsFaceCard              && (HandPointValue +             10) > 21) ||        
//           once(HandPointValue <= max_hand_value && BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && IsAce                   && (HandPointValue +              1) > 21) ||
//           once(HandPointValue <= max_hand_value && BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && NextCardRank <= 10      && (HandPointValue + NextCardRank  ) > 21)    
//}

function BlackjackPlayer_WonEitherHandThisFrameWithPointRange(min_point_val, max_point_val) {
    WonMainHandThisFrame  = BlackjackPlayer_WonMainHandThisFrame()  && PlayersHandPointValue() >= min_point_val      && PlayersHandPointValue() <= max_point_val
    WonSplitHandThisFrame = BlackjackPlayer_WonSplitHandThisFrame() && PlayersSplitHandPointValue() >= min_point_val && PlayersSplitHandPointValue() <= max_point_val
    return WonMainHandThisFrame || WonSplitHandThisFrame
}

function Blackjack_SawDealerWillBust() {
    // This function assumes it is being called during the player's turn (when the dealer will always have two cards). That is a safe assumption because it is
    // checking for player cheat usage.

    // Dealer will hit on 16 (or less) or "soft 17". However, if the dealer has a "soft 17", they cannot bust on the next card, so we can ignore that case.
    HasNoAce = DealersHandCardRank1() != CardRankDict["Ace"] && DealersHandCardRank2() != CardRankDict["Ace"]    
    WillHit = DealersHandPointValue() < 17 && HasNoAce
    
    IsNextFaceCard = __ornext(TopmostCardRank() == CardRankDict["Jack"] || TopmostCardRank() == CardRankDict["Queen"] || TopmostCardRank() == CardRankDict["King"])
    WillBust_FaceCard = BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && IsNextFaceCard          && (DealersHandPointValue() + 10) > 21
    WillBust_PipCard  = BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && TopmostCardRank() <= 10 && (DealersHandPointValue() + TopmostCardRank()) > 21

    return (once(WillHit && WillBust_FaceCard && never(Increased(PlayersHandCardCount()))) ||
            once(WillHit && WillBust_PipCard  && never(Increased(PlayersHandCardCount()))))
}

function BlackjackPlayer_SawDealerHandHigherThisFrame() {
    return BlackjackPlayer_UsedSeeDealDownCheatThisFrame() &&
        DealersHandPointValue() > ActiveHandPointValue()
}

function BlackjackDealer_HasBlackjack() => DealersHandCardCount() == 2 && DealersHandPointValue() == 21
function BlackjackDealer_HasBlackjackThisFrame() => BlackjackDealer_HasBlackjack() && Changed(DealersHandCardCount())

function BlackjackPlayer_MainHandPush21ThisFrame() {
    return Changed(PlayersHandResult_IsTiedFlag()) && PlayersHandResult_IsTiedFlag() == 1 && DealersHandPointValue() == 21       
}

function BlackjackPlayer_SplitHandPush21ThisFrame() {
    return Changed(PlayersSplitHandResult_IsTiedFlag()) && PlayersSplitHandResult_IsTiedFlag() == 1 && DealersHandPointValue() == 21 &&
         PlayersSplitHandResult_IsActiveFlag() == 1 
}

function BlackjackPlayer_SplitThisFrame() => PlayersHandResult_IsSplitFlag() == 1 && Changed(PlayersHandResult_IsSplitFlag())

//function BlackjackPlayer_MainHandAvoidableLoss() {
//    // Returns true if either of the following are true:
//    // 1. Player's main hand lost and dealer doesn't have B.J.
//    // 2. Player's main hand pushed and dealer doesn't have 21
//    return Changed(PlayersHandResult()) && // PlayersHandResult_IsActiveFlag() == 1 &&
//        ((PlayersHandResult_IsWonOrTiedFlag() == 0 && !BlackjackDealer_HasBlackjack()) ||
//         (PlayersHandResult_IsTiedFlag() == 1 && DealersHandPointValue() != 21))
//}

//function BlackjackPlayer_SplitHandAvoidableLoss() {
//    // Returns true if either of the following are true:
//    // 1. Player's split hand lost and dealer doesn't have B.J.
//   // 2. Player's split hand pushed and dealer doesn't have 21
//    return Changed(PlayersSplitHandResult()) && PlayersSplitHandResult_IsActiveFlag() == 1 &&
//        ((PlayersSplitHandResult_IsWonOrTiedFlag() == 0 && !BlackjackDealer_HasBlackjack()) ||
//         (PlayersSplitHandResult_IsTiedFlag() == 1 && DealersHandPointValue() != 21))
//}

function BlackjackPlayer_MainHandAvoidableLoss() {
    // Player's main hand lost and dealer doesn't have B.J.
    return HandNumber() != 0 && Changed(PlayersHandResult()) &&
        PlayersHandResult_IsWonOrTiedFlag() == 0 && !BlackjackDealer_HasBlackjack()
}


function BlackjackPlayer_MainHandAvoidablePush() {
    // Player's main hand pushed and dealer doesn't have 21
    return HandNumber() != 0 && Changed(PlayersHandResult()) &&
         PlayersHandResult_IsTiedFlag() == 1 && DealersHandPointValue() != 21
}

function BlackjackPlayer_SplitHandAvoidableLoss() {
    // Player's split hand lost and dealer doesn't have B.J.
    return HandNumber() != 0 && Changed(PlayersSplitHandResult()) && PlayersSplitHandResult_IsActiveFlag() == 1 && prev(PlayersSplitHandResult_IsActiveFlag()) == 1 &&
        PlayersSplitHandResult_IsWonOrTiedFlag() == 0 && !BlackjackDealer_HasBlackjack()
}

function BlackjackPlayer_SplitHandAvoidablePush() {
    // Player's split hand pushed and dealer doesn't have 21
    return HandNumber() != 0 && Changed(PlayersSplitHandResult()) && PlayersSplitHandResult_IsActiveFlag() == 1 && prev(PlayersSplitHandResult_IsActiveFlag()) == 1 &&
         PlayersSplitHandResult_IsTiedFlag() == 1 && DealersHandPointValue() != 21
}

// Don't count it as "spin ending" when the spin counter is being initialized from 0 to 1 before the first spin
//function SlotsPlayer_PracticeSpinEndedThisFrame() => Increased(PracticeSpinCounter()) && prev(PracticeSpinCounter()) > 0

// Warning: this does not trigger on Spin 10 ending so it should only be used where that is acceptable
function SlotsPlayer_CompetitiveSpinEndedThisFrame() => Increased(SpinNumber())
// || PlayerWonCasinoGameThisFrame(casino_game_name)

function SlotsPlayer_SpinStarted() => Changed(PlayersReel1Position())
//function SlotsPlayer_SpinEnded() => Unchanged(PlayersReel3Position()) // don't use b/c doesn't account for bonus item usage
//function SlotsPlayer_SpinEndedThisFrame() => SlotsPlayer_PracticeSpinEndedThisFrame() || SlotsPlayer_CompetitiveSpinEndedThisFrame()

function SlotsPlayer_PlacedBetThisFrame() => Increased(SlotsPlayersBetMultiplier())

function Slots_BonusItem_NotVisible() => BonusItemXPosition() == BonusItemXPositionDict["NotVisible"] && BonusItemYPosition() == BonusItemYPositionDict["NotVisible"]

function SlotsPlayer_PayoutThisFrame() => Increased(PlayersCashBCD())

// At moment when jackpot is paid out, Player's Cash (BCD) increases on same frame that the Jackpot Flag is cleared from 1 to 0 (at end of jackpot animation)
// Strangely, when there is a bonus item available and a potential jackpot, the Jackpot Flag is set to 1 before the bonus item is even placed.
// If the bonus item is placed on non-winning line instead, the jackpot flag is cleared from 1 to 0 immediately when the bonus item is placed.
// Also note that the bonus item (if purchased) is still visible on the frame of the cash payout, so we can't check if it is gone at that point.
function SlotsPlayer_WonJackpotThisFrame() => Decreased(SlotsPlayerWonJackpotFlag()) && SlotsPlayer_PayoutThisFrame() 

// I don't think this will work - can't do decimal math with BCD values
//function SlotsPlayer_JackpotPayoutThisFrame() {
//    MinJackpotAmount = 250000
//    return bcd(PlayersCashBCD()) >= prev(bcd(PlayersCashBCD())) + MinJackpotAmount
//}

function SlotsPlayer_WonLineThisFrame(line_num) {
    // Have to check for cash payout because the line bet multipliers are not reset between spins, and therefore might not
    // change from their prev values if the previous spin had the same result.
    if (line_num == 1)
        return PlayersPayoutLine1BetMultiplier() > 0 && SlotsPlayer_PayoutThisFrame()
    else if (line_num == 2)
        return PlayersPayoutLine2BetMultiplier() > 0 && SlotsPlayer_PayoutThisFrame()
    else if (line_num == 3)
        return (PlayersPayoutLine3BetMultiplier() > 0 && SlotsPlayer_PayoutThisFrame()) ||
               (PlayersPayoutLine3BetMultiplier() == 0 && SlotsPlayer_WonJackpotThisFrame())
}

function SlotsPlayer_WonAtLeast2LinesThisFrame() {
    return (SlotsPlayer_WonLineThisFrame(1) && SlotsPlayer_WonLineThisFrame(2)) ||
           (SlotsPlayer_WonLineThisFrame(1) && SlotsPlayer_WonLineThisFrame(3)) ||
           (SlotsPlayer_WonLineThisFrame(2) && SlotsPlayer_WonLineThisFrame(3))
}

function SlotsPlayer_WonAll3LinesThisFrame() => SlotsPlayer_WonLineThisFrame(1) && SlotsPlayer_WonLineThisFrame(2) && SlotsPlayer_WonLineThisFrame(3)

function SlotsPlayer_WonAnyLineWith(payout_type) {
    mult = SlotsPayoutMultiplierDict[payout_type]

    return __ornext(PlayersPayoutLine1BetMultiplier() == mult || PlayersPayoutLine2BetMultiplier() == mult || PlayersPayoutLine3BetMultiplier() == mult)
}

//function SlotsPlayer_PlacedBonusItemThisFrame(line_num) {
//    if (line_num == 1)
//        bonus_row = "Line1"
//    else if (line_num == 2)
//        bonus_row = "Line2"
//    else if (line_num == 3)
//        bonus_row = "Line3"
//
//    BonusItem_WasPlaced_PlayerSlotMachine_Col = __ornext(
//        prev(BonusItemXPosition()) == BonusItemXPositionDict["PlayerCol1"] ||
//        prev(BonusItemXPosition()) == BonusItemXPositionDict["PlayerCol2"] ||
//        prev(BonusItemXPosition()) == BonusItemXPositionDict["PlayerCol3"])
//
//    BonusItem_WasPlaced_SlotMachine_Row = prev(BonusItemYPosition()) == BonusItemYPositionDict[bonus_row]
//
////    BonusItem_WasPlaced_SlotMachine_Row = __ornext(
////        prev(BonusItemYPosition()) == BonusItemYPositionDict["Line1"] ||
////        prev(BonusItemYPosition()) == BonusItemYPositionDict["Line2"] ||
////        prev(BonusItemYPosition()) == BonusItemYPositionDict["Line3"])
//        
//    BonusItem_Is_Gone = BonusItemXPosition() == BonusItemXPositionDict["NotVisible"] &&
//                        BonusItemYPosition() == BonusItemYPositionDict["NotVisible"]
//  
//    return BonusItem_WasPlaced_PlayerSlotMachine_Col && BonusItem_WasPlaced_SlotMachine_Row && BonusItem_Is_Gone
//}

function SlotsPlayer_PlacedBonusItem(line_num) {
    if (line_num == 1)
        bonus_row = "Line1"
    else if (line_num == 2)
        bonus_row = "Line2"
    else if (line_num == 3)
        bonus_row = "Line3"

    BonusItem_IsPlaced_PlayerSlotMachine_Col = __ornext(
        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol1"] ||
        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol2"] ||
        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol3"])

    BonusItem_IsPlaced_SlotMachine_Row = BonusItemYPosition() == BonusItemYPositionDict[bonus_row]

    return BonusItem_IsPlaced_PlayerSlotMachine_Col && BonusItem_IsPlaced_SlotMachine_Row 
}

function SlotsPlayer_WonLineWithBonusItem(line_num) {
    // "Line Bet Multiplier", "Total Bet Multiplier", and "Player's Cash" are updated on the first frame after a spin ends, and not otherwise cleared.
    // "Currently Displayed Payout Amount" is updated on the first frame after a spin ends, and updated again upon the next spin starting.
    // The "Bonus Item X/Y Position" is updated when player moves the bonus item, and is cleared upon the next spin starting.
    return once(SlotsPlayer_PlacedBonusItem(line_num)) && SlotsPlayer_WonLineThisFrame(line_num)
}

function BonusItemMovedThisFrame() {
    // Checks if the bonus item was moved to a new position (not including when it is purchased/disappears)
    return (BonusItemXPosition() != BonusItemXPositionDict["NotVisible"] && Changed(BonusItemXPosition())) ||
           (BonusItemYPosition() != BonusItemYPositionDict["NotVisible"] && Changed(BonusItemYPosition()))
}

function Poker_SecondDrawStarted() => prev(DrawNumber()) == 1 && DrawNumber() == 2

function VideoPokerPlayer_HandScoringIncreasedThisFrame() {
    // New hand must have higher "type" than old hand AND be "Pair of Jacks" or better
    return Increased(PlayersHandRankingType()) &&
        PlayersHandRanking() >= Poker_HandRankingDict["PairOfJacks"]
}

function VideoPokerPlayer_UsedSwapCardCheatThisFrame() => Decreased(PlayersCheatCard2Quantity())
function VideoPokerOpponent_UsedSwapCardCheatThisFrame() => Decreased(OpponentsCheatCard2Quantity())

//VideoPokerCards = []
//for i in range (2, 14) {             // Rank: 2-10, J=11, Q=12, K=13, A=14
//    array_push(VideoPokerCards, (i*16) + 2) // Suit: Hearts
//    array_push(VideoPokerCards, (i*16) + 4) // Suit: Diamonds
//    array_push(VideoPokerCards, (i*16) + 6) // Suit: Spades
//    array_push(VideoPokerCards, (i*16) + 8) // Suit: Clubs
//}
//array_push(VideoPokerCards, 0xf0)           // Rank: Joker (no suit)

//function VideoPoker_SwappedCardBack() {
    // Idea:
    // - use VideoPokerCards array and predicate function(s) to generate an alt group for each array element
    // - each alt group stores hit when opponent swaps that card value, then triggers if player swaps the same card value as well
    // - problem: haven't found a way to identify the "swapped card", especially when opponent does it - we can detect which card
    // changed and set a stored hit, but not "save its value for later" for comparison (unless we used SubSource/AddSource somehow,
    // but it would likely be huge and very complex)
    // )
//    return 0
//}

function DrawPoker_OpponentFolded() => OpponentsHandResult() == DrawPoker_HandResultDict["Fold"]

function DrawPokerPlayer_LostHandThisFrame() {
    // Note: this function will not trigger upon losing final hand because hand number will not increase (but that is acceptable
    // for the only achievement where it is currently used, because it is not possible to both lose the final hand and win the game)
    return Increased(HandNumber()) &&
    // Alternatively, we might be able to check player's payout == 0
           PlayersHandRanking() < OpponentsHandRanking() &&
           !DrawPoker_OpponentFolded()
}

//function DrawPokerPlayer_PlacedBetThisFrame() {
function DrawPokerPlayer_PlacedBet() {
    // Can be regular bet or bet raise
    // Removing the Changed() fixes this to actually trigger, but may prevent it from triggering if player bets 2nd and bets the same amount that opponent did (?)
    return IsOpponentsTurn() == 0 && LastPlacedBetAmount() > 0 && LastPlacedBetAmount() == PlayersLastActualBetAmount() // && Changed(LastPlacedBetAmount())
}

function DrawPokerOpponent_RaisedBetThisFrame() {
    // When opponent raises on their turn: First, the "Last Placed Bet Amount" is zeroed out before the bet is made. Upon making the bet, "Last Placed Bet Amount" and
    // "Opponent's Last Actual Bet Amount" are set to the bet amount. If the opponent calls instead, "Last Placed Bet Amount" will remain zero, but the
    // "Opponent's Last Actual Bet Amount" will be set to the called bet amount.
    // TODO: Fix to handle case where player bet in 1st draw, then opponent bets first in 2nd draw (which wouldn't be a raise but "Player's Last Actual Bet Amount" is
    // still >0)
    return IsOpponentsTurn() == 1 && PlayersLastActualBetAmount() > 0 && // OpponentsLastActualBetAmount() > PlayersLastActualBetAmount() &&
           LastPlacedBetAmount() > 0 && LastPlacedBetAmount() == OpponentsLastActualBetAmount() && Changed(LastPlacedBetAmount())
}

function PokerPlayer_WonWith(hand_type) => PlayersHandRankingType() == Poker_HandRankingTypeDict[hand_type]

function PokerPlayer_Has3Jokers() {
    JokerCard1 = PlayersHandCardRank1() == CardRankDict["Joker"]
    JokerCard2 = PlayersHandCardRank2() == CardRankDict["Joker"]
    JokerCard3 = PlayersHandCardRank3() == CardRankDict["Joker"]
    JokerCard4 = PlayersHandCardRank4() == CardRankDict["Joker"]
    JokerCard5 = PlayersHandCardRank5() == CardRankDict["Joker"]

    // Manually listing every possible combination... (is there a better way?)
    return ((JokerCard1 && JokerCard2 && JokerCard3) || (JokerCard1 && JokerCard2 && JokerCard4) || (JokerCard1 && JokerCard2 && JokerCard5) ||
            (JokerCard1 && JokerCard3 && JokerCard4) || (JokerCard1 && JokerCard3 && JokerCard5) || (JokerCard1 && JokerCard4 && JokerCard5) ||
            (JokerCard2 && JokerCard3 && JokerCard4) || (JokerCard2 && JokerCard3 && JokerCard5) || (JokerCard2 && JokerCard4 && JokerCard5) ||
            (JokerCard3 && JokerCard4 && JokerCard5))
}

//function PokerPlayer_IsCard1Held() => DrawNumber() == 1 && PlayersCard1DrawFlag() == 0 && PlayersCard1FaceDownFlag() == 1
//function PokerPlayer_IsCard2Held() => DrawNumber() == 1 && PlayersCard2DrawFlag() == 0 && PlayersCard2FaceDownFlag() == 1
//function PokerPlayer_IsCard3Held() => DrawNumber() == 1 && PlayersCard3DrawFlag() == 0 && PlayersCard3FaceDownFlag() == 1
//function PokerPlayer_IsCard4Held() => DrawNumber() == 1 && PlayersCard4DrawFlag() == 0 && PlayersCard4FaceDownFlag() == 1
//function PokerPlayer_IsCard5Held() => DrawNumber() == 1 && PlayersCard5DrawFlag() == 0 && PlayersCard5FaceDownFlag() == 1

//function PokerPlayer_WasAnyCardHeld() {
//    return tally(1,PokerPlayer_IsCard1Held(), PokerPlayer_IsCard2Held(), PokerPlayer_IsCard3Held(), PokerPlayer_IsCard4Held(), PokerPlayer_IsCard5Held())
//    return __ornext(IsPlayersCard1Held() == IsPlayersCardHeldDict["Selected"] || IsPlayersCard2Held() == IsPlayersCardHeldDict["Selected"] ||
//                    IsPlayersCard3Held() == IsPlayersCardHeldDict["Selected"] || IsPlayersCard4Held() == IsPlayersCardHeldDict["Selected"] ||
//                    IsPlayersCard5Held() == IsPlayersCardHeldDict["Selected"] )
    // set start condition = true
    // if none of the 5 cards become face-down during draw 1, that means no cards were held - reset start condition
    // non-held card - becomes face-down
    // held card - doesn't become face-down
    // fail if all 5 non-held (all 5 face-down)
//}

function PokerPlayer_NoCardsWereHeld() {
    return DrawNumber() == 1 && PlayersCard1FaceDownFlag() == 1 && PlayersCard2FaceDownFlag() == 1 && PlayersCard3FaceDownFlag() == 1 &&
        PlayersCard4FaceDownFlag() == 1 && PlayersCard5FaceDownFlag() == 1
}

function StartedCrapsRollThisFrame() => Changed(CombinedDiceRoll()) && CombinedDiceRoll() != 0
function CrapsRoll_IsNatural() => CombinedDiceRoll() == 7 || CombinedDiceRoll() == 11
function CrapsRoll_IsCraps() => CombinedDiceRoll() == 2 || CombinedDiceRoll() == 3 || CombinedDiceRoll() == 12
function CrapsRoll_IsPoint() => CombinedDiceRoll() == EstablishedPointNumber()

//function IsShowingBetResults() => ShowingBetResults() == ShowingBetResultsDict["Yes"]
//function Craps_IsPlayerTurn() => IsCrapsPlayersTurn() == 1
function CrapsPlayer_TurnPaused() => IsCrapsPlayersTurn() == 0
function CrapsPlayer_TurnEnded() => Decreased(IsCrapsPlayersTurn())
function CrapsPlayer_TurnStarted() => Increased(IsCrapsPlayersTurn())

function GetCrapsBetAmount(bet_type) {
    if (bet_type == "Pass") return PassBetAmount()
    if (bet_type == "DontPass") return DontPassBetAmount()
    if (bet_type == "Come") return ComeBetAmount()
    if (bet_type == "DontCome") return DontComeBetAmount()
    if (bet_type == "OddsCome4") return OddsCome4BetAmount()
    if (bet_type == "OddsCome5") return OddsCome5BetAmount()
    if (bet_type == "OddsCome6") return OddsCome6BetAmount()
    if (bet_type == "OddsCome8") return OddsCome8BetAmount()
    if (bet_type == "OddsCome9") return OddsCome9BetAmount()
    if (bet_type == "OddsCome10") return OddsCome10BetAmount()
    if (bet_type == "OddsDontCome4") return OddsDontCome4BetAmount()
    if (bet_type == "OddsDontCome5") return OddsDontCome5BetAmount()
    if (bet_type == "OddsDontCome6") return OddsDontCome6BetAmount()
    if (bet_type == "OddsDontCome8") return OddsDontCome8BetAmount()
    if (bet_type == "OddsDontCome9") return OddsDontCome9BetAmount()
    if (bet_type == "OddsDontCome10") return OddsDontCome10BetAmount()
    if (bet_type == "Lay4") return Lay4BetAmount()
    if (bet_type == "Lay5") return Lay5BetAmount()
    if (bet_type == "Lay6") return Lay6BetAmount()
    if (bet_type == "Lay8") return Lay8BetAmount()
    if (bet_type == "Lay9") return Lay9BetAmount()
    if (bet_type == "Lay10") return Lay10BetAmount()
    if (bet_type == "Seven") return SevenBetAmount()
    if (bet_type == "Buy4") return Buy4BetAmount()
    if (bet_type == "Buy5") return Buy5BetAmount()
    if (bet_type == "Buy6") return Buy6BetAmount()
    if (bet_type == "Buy8") return Buy8BetAmount()
    if (bet_type == "Buy9") return Buy9BetAmount()
    if (bet_type == "Buy10") return Buy10BetAmount()
    if (bet_type == "Hard4") return Hard4BetAmount()
    if (bet_type == "Hard10") return Hard10BetAmount()
    if (bet_type == "Place4") return Place4BetAmount()
    if (bet_type == "Place5") return Place5BetAmount()
    if (bet_type == "Place6") return Place6BetAmount()
    if (bet_type == "Place8") return Place8BetAmount()
    if (bet_type == "Place9") return Place9BetAmount()
    if (bet_type == "Place10") return Place10BetAmount()
    if (bet_type == "Hard6") return Hard6BetAmount()
    if (bet_type == "Hard8") return Hard8BetAmount()
    if (bet_type == "Craps2") return Craps2BetAmount()
    if (bet_type == "Horn") return HornBetAmount()
    if (bet_type == "Craps12") return Craps12BetAmount()
    if (bet_type == "Big6") return Big6BetAmount()
    if (bet_type == "Field") return FieldBetAmount()
    if (bet_type == "Craps3") return Craps3BetAmount()
    if (bet_type == "Yoleven") return YolevenBetAmount()
    if (bet_type == "Big8") return Big8BetAmount()
    if (bet_type == "AnyCraps") return AnyCrapsBetAmount()
    if (bet_type == "CAndE") return CAndEBetAmount()
    if (bet_type == "PassOdds") return PassOddsBetAmount()
    if (bet_type == "DontPassOdds") return DontPassOddsBetAmount()
}

LineBetTypes = ["Pass", "DontPass", "Come", "DontCome", "PassOdds", "DontPassOdds",
                  "OddsCome4", "OddsCome5", "OddsCome6", "OddsCome8", "OddsCome9", "OddsCome10",
                  "OddsDontCome4", "OddsDontCome5", "OddsDontCome6", "OddsDontCome8", "OddsDontCome9", "OddsDontCome10"]
SingleBetTypes = ["Craps2", "Craps3", "Craps12", "Seven", "Yoleven", "AnyCraps",
                    "CAndE", "Horn", "Field"]
MultiBetTypes = ["Place4", "Place5", "Place6", "Place8", "Place9", "Place10",
                   "Buy4", "Buy5", "Buy6", "Buy8", "Buy9", "Buy10",
                   "Lay4", "Lay5", "Lay6", "Lay8", "Lay9", "Lay10",
                   "Hard4", "Hard6", "Hard8", "Hard10", "Big6", "Big8"]
AllBetTypes = []
for bet_type in LineBetTypes {array_push(AllBetTypes, bet_type)}
for bet_type in SingleBetTypes {array_push(AllBetTypes, bet_type)}
for bet_type in MultiBetTypes {array_push(AllBetTypes, bet_type)}

LineBetAmounts = [PassBetAmount(), DontPassBetAmount(), ComeBetAmount(), DontComeBetAmount(), PassOddsBetAmount(), DontPassOddsBetAmount(),
                  OddsCome4BetAmount(), OddsCome5BetAmount(), OddsCome6BetAmount(), OddsCome8BetAmount(), OddsCome9BetAmount(), OddsCome10BetAmount(),
                  OddsDontCome4BetAmount(), OddsDontCome5BetAmount(), OddsDontCome6BetAmount(), OddsDontCome8BetAmount(), OddsDontCome9BetAmount(), OddsDontCome10BetAmount()]
SingleBetAmounts = [Craps2BetAmount(), Craps3BetAmount(), Craps12BetAmount(), SevenBetAmount(), YolevenBetAmount(), AnyCrapsBetAmount(),
                    CAndEBetAmount(), HornBetAmount(), FieldBetAmount()]
MultiBetAmounts = [Place4BetAmount(), Place5BetAmount(), Place6BetAmount(), Place8BetAmount(), Place9BetAmount(), Place10BetAmount(),
                   Buy4BetAmount(), Buy5BetAmount(), Buy6BetAmount(), Buy8BetAmount(), Buy9BetAmount(), Buy10BetAmount(),
                   Lay4BetAmount(), Lay5BetAmount(), Lay6BetAmount(), Lay8BetAmount(), Lay9BetAmount(), Lay10BetAmount(),
                   Hard4BetAmount(), Hard6BetAmount(), Hard8BetAmount(), Hard10BetAmount(), Big6BetAmount(), Big8BetAmount()]
AllBetAmounts = []
for bet_amount in LineBetAmounts {array_push(AllBetAmounts, bet_amount)}
for bet_amount in SingleBetAmounts {array_push(AllBetAmounts, bet_amount)}
for bet_amount in MultiBetAmounts {array_push(AllBetAmounts, bet_amount)}

// Note: This function does not work for "Any Craps" and other single-roll bets that are not zeroed out/removed from table when won (game bug?)
function CrapsPlayer_WonBetThisFrameByAmount(bet_amount) {
    // When a bet is won, the associated bet amount is zeroed out on the same frame the player's cash is increased (to refund the bet amount)
    return CrapsPlayer_TurnPaused() && ZeroedOut(bet_amount) && Increased(PlayersCashBCD())
}

function CrapsPlayer_HadBetOn(bet_type) {
    return prev(GetCrapsBetAmount(bet_type)) > 0
}

function CrapsPlayer_WonBetThisFrame(bet_type) {
    // When a bet is won, the associated bet amount is zeroed out on the same frame the player's cash is increased (to refund the bet amount)
    if (bet_type == "Pass" || bet_type == "DontPass" || bet_type == "PassOdds" || bet_type == "DontPassOdds")
        // Pass and Don't Pass do not show bet results and therefore we cannot rely them setting CrapsBetType or CrapsBetWon - so use the older
        // version of this function instead (which didn't work with "Any Craps" and other single-roll bets).
        return CrapsPlayer_WonBetThisFrameByAmount(GetCrapsBetAmount(bet_type))
    else
        return CrapsPlayer_TurnPaused() && CrapsPlayer_HadBetOn(bet_type) && CrapsBetType() == CrapsBetTypeDict[bet_type] && IsCrapsBetWon() == 1 // && Changed(CrapsBetType())
}

function CrapsPlayer_WonLineBets(bet_count) {
//    return tally_of(SingleBetAmounts, bet_count, bet_amount => once(CrapsPlayer_WonBetThisFrame(bet_amount)))
    return tally_of(LineBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
}

function CrapsPlayer_WonSingleRollBets(bet_count) {
//    return tally_of(SingleBetAmounts, bet_count, bet_amount => once(CrapsPlayer_WonBetThisFrame(bet_amount)))
    return tally_of(SingleBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
}

function CrapsPlayer_WonMultiRollBets(bet_count) {
//    return tally_of(MultiBetAmounts, bet_count, bet_amount => once(CrapsPlayer_WonBetThisFrame(bet_amount)))
    return tally_of(MultiBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
}

function CrapsPlayer_WonAnyBets(bet_count) {
//    return tally_of(AllBetAmounts, bet_count, bet_amount => once(CrapsPlayer_WonBetThisFrame(bet_amount)))
    return tally_of(AllBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
}

//function CrapsPlayer_WonAnyLineBetThisFrame() {
//    return any_of(LineBetAmounts, bet_amount => CrapsPlayer_WonBetThisFrame(bet_amount))
//}

//function CrapsPlayer_WonAnySingleRollBetThisFrame() {
//    return any_of(SingleBetAmounts, bet_amount => CrapsPlayer_WonBetThisFrame(bet_amount))
//    return any_of(SingleBetTypes, bet_type => CrapsPlayer_WonBetThisFrame(bet_type))
//}

//function CrapsPlayer_WonAnyMultiRollBetThisFrame() {
//    return any_of(MultiBetAmounts, bet_amount => CrapsPlayer_WonBetThisFrame(bet_amount))
//    return any_of(MultiBetTypes, bet_type => CrapsPlayer_WonBetThisFrame(bet_type))
//}

function CrapsPlayer_PlacedBet(bet_amount) {
    // When a bet is won, the associated bet amount is zeroed out on the same frame the player's cash is increased (to refund the bet amount)
    // Note: Ideally we could move CrapsPlayer_TurnEnded() outside the tally so it isn't duplicated for each bet type, but that doesn't seem
    // possible with RAScript (replacing tally_of() with tally(any_of()) didn't work either, because while it would generate an OrNext chain, it
    // only checks if ANY bet is >0 X times, rather than if X bets are >0). I think this might be a case where ResetNextIf would help.
    return CrapsPlayer_TurnEnded() && bet_amount > 0
}

function CrapsPlayer_PlacedBets(bet_count) {
    return tally_of(AllBetAmounts, bet_count, bet_amount => once(CrapsPlayer_PlacedBet(bet_amount)))
//    return once(Craps_IsEndOfPlayerTurn() && tally_of(AllBetAmounts, bet_count, bet_amount => bet_amount > 0))
}

//function CrapsPlayer_LostAnyBetThisFrame() {
//    LostThisFrame = Unchanged(PlayersCashBCD())
//    return tally_of(AllBetAmounts, 1, bet_amount => CrapsPlayer_ControlPaused() && LostThisFrame && ZeroedOut(bet_amount))
//    // return any_of(AllBetAmounts, betamount => CrapsBet_IsEvaluation() && LostThisFrame && ZeroedOut(betamount))
//}

//function PokerPlayer_AtLeastTwoCardsWereHeld() {
//    // Check if two cards were "unheld" on same frame (because player can only "unhold" one card at a time by clicking)
//    // Each card that is "unheld" will decrease from 6 (prev) to 3 (current), so we want to check: prev - current >= 3 * 2
//    HeldTotal = IsPlayersCard1Held() + IsPlayersCard2Held() + IsPlayersCard3Held() + IsPlayersCard4Held() + IsPlayersCard5Held()
//    PrevTotal = prev(IsPlayersCard1Held()) + prev(IsPlayersCard2Held()) + prev(IsPlayersCard3Held()) + prev(IsPlayersCard4Held()) + prev(IsPlayersCard5Held())
//    PrevHeldDiff = (IsPlayersCardHeldDict["Selected"] - IsPlayersCardHeldDict["Deselected"]) * 2
//
//    return PrevTotal - HeldTotal >= PrevHeldDiff

//    HeldCard1 = IsPlayersCard1Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard1Held()) == IsPlayersCardHeldDict["Selected"]
//    HeldCard2 = IsPlayersCard2Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard2Held()) == IsPlayersCardHeldDict["Selected"]
//    HeldCard3 = IsPlayersCard3Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard3Held()) == IsPlayersCardHeldDict["Selected"]
//    HeldCard4 = IsPlayersCard4Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard4Held()) == IsPlayersCardHeldDict["Selected"]
//    HeldCard5 = IsPlayersCard5Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard5Held()) == IsPlayersCardHeldDict["Selected"]

//    return (HeldCard1 && (HeldCard2 || HeldCard3 || HeldCard4 || HeldCard5)) ||
//           (HeldCard2 && (HeldCard3 || HeldCard4 || HeldCard5)) ||
//           (HeldCard3 && (HeldCard4 || HeldCard5)) ||
//           (HeldCard4 && HeldCard5)

//    return (PlayersCard1DeselectedThisFrame && PlayersCard2DeselectedThisFrame) || (PlayersCard1DeselectedThisFrame && PlayersCard3DeselectedThisFrame) ||
//           (PlayersCard1DeselectedThisFrame && PlayersCard4DeselectedThisFrame) || (PlayersCard1DeselectedThisFrame && PlayersCard5DeselectedThisFrame) ||
//           (PlayersCard2DeselectedThisFrame && PlayersCard3DeselectedThisFrame) || (PlayersCard2DeselectedThisFrame && PlayersCard4DeselectedThisFrame) ||
//           (PlayersCard2DeselectedThisFrame && PlayersCard5DeselectedThisFrame) || (PlayersCard3DeselectedThisFrame && PlayersCard4DeselectedThisFrame) ||
//           (PlayersCard3DeselectedThisFrame && PlayersCard5DeselectedThisFrame) || (PlayersCard4DeselectedThisFrame && PlayersCard5DeselectedThisFrame)
//    return tally(2,
//           IsPlayersCard1Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard1Held()) == IsPlayersCardHeldDict["Selected"],
//           IsPlayersCard2Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard2Held()) == IsPlayersCardHeldDict["Selected"],
//           IsPlayersCard3Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard3Held()) == IsPlayersCardHeldDict["Selected"],
//           IsPlayersCard4Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard4Held()) == IsPlayersCardHeldDict["Selected"],
//          IsPlayersCard5Held() == IsPlayersCardHeldDict["Deselected"] && prev(IsPlayersCard5Held()) == IsPlayersCardHeldDict["Selected"])
//}

//function PokerPlayer_AtLeastOneCardValueChanged() {
//    return __ornext(Changed(PlayersHandCard1()) || Changed(PlayersHandCard2()) || Changed(PlayersHandCard3()) || Changed(PlayersHandCard4()) || Changed(PlayersHandCard5()))
//}

//function PokerPlayer_HasInHand(card_count, card_rank) {
// This doesn't work for multiple reasons
// - needs to subtract or reset the hits when no longer have the card in hand
// - needs to only hit once when card received instead of every frame in hand
//   return tally(card_count, PlayersHandCardRank1() == CardRankDict[card_rank],
//                            PlayersHandCardRank2() == CardRankDict[card_rank],
//                            PlayersHandCardRank3() == CardRankDict[card_rank],
//                           PlayersHandCardRank4() == CardRankDict[card_rank],
//                            PlayersHandCardRank5() == CardRankDict[card_rank])
//}

//function PokerPlayer_HandStarted() => PlayersHandCardCount() == 5 && PlayersHandRanking() != 0

//function PokerPlayer_DealtNewCards() {
//    return PlayersHandCardCount() == 5 && prev(PlayersHandCardCount()) < 5 && PlayersHandRanking() != 0
//}

// ************************************************************************************************
//                                          Achievements
// ************************************************************************************************

// ----------------------------------------------
// Tutorial (Practice Mode) Achievements
// ----------------------------------------------

achievement("Blackjack Academy: Name of the Game", "[Practice] Blackjack - Score a Blackjack (two-card 21: payout increased by half)", 1,
    IsPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_WonEitherWithBlackjackThisFrame()
    , id=356408)

achievement("Blackjack Academy: Double Trouble", "[Practice] Blackjack - Double down and win the hand (bet doubled and dealt exactly one more card)", 1,
    IsPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_DoubledDownAndWonThisFrame()
    , id=356409)

achievement("Blackjack Academy: Make Like a Banana", "[Practice] Blackjack - Split and win both hands (two same-value cards: play them as separate hands, each with original bet)", 2,
    IsPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_WonBothSplitHandsThisFrame()
    , id=356410)

achievement("Blackjack Academy: Psychic Training",
    "[Practice] Blackjack - Buy or refuse insurance and have it pay off (dealer face-up ace: costs half your bet, original bet refunded if dealer has B.J.)", 1,
    IsPracticeMode() && IsPlayingBlackjack() &&
    ((BlackjackPlayer_BoughtInsurance() && DealersHandPointValue() == 21) || (BlackjackPlayer_DeclinedInsurance() && DealersHandPointValue() != 21))
    , id=356411)

//achievement("Slots Academy: Cherry Picking", "[Practice] Slots - Win any line with 1 Cherry (2x payout) or 2 Cherry (5x)", 1,
//    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && 
//    __ornext(SlotsPlayer_WonAnyLineWith("1Cherry") || SlotsPlayer_WonAnyLineWith("2Cherry")) 
//)

achievement("Slots Academy: One-Armed Banditry", "[Practice] Slots - Bet on all three lines and win at least two of them", 1,
    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_WonAtLeast2LinesThisFrame() && SlotsPlayersBetMultiplier() == 3
    , id=356412)

achievement("Video Poker Academy: Can You Hold, Please?",
//    "[Practice] Video Poker - Press the (H)old button under at least one card and have a higher-scoring hand on the second draw (one pair must be Jacks or better to score)", 1,
    "[Practice] Video Poker - Hold at least one card and get a higher-scoring hand on the 2nd draw (one pair doesn't score unless Jacks or better)", 1,
    IsPracticeMode() && IsPlayingVideoPoker()  &&  // && PokerPlayer_WasAnyCardHeld()
    once(Poker_SecondDrawStarted()) && VideoPokerPlayer_HandScoringIncreasedThisFrame() && unless(once(PokerPlayer_NoCardsWereHeld()))
    && (always_true() || never(Increased(HandNumber())))
    // Note: This did not track whether the hold button remained pressed, only that it was pressed at some point. Doing the former would be difficult 
    // because the 2nd draw resets all 5 "Card X Held" addresses to the same value (0x03) as if the hold were deselected by the player, and there didn't
    // seem to be a good way to detect when the Draw button was pressed, either.
//    once(PokerPlayer_AtLeastTwoCardsWereHeld())
//    disable_when(PlayersHandCardCount() == 0, Increased(HandNumber()))
//    never(Increased(HandNumber())) && unless(PlayersHandCardCount() == 0)
//    once(PokerPlayer_DealtNewCards())
//    PokerPlayer_AtLeastOneCardValueChanged())  // this is redundant because we checked that hand scoring increased - no?
    , id=356413)

//achievement("Video Poker Academy: Paired Up", "[Practice] Video Poker - Win hand with one pair of \"Jacks or better\" (1x payout) or two pair (2x)", 1,
//    IsPracticeMode() && IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() &&
//    __ornext(PokerPlayer_WonWith("OnePair") || PokerPlayer_WonWith("TwoPair"))
//)

// ----------------------------------------------
// Progression Achievements
// ----------------------------------------------

// Adds an achievement for winning the specified mission/casino game with the given title and points
function WinStageAchievement(mission, casino_game_num, ach_title, ach_points, ach_id)
{
    CasinoGameName = GetCasinoGameName(casino_game_num)
//    if (casino_game_num == 4)
//        ach_desc = format("Mission {0}-{1}: Defeat {3} (win at {2})", mission, casino_game_num, CasinoGameName, GetGangsterName(mission))
//    else
    ach_desc = format("Mission {0}-{1}: Win at {2} vs. {3}", mission, casino_game_num, CasinoGameName, GetGangsterName(mission))

    achievement(ach_title, ach_desc, ach_points,
        DisplayedMissionNumber() == mission && PlayerWonCasinoGameThisFrame(CasinoGameName), id = ach_id
    )
}

// Add achievements for winning each Competitive Mode mission/casino game
// Mission 1 - Machine Gun Max
WinStageAchievement(1, 1, "Call Me Bulletproof Bob", 2, 356414)
WinStageAchievement(1, 2, "Beginner's Luck?", 2, 356415)
WinStageAchievement(1, 3, "Loserus Maximus", 2, 356416)
WinStageAchievement(1, 4, "Max Maxed Out", 5, 356417)
// Mission 2 - Suitcase Sam
WinStageAchievement(2, 1, "Suitcase Shakedown", 3, 356418)
WinStageAchievement(2, 2, "I Do Not Lose Them, Sam-I-Am", 3, 356419)
WinStageAchievement(2, 3, "Sam Clubbed", 3, 356420)
WinStageAchievement(2, 4, "Unpacked Suitcase Sam", 5, 356421)
// Mission 3 - Hitman Harry
WinStageAchievement(3, 1, "Harry's Not So Scary", 3, 356422)
WinStageAchievement(3, 2, "You're No Wizard, Harry", 3, 356423)
WinStageAchievement(3, 3, "Blood Money Transfusion", 3, 356424)
WinStageAchievement(3, 4, "Whacked the Hitman", 5, 356425)
// Mission 4 - Lucky Louis
WinStageAchievement(4, 1, "Louis the Not-So-Great", 5, 356426)
WinStageAchievement(4, 2, "More Like Unlucky Louis, Amirite?", 5, 356427)
WinStageAchievement(4, 3, "You're Out of Luck, I'm Out of Time", 5, 356428)
WinStageAchievement(4, 4, "Louie, Louie, You Gotta Go", 10, 356429)
// Mission 5 - Al Cologne
WinStageAchievement(5, 1, "Cologne Bolonga", 5, 356430)
WinStageAchievement(5, 2, "Say Hello to My Little Spend", 5, 356431)
WinStageAchievement(5, 3, "Nice Try, Wiseguy", 5, 356432)
WinStageAchievement(5, 4, "Ding, Don Done", 10, 356433)

achievement("Brought Down the Mob", "Beat the game without using a password", 25,
    WonCompetitiveModeThisFrame() && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
    , id=356434)

// ----------------------------------------------
// Optional (Item Usage) Achievements
// ----------------------------------------------

//achievement("Bustin' Don't Make Me Feel Good", "Blackjack - Use See Next Card when your hand value is 17 or less, revealing a card that would make you bust, then win the hand", 5,
//    // TODO: need to check if player has a "soft" hand (11 pt ace) because that would prevent bust if the player just hits
//    IsCompetitiveMode() && IsPlayingBlackjack() &&
//    BlackjackPlayer_OnceSawNextCardWouldBust(17) &&  // once() clauses are internal to this function due to the complexity of the logic
//    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
//    , id=356435)

//achievement("I Will Not Stand For This", "Blackjack - Use See Deal Down when your hand value is 12 or more, revealing a higher-point card total, then win the hand",  5,
//    IsCompetitiveMode() && IsPlayingBlackjack() && once(ActiveHandPointValue() >= 12 && BlackjackPlayer_SawDealerHandHigherThisFrame()) &&
//    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
//    , id=356436)

achievement("Ready to Take a Stand", "Blackjack - Stand with a hand value between 12-17, safe with the knowledge that the dealer will bust", 5,
    // The following must all be true:
    // 1. Player's Hand Value is <= 17
    // 2. Player used See Deal Down
    // 3. Player used See Next Card since last card was dealt
    // 4. Dealer will hit (Dealer's Hand Value is <= 16 or "soft 17")
    // 5. Next card will cause dealer to bust
    // 6. (Final step) Player won the hand
    IsCompetitiveMode() && IsPlayingBlackjack() && once(BlackjackPlayer_UsedSeeDealDownCheatThisFrame()) &&
    Blackjack_SawDealerWillBust() && never(BlackjackPlayer_StartedEitherHandThisFrame())
    && BlackjackPlayer_WonEitherHandThisFrameWithPointRange(12,17) // && ActiveHandPointValue() <= 17 && BlackjackPlayer_WonEitherHandThisFrame()
    , id=357313)

achievement("An Offer He Can't Refuse", "Blackjack - Use Swap Card to raise your opponent's hand value above 21 points", 2,
    // Order of events:
    // * Player's Swap Card Cheat Quantity decremented (then incremented if player cancels out of it)
    // * Swap animation plays
    // * Opponent's Hand Point Value updated
    IsCompetitiveMode() && IsPlayingBlackjack() && BlackjackOpponent_SwappedThisFrame(21)
//    once(BlackjackPlayer_UsedSwapCardCheatThisFrame()) && 
//    never(BlackjackPlayer_GainedSwapCardCheatThisFrame()) &&
//    never(BlackjackPlayer_StartedEitherHandThisFrame()) &&
    , id=356437)

achievement("Limited Time Offer", "Slots - Purchase a bonus item (on Spin 3 or 7), place it (with the D-pad), and win the line", 3,
    IsCompetitiveMode() && IsPlayingSlots() &&
    // This logic is more complicated than one might expect due to the lack of a known address that specifically indicates "player purchased a bonus item".
    // Instead, we detect that the bonus item was visible on a certain slot machine/column on the previous frame, and now it is gone this frame (as well as
    // the spin ending this frame and the player winning the line).    
    (SlotsPlayer_WonLineWithBonusItem(1) || SlotsPlayer_WonLineWithBonusItem(2) || SlotsPlayer_WonLineWithBonusItem(3)) // once() clauses are internal to this function
    && never(SlotsPlayer_CompetitiveSpinEndedThisFrame())
    // Added this reset to prevent false trigger when bonus item is placed on a different line than the winning line
    && never(BonusItemMovedThisFrame())
//              SlotsPlayer_SpinEndedThisFrame() && 
//              SlotsPlayer_PlacedBonusItemThisFrame() && 
//              SlotsPlayer_WonLine()
    , id=356438)

achievement("Tri So Serious", "Video Poker - Have at least 3 Joker cards at the end of the hand (Competitive Mode only)", 3,
    IsCompetitiveMode() && IsPlayingVideoPoker() && 
//    IsOpponentsTurn() == 0 && // May need this to prevent false trigger when opponent does Swap Card evaluation by rapidly changing individual card values
    PokerPlayer_Has3Jokers() && PlayerWonHand_ThisFrame()
//              never(Increased(HandNumber())) && // have to reset tally() hits after each hand
//              never(Changed(CurrentCasinoGame())) && 
//              never(StartedCasinoGameThisFrame("Video Poker")) &&
//              PokerPlayer_HasInHand(3, "Joker") // counts number of Jokers in current hand using tally()
    , id=356439)

//achievement("Hey, I Was Using That!", "Video Poker - Use Swap Card to swap back a card taken from you", 2,
//    // TODO: check swap cards of both player and opponent - this is hard to implement!
//    // and what if opponent uses Swap Hand or two Swap Cards? maybe need to "record" player's cards at start of hand/draw?
//    // idea: 
//    // - have 5 "buckets" with value = initial card value
//    // - 1st hit target (1 hit) checks when a card value changes (reset on new draw/hand)
//    // - SubSource current card value at end of draw/hand
//    // - 2nd hit target (1 hit) checks if the value is 0 (card is back)
//    IsCompetitiveMode() && IsPlayingVideoPoker() && once(VideoPokerOpponent_UsedSwapCardCheatThisFrame()) && VideoPokerPlayer_UsedSwapCardCheatThisFrame()
//    , id=356440)

// ----------------------------------------------
// Optional (Scoring Event) Achievements
// ----------------------------------------------

achievement("Sound of Rain", "Slots - Win all 3 lines on one spin", 5,
    IsPlayingSlots() && // SlotsPlayer_SpinEndedThisFrame() &&
    SlotsPlayer_WonAll3LinesThisFrame() &&
    // This check might be redundant if the payout bet multiplier is only set if the winning line is active
    SlotsPlayersBetMultiplier() == 3
    // Use Delta value because the bet multiplier is zeroed out on the frame that the "spin ends"
//    prev(SlotsPlayersBetMultiplier()) == 3 
    , id=356441)

achievement("Cherry Picking", "Slots - Win any line with 2 Cherry (5x payout), 3 Cherry (10x), or 2 Orange (12x)", 2,
    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && 
    __ornext(SlotsPlayer_WonAnyLineWith("2Cherry") || SlotsPlayer_WonAnyLineWith("3Cherry") || SlotsPlayer_WonAnyLineWith("2Orange")) 
    , id=356442)

//achievement("Fruit Snacks", "Slots - Win any line with 2 Orange (12x payout) or 3 Orange (15x)", 2,
//    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() &&
//    __ornext(SlotsPlayer_WonAnyLineWith("2Orange") || SlotsPlayer_WonAnyLineWith("3Orange")) 
//)

achievement("Fruit Salad", "Slots - Win any line with 3 Orange (15x payout), 3 Plum (20x), or 3 Melon (25x)", 4,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Orange") || SlotsPlayer_WonAnyLineWith("3Plum") || SlotsPlayer_WonAnyLineWith("3Melon"))
    , id=356443)

achievement("Triple Threat", "Slots - Win any line with 3 Bell (50x payout), 3 Bar (100x), or non-jackpot 777 (200x)", 10,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Bell") || SlotsPlayer_WonAnyLineWith("3Bar") || SlotsPlayer_WonAnyLineWith("777"))
    , id=356444)

achievement("JACKPOT!", "Slots - Win the jackpot with a 3rd-line 777", 25,
    IsPlayingSlots() && SlotsPlayer_WonJackpotThisFrame() // && SlotsPlayer_JackpotPayoutThisFrame() && // SlotsPlayer_SpinEndedThisFrame()
    , id=356445)

achievement("Matchmaker", "Draw Poker - Win hand with two pair (2x VP payout) or 3 of a Kind (4x)", 2,
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() && 
    __ornext(PokerPlayer_WonWith("TwoPair") || PokerPlayer_WonWith("3OfKind"))
    , id=356446)

achievement("Color by Numbers", "Any Poker - Win hand with Straight (5x VP payout) or Flush (8x)", 3,
    IsPlayingPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("Straight") || PokerPlayer_WonWith("Flush"))
    , id=356447)

achievement("Now We're Talkin'", "Any Poker - Win hand with Full House (20x VP payout) or 4 of a Kind (50x)", 5,
    IsPlayingPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("FullHouse") || PokerPlayer_WonWith("4OfKind"))
    , id=356448)

achievement("Flushing With Style", "Any Poker - Win hand with Straight Flush (100x VP payout) or Royal Flush (250x)", 10,
    IsPlayingPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("StraightFlush") || PokerPlayer_WonWith("RoyalFlush"))
    , id=356449)

achievement("High Five!", "Video Poker - Win the jackpot with 5 of a Kind (requires 5x bet multiplier)", 10,
    IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() && PokerPlayer_WonWith("5OfKind")
    , id=356450)

// ----------------------------------------------
// Optional (Misc) Achievements
// ----------------------------------------------

achievement("Mob Money, Mob Problems", "Draw Poker - Defeat any gangster by making him run out of cash", 4,
    // Note: If the gangster both runs out of cash AND draw poker credits at the same time, the game treats it as running out of cash, 
    // so it is unnecessary to also check the draw poker credits value.
    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame(FinalCasinoGameName) && OpponentsCash() == 0
    , id=356451)

achievement("Unmade Man", "Draw Poker - Defeat any gangster by making him run out of Draw Poker Credits", 4,
    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame(FinalCasinoGameName) && OpponentsCash() > 0
    , id=356452)

//achievement("Bluff Enough?", "Draw Poker - Place or raise a bet that causes your opponent to fold while your hand rank is less than one pair", 10,
//    // We could limit this to 2nd draw only (if a memory address can be found to detect 2nd draw), but I've never seen the AI fold on the 1st draw 
//    // in response to the player's bet, so that might be pointless.
//    IsCompetitiveMode() && IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() &&
//    once(PlayersHandRankingType() == Poker_HandRankingTypeDict["None"] && DrawPokerPlayer_PlacedBet()) && // DrawPokerPlayer_PlacedBetThisFrame()) &&
//  //    once(Changed(PlayersLastActualBetAmount())) &&
//    once(DrawPoker_OpponentFolded()) &&
//    never(Increased(HandNumber())) && never(Increased(DrawNumber()))
//  //    disable_when(PlayersHandRankingType() != Poker_HandRankingTypeDict["None"], <player placed bet/raised>)
//    , id=356453)

achievement("Frugal Strats", "Slots - Beat your opponent without buying any cheats/bonus items nor placing any bets over $10 (3x mult. is allowed)", 3,
    IsCompetitiveMode() && IsPlayingSlots() && PlayerWonCasinoGameThisFrame("Slots") &&
    disable_when(PlayerPurchasedCheat(true) ||
        // If player purchases a bonus item, it will initally appear in the player's slot machine's central column
        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol2"] ||
        (bcd(PlayersActualBetAmountBCD()) > 10 && SlotsPlayer_PlacedBetThisFrame()), //SlotsPlayer_SpinStarted()),
        StartedCasinoGameThisFrame("Slots"))
//    never(StartedMissionThisFrame()) &&
//    unless(once(
//        PlayersCheatCoin1QuantityAtShady() > 0 ||
//        PlayersCheatCoin2QuantityAtShady() > 0 ||
//        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol2"] || // this won't work if this value can get set during Blackjack (see never() condition)
//        bcd(PlayersCurrentBetPayoutAmountBcd()) > 10
//     ))
    , id=356454)

// ----------------------------------------------
// Collection Achievements
// ----------------------------------------------

achievement("High Stakes High Roller", "Earn at least $350,000 end-of-mission winnings in one mission", 10,
    IsCompetitiveMode() && AnyMissionWinningsAtLeast(350000)
    , id=356455)

achievement("Depression-Era Millionaire", "Earn at least $1 million total end-of-mission winnings (excludes password-loaded winnings)", 10,
    IsCompetitiveMode() && TotalMissionWinnings() > 1000000
//    (TotalMissionWinnings() + PlayersCurrentMissionCashTotal())
    , id=356456)

//achievement("High Stakes High Roller", "Earn at least $1.5 million total end-of-mission winnings (excludes password-loaded winnings)", 25,
//    IsCompetitiveMode() && TotalMissionWinnings() > 1500000
//)

// ----------------------------------------------
// Challenge Achievements
// ----------------------------------------------

achievement("Sus Hands Are Afoot", "Blackjack - Make your opponent bust with a \"very non-suspicious\" hand value of 35 points or more", 5,
    IsCompetitiveMode() && IsPlayingBlackjack() && BlackjackOpponent_BustedThisFrame(35)
    , id=356457)

achievement("Forever 21", "Blackjack - Score at least five Blackjacks in one game", 10,
    IsCompetitiveMode() && IsPlayingBlackjack() && never(StartedMissionThisFrame()) &&
    // Used tally() instead of repeated() to avoid "combined || and && logic too complex for subclause" compile error
    tally(5, BlackjackPlayer_WonMainHandWithBlackjackThisFrame(), BlackjackPlayer_WonSplitHandWithBlackjackThisFrame())
    , id=356458)

achievement("What Big Hands You Have", "Blackjack - Have eight cards in your hand (bust allowed on last card)", 10,
    IsPlayingBlackjack() && (PlayersHandCardCount() >= 8 || PlayersSplitHandCardCount() >= 8) // && IsCompetitiveMode()
    , id=356459)

//achievement("I Ain't Got All Day", "Blackjack - Save time by having your opponent run out of cash before Hand 10", 10,
//    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame("Blackjack") && HandNumber() <= 9 &&
//    OpponentsCash() == 0 // this check is likely redundant because cash-out is the only way for the opponent to lose early
//)

achievement("Rosetti No Spaghetti", "Blackjack - Win all possible hands (allowed to lose on dealer B.J. or push on dealer 21)", 10,
    // Note: it is possible to achieve this and still lose the casino game if your opponent ends with more cash
    IsCompetitiveMode() && IsPlayingBlackjack() && EndedCasinoGameThisFrame() && // PlayerWonCasinoGameThisFrame("Blackjack") && 
        tally(10, BlackjackPlayer_WonMainHandThisFrame(), BlackjackPlayer_WonSplitHandThisFrame(), BlackjackDealer_HasBlackjackThisFrame(),
        BlackjackPlayer_MainHandPush21ThisFrame(), BlackjackPlayer_SplitHandPush21ThisFrame(), deduct(BlackjackPlayer_SplitThisFrame())) &&
        never(StartedMissionThisFrame())
    // Replaced problematic logic below with tally(10) that adds wins, dealer BJ, and dealer 21 + push, and subtracts on split

//    disable_when(BlackjackPlayer_MainHandAvoidableLoss(), StartedMissionThisFrame()) &&
//    disable_when(BlackjackPlayer_MainHandAvoidablePush(), StartedMissionThisFrame()) &&
//    disable_when(BlackjackPlayer_SplitHandAvoidableLoss(), StartedMissionThisFrame()) &&
//    disable_when(BlackjackPlayer_SplitHandAvoidablePush(), StartedMissionThisFrame())

    // A single disable_when() with || conditions and until clause (ResetNextIf) would be preferable here, but the logic is too
    // complex for RAScript to generate it.
//    (   
//        (
//            disable_when(BlackjackPlayer_MainHandAvoidableLoss()) && disable_when(BlackjackPlayer_MainHandAvoidablePush()) &&
//            disable_when(BlackjackPlayer_SplitHandAvoidableLoss()) && disable_when(BlackjackPlayer_SplitHandAvoidablePush())
//        ) || never(StartedMissionThisFrame())
//    )
    , id=356460)


//achievement("Knew When to Hold 'Em", "Draw Poker - When your opponent raises your bet, keep playing the hand and win it", 5,
//    IsCompetitiveMode() && IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() &&
// //    once(DrawPokerPlayer_PlacedBetThisFrame()) &&
//    once(DrawPokerPlayer_PlacedBet()) && once(DrawPokerOpponent_RaisedBetThisFrame()) &&
//    never(Increased(HandNumber())) && never(Increased(DrawNumber())) 
//    , id=356461)

//achievement("Rosetti No Spaghetti", "Draw Poker - Win without losing a single hand", 10,
//    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame("Draw Poker") && disable_when(DrawPokerPlayer_LostHandThisFrame(), StartedMissionThisFrame())
//)

achievement("Honest Pete", "Complete Mission 1 without buying any cheats from Shady", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 1 && once(StartedMissionThisFrame()) && never(PlayerPurchasedCheat(false)) && trigger_when(WonMissionThisFrame())
// This alternative logic should have the same end result in terms of achievement functionality as once/never, but it uses an (uneeded) PauseLock
//     disable_when(PlayerPurchasedCheat(false), StartedMissionThisFrame())
    , id=356462)

achievement("Cheatin' Pete", "Complete Mission 2 while buying out every cheat from Shady (twice per casino game, from 0 to max qty)", 10,
    // We need to reset the count at the start of the mission (rather than just start the count, as done for "Honest Pete")
    IsCompetitiveMode() && never(StartedMissionThisFrame()) && WonMissionThisFrame() &&
    // Note: cannot use MeasuredIf to check if at Shady because the cheat qty can increase if player cancels out of a cheat (such as Swap Card) during gameplay,
    // and we don't want to count that. (MeasuredIf would only limit when the count is displayed.)
    measured(repeated(MaxCheatsPerMission, DisplayedMissionNumber() == 2 && IsAtScreen("Shady") && PlayerPurchasedCheatThisFrame()))
    , id=356463)

achievement("I Ain't Got All Day", "Complete Mission 3 in six hands of Draw Poker or less", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 3 && IsPlayingDrawPoker() && HandNumber() <= 6 && trigger_when(WonMissionThisFrame())
    , id=356464)

//achievement("Name TBD", "Complete Mission 4 with at least 350K in cash winnings", 10,
//    IsCompetitiveMode() && DisplayedMissionNumber() == 4 && Increased(Winnings(4)) && Winnings(4) >= 350000 && measured(PlayersCurrentMissionCashTotal() >= 350000)
//)

achievement("Lucky Louis Sleeps With the Fishes", "Complete Mission 4 without losing any casino games", 10,
    // TODO (maybe): rewrite as the reverse check (invalidate when a casino game lost, otherwise awarded at game end) so a trigger flag can be added?
    IsCompetitiveMode() && DisplayedMissionNumber() == 4 && PlayerWonAllCasinoGamesThisFrame()
    , id=356465)

achievement("Al Col-Owned", "Complete Mission 5 with at least 12 Draw Poker Credits remaining", 25,
    WonCompetitiveModeThisFrame() && PlayersScoreCardTotal() >= 12
    , id=356466)

//achievement("The Ultimate Stakes", "Defeat all five gangsters without losing any casino games (nor using a password)", 50,  
//    // Count missions with all casino games won up to 5, reset at the start of competitive mode
//    WonCompetitiveModeThisFrame() && repeated(5, PlayerWonAllCasinoGamesThisFrame()) && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
//)

// ----------------------------------------------
// Craps Achievements
// ----------------------------------------------

achievement("Craps Academy: It's Only Natural", "Craps - Win a Pass line bet by rolling a \"natural\" (7 or 11) on the come-out roll", 1,
    IsPlayingCraps() && CrapsRoll_IsNatural() && CrapsPlayer_WonBetThisFrame("Pass") // && CrapsPlayer_WonBetThisFrame(PassBetAmount())
    , id=356467)

achievement("Craps Academy: Got the Craps", "Craps - Win a Don't Pass line bet by rolling \"craps\" (2 or 3 to win, 12 to push) on the come-out roll", 1,
    IsPlayingCraps() && CrapsRoll_IsCraps() && CrapsPlayer_WonBetThisFrame("DontPass") // && CrapsPlayer_WonBetThisFrame(DontPassBetAmount())
    , id=356468)

achievement("Craps Academy: Come to Papa", "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Come line bet by rolling 7 or 11", 1,
    IsPlayingCraps() && CrapsRoll_IsNatural() && CrapsPlayer_WonBetThisFrame("Come") // && CrapsPlayer_WonBetThisFrame(ComeBetAmount())
    , id=356469)

achievement("Craps Academy: Mama Told Me Not To", "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Don't Come line bet by rolling 2 or 3 (12 to push)", 1,
    IsPlayingCraps() && CrapsRoll_IsCraps() && CrapsPlayer_WonBetThisFrame("DontCome") // && CrapsPlayer_WonBetThisFrame(DontComeBetAmount())
    , id=356470)

achievement("Craps Academy: OK, I Get the Point",
    "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Pass line bet by rerolling the point number", 1,
    IsPlayingCraps() && CrapsRoll_IsPoint() && (CrapsPlayer_WonBetThisFrame("Pass") || CrapsPlayer_WonBetThisFrame("PassOdds"))
    // && (CrapsPlayer_WonBetThisFrame(PassBetAmount()) || CrapsPlayer_WonBetThisFrame(PassOddsBetAmount()))
    , id=356471)

achievement("Craps Academy: What's in the Box?",
    "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Don't Pass line bet by \"sevening out\" (roll a 7)", 1,
    IsPlayingCraps() && CombinedDiceRoll() == 7 && (CrapsPlayer_WonBetThisFrame("DontPass") || CrapsPlayer_WonBetThisFrame("DontPassOdds"))
    // && (CrapsPlayer_WonBetThisFrame(DontPassBetAmount()) || CrapsPlayer_WonBetThisFrame(DontPassOddsBetAmount()))
    , id=356472)

achievement("Craps Academy: Crapshoot", "Craps - Win at least 5 different single-roll bets (Craps #, Seven, Yoleven, Any Craps, C & E, Horn, Field)", 2,
    IsPlayingCraps() && CrapsPlayer_WonSingleRollBets(5) && // internally uses tally w/ hit counts to track bets won
    // Only reset count if player exits craps
    never(!IsPlayingCraps())
    , id=356473)

achievement("Craps Academy: Rollin', Rollin', Rollin'", "Craps - Win at least 5 different multi-roll bets (Place #, Buy #, Lay #, Hard #, Big #)", 2,
    IsPlayingCraps() && CrapsPlayer_WonMultiRollBets(5) && // internally uses tally w/ hit counts to track bets won
    // Only reset count if player exits craps
    never(!IsPlayingCraps())
    , id=356474)

achievement("Putting It All Together", "Craps - Win a line, multi-roll, and single-roll bet on the same roll (without any other bets on the table)", 5,
    IsPlayingCraps() && unless(CrapsPlayer_PlacedBets(4)) && CrapsPlayer_WonLineBets(1) && CrapsPlayer_WonSingleRollBets(1) && CrapsPlayer_WonMultiRollBets(1) &&
    (always_true() || never(CrapsPlayer_TurnStarted()))
    // This is way too complex - generates over 1000 alt groups and slows RATools to a halt
// && unless(CrapsPlayer_LostAnyBetThisFrame()) && never(StartedCrapsRollThisFrame()) &&
//    CrapsPlayer_WonBetThisFrame("Any Line") && CrapsPlayer_WonBetThisFrame("Any Single") && CrapsPlayer_WonBetThisFrame("Any Multi")
    , id=356475)

achievement("Craptastic", "Craps - Have exactly 9 bets on the table and win them all on the same roll", 10,
    // This is a craps "puzzle challenge" of sorts where the difficulty is in the player using their knowledge of craps betting to work out the solution.
    // Solution:
    //   1. Bet on: Don't Pass, Come (or Don't Come X), Seven, Lay 4/5/6/8/9/10
    //   2. Roll a 7
    //   (Note: this can't be done on the come-out roll)
    IsPlayingCraps() && unless(CrapsPlayer_PlacedBets(10)) && CrapsPlayer_WonAnyBets(9) &&
    (always_true() || never(CrapsPlayer_TurnStarted()))
    , id=356476)

achievement("Baby Needs New Shoes!", "Craps - Starting with $10,000, double your money", 10,
    IsPlayingCraps() && once(PlayersCashBCD() == 0x10000) && PlayersCashBCD() >= 0x20000 && never(!IsPlayingCraps())
    , id=356477)

// ************************************************************************************************
//                                          Rich Presence
// ************************************************************************************************

CasinoGameLookup = {
    0: "[Nothing]",
    1: "♠♥ Blackjack ♦♣",
    2: "🎲 Craps 🎲",
    4: "♣♦ Draw Poker️ ♥♠",
    8: "🎰 Slots 🎰",
    16: "🃏 Video Poker️ 🃏",
}

GangsterLookup = {
    0: "Machine Gun Max",
    1: "Suitcase Sam",
    2: "Hitman Harry",
    3: "Lucky Louis",
    4: "Al Cologne",
}

RP_IsAtMenu = (IsAtScreen("ModeOrPlayPasswordSelect") || IsAtScreen("TitleScreen") || IsAtScreen("CopyrightScreen")) &&
              (IsAtMenu("ModeOrPlayPasswordSelect") || IsAtMenu("CopyrightOrTitleScreen"))

RP_IsBetweenMissions  = IsAtScreen("MissionScore") || IsAtScreen("GangsterPortrait")

RP_MissionNumber = rich_presence_value("Number", DisplayedMissionNumber())
RP_Gangster = rich_presence_lookup("Gangster", CurrentMission(), GangsterLookup)
RP_Winnings = rich_presence_value("Number", TotalMissionWinnings() + PlayersPasswordCashWinnings()) // + PlayersCurrentMissionCashTotal()
RP_CasinoGame = rich_presence_lookup("CasinoGame", CurrentCasinoGame(), CasinoGameLookup)
RP_Cash = rich_presence_value("Number", PlayersCash())
RP_CashBCD = rich_presence_value("Number", bcd(PlayersCashBCD()))

// Display if at Title Screen/Menus
rich_presence_conditional_display(RP_IsAtMenu, "[Title Screen/Menu]")

// Display if at Mission Start/End (in Competitive Mode)
rich_presence_conditional_display(IsCompetitiveMode() && RP_IsBetweenMissions,
    "Mission {0}: {1} | Winnings: ${2}", RP_MissionNumber, RP_Gangster, RP_Winnings)

// Display if playing Competitive Mode - Blackjack/Poker
rich_presence_conditional_display(IsCompetitiveMode() && (IsPlayingBlackjack() || IsPlayingPoker()),
    "Mission {0}: {1} | Playing: {2} | 💰: ${3} | Winnings: ${4}", RP_MissionNumber, RP_Gangster, RP_CasinoGame, RP_Cash, RP_Winnings)

// Display if playing Competitive Mode - Slots
rich_presence_conditional_display(IsCompetitiveMode() && IsPlayingSlots(),
    "Mission {0}: {1} | Playing: {2} | 💰: ${3} | Winnings: ${4}", RP_MissionNumber, RP_Gangster, RP_CasinoGame, RP_CashBCD, RP_Winnings)

// Display if playing Practice Mode - Blackjack/Poker
rich_presence_conditional_display(IsPlayingBlackjack() || IsPlayingVideoPoker(),
    "Practicing: {0} | 💰: {1}", RP_CasinoGame, RP_Cash)

// Display if playing Practice Mode - Slots/Craps
rich_presence_conditional_display(IsPlayingSlots() || IsPlayingCraps(),
    "Practicing: {0} | 💰: {1}", RP_CasinoGame, RP_CashBCD)

// Display for any other screens (non-gameplay assumed b/c any gameplay should be handled by the conditionals above to print relevant info)
rich_presence_display("[Gameplay Not Started]")

// ************************************************************************************************
//                                          Leaderboards
// ************************************************************************************************

function LB_Cash(mission, is_total, LB_id) {
    trigger = IsCompetitiveMode() && DisplayedMissionNumber() == mission && PlayerWonDrawPokerFlag() == 1 && Increased(Winnings(mission)) // WonMissionThisFrame()

    if (is_total == true) {
        title = "Total Cash Winnings (non-password)"
        desc = "Highest cash total at end of game (excludes password winnings)"
        winnings = TotalMissionWinnings()
    }
    else {
        title = format("Mission {0} Cash Winnings", mission)
        desc = format("Most cash won in Mission {0}", mission)
        winnings = Winnings(mission)    
    }

    // Starts and submits on the same frame
    leaderboard(title, desc, trigger, always_false(), always_true(), winnings, id=LB_id)
}

LB_Cash(1, false, 77630)
LB_Cash(2, false, 77631)
LB_Cash(3, false, 77632)
LB_Cash(4, false, 77633)
LB_Cash(5, false, 77634)
LB_Cash(5, true, 77635)

function LB_Credits(mission, LB_id) {
    trigger = IsCompetitiveMode() && DisplayedMissionNumber() == mission && PlayersScoreCardTotal() > 0 && WonMissionThisFrame()

    title = format("Mission {0} Draw Poker Credits", mission)
    desc = format("Most Draw Poker Credits remaining on Mission {0} win", mission)
    credits = PlayersScoreCardTotal()

    // Starts and submits on the same frame
    leaderboard(title, desc, trigger, always_false(), always_true(), credits, id=LB_id)
}

LB_Credits(1, 77636)
LB_Credits(2, 77637)
LB_Credits(3, 77638)
LB_Credits(4, 77639)
LB_Credits(5, 77640)