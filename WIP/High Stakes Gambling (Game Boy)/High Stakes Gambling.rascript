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
function IsPlayersCard1Held() => byte(0x00C236)
function IsPlayersCard2Held() => byte(0x00C23A)
function IsPlayersCard3Held() => byte(0x00C23E)
function IsPlayersCard4Held() => byte(0x00C242)
function IsPlayersCard5Held() => byte(0x00C246)
IsPlayersCardHeldDict = {"Not Selected": 0x00, "Deselected": 0x03, "Selected": 0x06}

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
//        07 = Entry Fee/Ante Display, Slots Gameplay
//        08 = Blackjack/Draw Poker Gameplay
//        09 = Title Screen
//        0a = Password Screen (both entry and display-only)
//        0b = Score Card
//        20 = Copyright Screen (appears before Title Screen)
//        (Unmodified/Keeps Prev Value) = Slots/Craps Gameplay, Practice Game Select, Credits, Pre-Mission Cash Display, Out of Cash Screen
function GameState() => byte(0x00C2B2)
GameStateDict = {"MissionScore": 0x01, "GangsterPortrait": 0x02, "ModeOrPlayPasswordSelect": 0x05, "Shady": 0x06, "TitleScreen": 0x09,
    "ScoreCard": 0x0B, "CopyrightScreen": 0x20
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
function PlayersHandResult_IsActiveFlag() => bit3(0x00CC0D)
function PlayersHandResult_IsWonFlag() => bit5(0x00CC0D)
DrawPoker_HandResultDict = {"Fold": 0x09}

// $CC05: [32-bit] Player's Cash
//        (Blackjack/Video Poker/Draw Poker)
function PlayersCash() => dword(0x00CC05)

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

// $CC2B: [32-bit] Player's Actual Payout
//        (Blackjack/Video Poker/Draw Poker)
function PlayersActualPayout() => dword(0x00CC2B)

// $CC2F: [16-bit] Player's Last Actual Bet Amount
//        (Blackjack/Draw Poker)
function PlayersLastActualBetAmount() => word(0x00CC2F)

// $CC33: [32-bit] Player's Current Mission Cash Total
//        (Excluding cash put into current casino game)
function PlayersCurrentMissionCashTotal() => dword(0x00CC33)

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

// $FFC9: [8-bit] Established Point Number
//        (Craps)
function EstablishedPointNumber() => byte(0x00FFC9)

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
    // TODO: test if this revised version works with Video Poker jackpot
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

    return DisplayedMissionNumber() == FinalMissionNum &&
           WonMissionThisFrame()
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
    // TODO (maybe): do we need to also protect against potential fake passwords with no cash winnings?
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
        return PlayersMission3CashWinnings()
    else if (mission == 5)
        return PlayersMission5CashWinnings()
}

function TotalMissionWinnings() {
    return PlayersMission1CashWinnings() + PlayersMission2CashWinnings() + PlayersMission3CashWinnings() + PlayersMission4CashWinnings() +  PlayersMission5CashWinnings()
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

function BlackjackPlayer_WonMainHand() => PlayersHandResult_IsActiveFlag() == 1 && PlayersHandResult_IsWonFlag() == 1
function BlackjackPlayer_WonSplitHand() => PlayersSplitHandResult_IsActiveFlag() == 1 && PlayersSplitHandResult_IsWonFlag() == 1
function BlackjackPlayer_WonMainHandWithBlackjack() => BlackjackPlayer_WonMainHand() && PlayersHandResult_IsSpecialFlag() == 1
function BlackjackPlayer_WonSplitHandWithBlackjack() => BlackjackPlayer_WonSplitHand() && PlayersSplitHandResult_IsSpecialFlag() == 1
function BlackjackPlayer_WonMainHandWithBlackjackThisFrame() => Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHandWithBlackjack()
function BlackjackPlayer_WonSplitHandWithBlackjackThisFrame() => Changed(PlayersSplitHandResult()) && BlackjackPlayer_WonSplitHandWithBlackjack()
function BlackjackPlayer_WonEitherWithBlackjackThisFrame() => BlackjackPlayer_WonMainHandWithBlackjackThisFrame() ||  BlackjackPlayer_WonSplitHandWithBlackjackThisFrame()

function BlackjackPlayer_WonEitherHandThisFrame() {
    return (Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHand()) ||
           (Changed(PlayersSplitHandResult()) && BlackjackPlayer_WonSplitHand())
}

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

function BlackjackOpponent_BustedMainHand() {
    return PlayersHandResult_IsActive() == 1 && PlayersHandResult_IsWon() == 1 && PlayersHandResult_IsSpecial() == 1
}

function BlackjackOpponent_WonSplitHandWithBlackjack() {
    return PlayersSplitHandResult_IsActive() == 1 && PlayersSplitHandResult_IsWon() == 1 && PlayersSplitHandResult_IsSpecial() == 1
}

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

function BlackjackPlayer_OnceSawNextCardWouldBust(max_hand_value) {
    HandPointValue = ActiveHandPointValue()
    NextCardRank = TopmostCardRank() 
    IsFaceCard = __ornext(NextCardRank == CardRankDict["Jack"] || NextCardRank == CardRankDict["Queen"] || NextCardRank == CardRankDict["King"])
    IsAce = NextCardRank == CardRankDict["Ace"]
    
    // once() logic had to be made internal to this function due to the complexity otherwise causing a compile error
    return once(HandPointValue <= max_hand_value && BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && IsFaceCard              && (HandPointValue +             10) > 21) ||        
           once(HandPointValue <= max_hand_value && BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && IsAce                   && (HandPointValue +              1) > 21) ||
           once(HandPointValue <= max_hand_value && BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && NextCardRank <= 10      && (HandPointValue + NextCardRank  ) > 21)    
}

function BlackjackPlayer_SawDealerHandHigherThisFrame() {
    return BlackjackPlayer_UsedSeeDealDownCheatThisFrame() &&
        DealersHandPointValue() > ActiveHandPointValue()
}

// Don't count it as "spin ending" when the spin counter is being initialized from 0 to 1 before the first spin
//function SlotsPlayer_PracticeSpinEndedThisFrame() => Increased(PracticeSpinCounter()) && prev(PracticeSpinCounter()) > 0

// Warning: this does not trigger on Spin 10 ending so it should only be used where that is acceptable
function SlotsPlayer_CompetitiveSpinEndedThisFrame() => Increased(SpinNumber())
// || PlayerWonCasinoGameThisFrame(casino_game_name)

function SlotsPlayer_SpinStarted() => Changed(PlayersReel1Position())
//function SlotsPlayer_SpinEnded() => Unchanged(PlayersReel3Position()) // don't use b/c doesn't account for bonus item usage

// TODO: check whether this function is unneeded
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
    // TODO: may need to adjust frame timing depending on the order these events occur
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

function VideoPokerPlayer_HandScoringIncreasedThisFrame() {
    // New hand must have higher "type" than old hand AND be "Pair of Jacks" or better
    return Increased(PlayersHandRankingType()) &&
        PlayersHandRanking() >= Poker_HandRankingDict["PairOfJacks"]
}

function VideoPokerPlayer_UsedSwapCardCheatThisFrame()   => Decreased(PlayersCheatCard2Quantity())
function VideoPokerOpponent_UsedSwapCardCheatThisFrame() => Decreased(OpponentsCheatCard2Quantity())

function DrawPoker_OpponentFolded() => OpponentsHandResult() == DrawPoker_HandResultDict["Fold"]

function DrawPokerPlayer_LostHandThisFrame() {
    // Note: this function will not trigger upon losing final hand because hand number will not increase (but that is acceptable
    // for the only achievement where it is currently used, because it is not possible to both lose the final hand and win the game)
    return Increased(HandNumber()) &&
    // Alternatively, we might be able to check player's payout == 0
           PlayersHandRanking() < OpponentsHandRanking() &&
           !DrawPoker_OpponentFolded()
}

function DrawPokerPlayer_PlacedBetThisFrame() {
    // Can be regular bet or bet raise
    return IsOpponentsTurn() == 0 && LastPlacedBetAmount() > 0 && LastPlacedBetAmount() == PlayersLastActualBetAmount() && Changed(LastPlacedBetAmount())
}

function DrawPokerOpponent_RaisedBetThisFrame() {
    // When opponent raises on their turn: First, the "Last Placed Bet Amount" is zeroed out before the bet is made. Upon making the bet, "Last Placed Bet Amount" and
    // "Opponent's Last Actual Bet Amount" are set to the bet amount. If the opponent calls instead, "Last Placed Bet Amount" will remain zero, but the
    // "Opponent's Last Actual Bet Amount" will be set to the called bet amount.
    // TODO: fix false trigger when opponent only bet (not raised) then player won hand (b/c "Player's Last Actual Bet Amount" is not cleared from previous hand)
    // need to check that player already had a turn this hand?
    return IsOpponentsTurn() == 1 && PlayersLastActualBetAmount() > 0 &&
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

function PokerPlayer_IsAnyCardHeld() {
    return __ornext(IsPlayersCard1Held() == IsPlayersCardHeldDict["Selected"] || IsPlayersCard2Held() == IsPlayersCardHeldDict["Selected"] ||
                    IsPlayersCard3Held() == IsPlayersCardHeldDict["Selected"] || IsPlayersCard4Held() == IsPlayersCardHeldDict["Selected"] ||
                    IsPlayersCard5Held() == IsPlayersCardHeldDict["Selected"] )
}

function StartedCrapsRollThisFrame() => Changed(CombinedDiceRoll()) && CombinedDiceRoll() != 0
function CrapsRoll_IsNatural() => CombinedDiceRoll() == 7 || CombinedDiceRoll() == 11
function CrapsRoll_IsCraps() => CombinedDiceRoll() == 2 || CombinedDiceRoll() == 3 || CombinedDiceRoll() == 12
function CrapsRoll_IsPoint() => CombinedDiceRoll() == EstablishedPointNumber()

//function IsShowingBetResults() => ShowingBetResults() == ShowingBetResultsDict["Yes"]
function CrapsPlayer_ControlPaused() => IsCrapsPlayersTurn() == 0

// TODO: add "Come Odds" and "Don't Come Odds" bets?
LineBetAmounts = [PassBetAmount(), DontPassBetAmount(), ComeBetAmount(), DontComeBetAmount(), PassOddsBetAmount(), DontPassOddsBetAmount()]
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

function Craps_BetResolvedThisFrame(bet_amount) {
    // TODO: "Any Craps" bet is not zeroed out/removed from table when won (game bug?)
    return CrapsPlayer_ControlPaused() && ZeroedOut(bet_amount)
}

function CrapsPlayer_WonBetThisFrame(bet_amount) {
    // When a bet is won, the associated bet amount is zeroed out on the same frame the player's cash is increased (to refund the bet amount)
    return Increased(PlayersCashBCD()) && Craps_BetResolvedThisFrame(bet_amount)
}

function CrapsPlayer_WonSingleRollBets(bet_count) {
    return tally_of(SingleBetAmounts, bet_count, bet_amount => once(CrapsPlayer_WonBetThisFrame(bet_amount)))
}

function CrapsPlayer_WonMultiRollBets(bet_count) {
    return tally_of(MultiBetAmounts, bet_count, bet_amount => once(CrapsPlayer_WonBetThisFrame(bet_amount)))
}

function CrapsPlayer_WonAnyLineBetThisFrame() {
    return any_of(LineBetAmounts, bet_amount => CrapsPlayer_WonBetThisFrame(bet_amount))
}

function CrapsPlayer_WonAnySingleRollBetThisFrame() {
    return any_of(SingleBetAmounts, bet_amount => CrapsPlayer_WonBetThisFrame(bet_amount))
}

function CrapsPlayer_WonAnyMultiRollBetThisFrame() {
    return any_of(MultiBetAmounts, bet_amount => CrapsPlayer_WonBetThisFrame(bet_amount))
}

// Second attempt
function CrapsPlayer_LostAnyBetThisFrame() {
    LostThisFrame = Unchanged(PlayersCashBCD())
    return tally_of(AllBetAmounts, 1, bet_amount => CrapsPlayer_ControlPaused() && LostThisFrame && ZeroedOut(bet_amount))
//    return any_of(AllBetAmounts, betamount => CrapsBet_IsEvaluation() && LostThisFrame && ZeroedOut(betamount))
}

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
//    // TODO: is PlayersHandRanking check needed?
//    return PlayersHandCardCount() == 5 && prev(PlayersHandCardCount()) < 5 && PlayersHandRanking() != 0
//}

// ************************************************************************************************
//                                          Achievements
// ************************************************************************************************

// ----------------------------------------------
// Tutorial (Practice Mode) Achievements
// ----------------------------------------------

achievement("Blackjack Basics - Name of the Game", "[Practice/Blackjack] Score a Blackjack (two-card 21 - increases payout by half)", 1,
    IsPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_WonEitherWithBlackjackThisFrame()
)

achievement("Blackjack Basics - Double Trouble", "[Practice/Blackjack] Double down and win the hand (bet doubled, dealt exactly one more card)", 1,
    IsPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_DoubledDownAndWonThisFrame()
)

achievement("Blackjack Basics - Psychic Training", "[Practice/Blackjack] Buy or refuse insurance and have it pay off (dealer has face-up ace - costs half your bet, refunds original bet if dealer has B.J.)", 2,
    IsPracticeMode() && IsPlayingBlackjack() &&
    ((BlackjackPlayer_BoughtInsurance() && DealersHandPointValue() == 21) || (BlackjackPlayer_DeclinedInsurance() && DealersHandPointValue() != 21))
)

achievement("Blackjack Basics - Make Like a Banana and...", "[Practice/Blackjack] Split and win both hands (two same-value cards - play them as separate hands, each with original bet)", 2,
    IsPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_WonBothSplitHandsThisFrame()
)

achievement("Slots Basics - Cherry Picking", "[Practice/Slots] Win any line with 1 Cherry (2x payout) or 2 Cherry (5x)", 1,
    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && // SlotsPlayer_PracticeSpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("1Cherry") || SlotsPlayer_WonAnyLineWith("2Cherry")) 
)

achievement("Slots Basics - One-Armed Banditry", "[Practice/Slots] Bet on all three lines and win at least two of them on the same spin", 1,
    IsPracticeMode() && IsPlayingSlots() && // SlotsPlayer_PracticeSpinEndedThisFrame() &&
    // Use Delta value because the bet multiplier is zeroed out on the frame that the "spin ends"
    SlotsPlayer_WonAtLeast2LinesThisFrame() &&
    // This check might be redundant if the payout bet multiplier is only set if the winning line is active
    SlotsPlayersBetMultiplier() == 3
    // Use Delta value because the bet multiplier is zeroed out on the frame that the "spin ends"
//    prev(SlotsPlayersBetMultiplier()) == 3     
)

achievement("Video Poker Basics - Can You Hold, Please?", "[Practice/Video Poker] Press the (H)old button underneath at least one card and have a higher-scoring hand on the second draw", 1,
    // Note: This does not track whether the hold button remained pressed, only that it was pressed at some point. Doing the former would be difficult 
    // because the 2nd draw resets all 5 "Card X Held" addresses to the same value (0x03) as if the hold were deselected by the player, and there doesn't
    // seem to be a good way to detect when the Draw button was pressed, either.
    IsPracticeMode() && IsPlayingVideoPoker() && once(PokerPlayer_IsAnyCardHeld()) && never(Increased(HandNumber())) &&
    VideoPokerPlayer_HandScoringIncreasedThisFrame()
//    once(PokerPlayer_AtLeastTwoCardsWereHeld())
//    disable_when(PlayersHandCardCount() == 0, Increased(HandNumber()))
//    never(Increased(HandNumber())) && unless(PlayersHandCardCount() == 0)
//    once(PokerPlayer_DealtNewCards())
//    PokerPlayer_AtLeastOneCardValueChanged())  // this is redundant because we checked that hand scoring increased - no?
)

achievement("Video Poker Basics - Paired Up", "[Practice/Video Poker] Win hand with one pair of \"Jacks or better\" (1x payout) or two pair (2x)", 1,
    IsPracticeMode() && IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("OnePair") || PokerPlayer_WonWith("TwoPair"))
)


achievement("Craps Basics - It's Only Natural", "[Practice/Craps] Win a \"Pass\" line bet by rolling a \"natural\" (7 or 11) on the come-out roll", 1,
    IsPlayingCraps() && CrapsRoll_IsNatural() && CrapsPlayer_WonBetThisFrame(PassBetAmount())
)

achievement("Craps Basics - Got the Craps", "[Practice/Craps] Win a \"Don't Pass\" line bet by rolling \"craps\" (2 or 3 to win, 12 to push) on the come-out roll", 1,
    IsPlayingCraps() && CrapsRoll_IsCraps() && CrapsPlayer_WonBetThisFrame(DontPassBetAmount())
)

achievement("Craps Basics - Hold the Line", "Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a \"Come\" line bet by rolling 7 or 11", 1,
    IsPlayingCraps() && CrapsRoll_IsNatural() && CrapsPlayer_WonBetThisFrame(ComeBetAmount())
)

achievement("Craps Basics - Mama Told Me Not To", "Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a \"Don't Come\" line bet by rolling 2 or 3 (12 to push)", 1,
    IsPlayingCraps() && CrapsRoll_IsCraps() && CrapsPlayer_WonBetThisFrame(DontComeBetAmount())
)

achievement("Craps Basics - OK, OK, I Get the Point", "Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a \"Pass\" or \"Pass Odds\" line bet by rolling the point number", 1,
    IsPlayingCraps() && CrapsRoll_IsPoint() && (CrapsPlayer_WonBetThisFrame(PassBetAmount()) || CrapsPlayer_WonBetThisFrame(PassOddsBetAmount()))
)

achievement("Craps Basics - What's in the Box?", "Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a \"Don't Pass\" or \"Don't Pass Odds\" line bet by \"sevening out\" (roll a 7)", 1,
    IsPlayingCraps() && CombinedDiceRoll() == 7 && (CrapsPlayer_WonBetThisFrame(DontPassBetAmount()) || CrapsPlayer_WonBetThisFrame(DontPassOddsBetAmount()))
)

achievement("Craps Basics - Crapshoot", "Win at least 3 different single-roll bets (Craps #, Seven, Yoleven, Any Craps, C & E, Horn, Field)", 2,
    IsPlayingCraps() && CrapsPlayer_WonSingleRollBets(3) && // internally uses tally w/ hit counts to track bets won
    // Reset count if player exits craps
    never(!IsPlayingCraps())
)

achievement("Craps Basics - Rollin', Rollin', Rollin'", "[Practice/Craps] Win at least 3 different multi-roll bets (Place #, Buy #, Lay #, Hard #, Big #)", 2,
    IsPlayingCraps() && CrapsPlayer_WonMultiRollBets(3) && // internally uses tally w/ hit counts to track bets won
    // Reset count if player exits craps
    never(!IsPlayingCraps())
)

// ----------------------------------------------
// Progression Achievements
// ----------------------------------------------

// Adds an achievement for winning the specified mission/casino game with the given title and points
function WinStageAchievement(mission, casino_game_num, ach_title, ach_points)
{
    CasinoGameName = GetCasinoGameName(casino_game_num)
    if (casino_game_num == 4)
        ach_desc = format("[Competitive/Mission {0}] Defeat {2} (win at {1})", mission, CasinoGameName, GetGangsterName(mission))
    else
        ach_desc = format("[Competitive/Mission {0}] Win at {1} vs. {2}", mission, CasinoGameName, GetGangsterName(mission))

    achievement(ach_title, ach_desc, ach_points,
        DisplayedMissionNumber() == mission && PlayerWonCasinoGameThisFrame(CasinoGameName)
    )
}

// Add achievements for winning each Competitive Mode mission/casino game
// Mission 1 - Machine Gun Max
WinStageAchievement(1, 1, "Machine Gun Max, Meet Bulletproof Bob", 2)
WinStageAchievement(1, 2, "Just Call It Beginner's Luck", 2)
WinStageAchievement(1, 3, "Loserus Maximus", 2)
WinStageAchievement(1, 4, "Max Maxed Out", 5)
// Mission 2 - Suitcase Sam
WinStageAchievement(2, 1, "Suitcase Shakedown", 3)
WinStageAchievement(2, 2, "I Do Not Lose Them, Sam-I-Am", 3)
WinStageAchievement(2, 3, "Sam Clubbed", 3)
WinStageAchievement(2, 4, "Unpacked Suitcase Sam", 5)
// Mission 3 - Hitman Harry
WinStageAchievement(3, 1, "Harry's Not So Scary", 4)
WinStageAchievement(3, 2, "You're No Wizard, Harry", 4)
WinStageAchievement(3, 3, "Blood Money Transfusion", 4)
WinStageAchievement(3, 4, "Whacked the Hitman", 5)
// Mission 4 - Lucky Louis
WinStageAchievement(4, 1, "Louis the Not-So-Great", 10)
WinStageAchievement(4, 2, "More Like Unlucky Louis, Amirite?", 5)
WinStageAchievement(4, 3, "You're Out of Luck, I'm Out of Time", 10)
WinStageAchievement(4, 4, "Louie, Louie, You Gotta Go", 10)
// Mission 5 - Al Cologne
WinStageAchievement(5, 1, "Cologne Bolonga", 10)
WinStageAchievement(5, 2, "Say Hello to My Little Spend", 5)
WinStageAchievement(5, 3, "Nice Try, Wiseguy", 10)
WinStageAchievement(5, 4, "Ding, Don Done", 10)

achievement("Brought Down the Mob", "[Competitive/All Missions] Defeat all five gangsters without using a password", 25,
    WonCompetitiveModeThisFrame() && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
)

// ----------------------------------------------
// Optional (Item Usage) Achievements
// ----------------------------------------------

achievement("Bustin' Don't Make Me Feel Good", "[Competitive/Blackjack] Use See Next Card (with a hand value of 17 or less) to reveal a card that would make you bust, then win the hand", 5,
    // TODO: need to check if player has a "soft" hand (11 pt ace) because that would prevent bust if the player just hits
    IsCompetitiveMode() && IsPlayingBlackjack() &&
    BlackjackPlayer_OnceSawNextCardWouldBust(17) &&  // once() clauses are internal to this function due to the complexity of the logic
    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
)

achievement("I Won't Stand For This", "[Competitive/Blackjack] Use See Deal Down (with a hand value of 12 or more) to reveal a higher-point dealer hand value, then win the hand",  5,
    IsCompetitiveMode() && IsPlayingBlackjack() && once(ActiveHandPointValue() >= 12 && BlackjackPlayer_SawDealerHandHigherThisFrame()) &&
    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
)

achievement("An Offer He Can't Refuse", "[Competitive/Blackjack] Use Swap Card to raise your opponent's hand value above 21 points", 3,
    // Order of events:
    // * Player's Swap Card Cheat Quantity decremented (then incremented if player cancels out of it)
    // * Swap animation plays
    // * Opponent's Hand Point Value updated
    IsCompetitiveMode() && IsPlayingBlackjack() && BlackjackOpponent_SwappedThisFrame(21)
//    once(BlackjackPlayer_UsedSwapCardCheatThisFrame()) && 
//    never(BlackjackPlayer_GainedSwapCardCheatThisFrame()) &&
//    never(BlackjackPlayer_StartedEitherHandThisFrame()) &&
)

achievement("Sus Hands Are Afoot", "[Competitive/Blackjack] Make your opponent bust with a \"very non-suspicious\" hand value of 35 points or more", 5,
    IsCompetitiveMode() && IsPlayingBlackjack() && BlackjackOpponent_BustedThisFrame(35)
)

achievement("Limited Time Offer", "[Competitive/Slots] Purchase a bonus item (Spin 3 or 7), place it (with D-pad then A), and win the line", 3,
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
)

achievement("Tri So Serious", "[Competitive/Video Poker] Have at least 3 Jokers in your hand", 3,
    IsCompetitiveMode() && IsPlayingVideoPoker() && PokerPlayer_Has3Jokers()
//              never(Increased(HandNumber())) && // have to reset tally() hits after each hand
//              never(Changed(CurrentCasinoGame())) && 
//              never(StartedCasinoGameThisFrame("Video Poker")) &&
//              PokerPlayer_HasInHand(3, "Joker") // counts number of Jokers in current hand using tally()
)

achievement("Hey, I Was Using That!", "[Competitive/Video Poker] Use Swap Card to swap back a card taken from you", 2,
    // TODO: check swap cards of both player and opponent - this is hard to implement!
    // and what if opponent uses Swap Hand or two Swap Cards? maybe need to "record" player's cards at start of hand/draw?
    IsCompetitiveMode() && IsPlayingVideoPoker() && once(VideoPokerOpponent_UsedSwapCardCheatThisFrame()) && VideoPokerPlayer_UsedSwapCardCheatThisFrame()
)

// ----------------------------------------------
// Optional (Scoring Event) Achievements
// ----------------------------------------------

achievement("Sounds Like Rain", "[Any Mode/Slots] Win all 3 lines on one spin", 5,
    IsPlayingSlots() && // SlotsPlayer_SpinEndedThisFrame() &&
    SlotsPlayer_WonAll3LinesThisFrame() &&
    // This check might be redundant if the payout bet multiplier is only set if the winning line is active
    SlotsPlayersBetMultiplier() == 3
    // Use Delta value because the bet multiplier is zeroed out on the frame that the "spin ends"
//    prev(SlotsPlayersBetMultiplier()) == 3 
)

achievement("Fruit Snacks", "[Any Mode/Slots] Win any line with 3 Cherry (10x payout) or 2 Orange (12x)", 2,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && // SlotsPlayer_SpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Cherry") || SlotsPlayer_WonAnyLineWith("2Orange")) 
)

achievement("Fruit Salad", "[Any Mode/Slots] Win any line with 3 Orange (15x payout), 3 Plum (20x), or 3 Melon (25x)", 4,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && // SlotsPlayer_SpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Orange") || SlotsPlayer_WonAnyLineWith("3Plum") || SlotsPlayer_WonAnyLineWith("3Melon"))
)

achievement("Triple Threat", "[Any Mode/Slots] Win any line with 3 Bell (50x payout), 3 Bar (100x), or 777 (200x)", 10,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && // SlotsPlayer_SpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Bell") || SlotsPlayer_WonAnyLineWith("3Bar") || SlotsPlayer_WonAnyLineWith("777"))
)

achievement("JACKPOT!", "[Any Mode/Slots] Win the jackpot with a 3rd-line 777", 25,
    IsPlayingSlots() && SlotsPlayer_WonJackpotThisFrame() // && SlotsPlayer_JackpotPayoutThisFrame() && // SlotsPlayer_SpinEndedThisFrame()
)

achievement("It's a Crowd", "[Competitive/Draw Poker] Win hand with 3 of a Kind (4x payout in Video Poker)", 3,
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() && PokerPlayer_WonWith("3OfKind")
)

achievement("Sit Up Straight & Don't Forget to Flush", "[Any Mode/Any Poker] Win hand with Straight (5x payout in Video Poker) or Flush (8x)", 4,
    IsPlayingPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("Straight") || PokerPlayer_WonWith("Flush"))
)

achievement("Now We're Talkin'", "[Any Mode/Any Poker] Win hand with Full House (20x payout in Video Poker) or 4 of a Kind (50x)", 5,
    IsPlayingPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("FullHouse") || PokerPlayer_WonWith("4OfKind"))
)

achievement("Flushing With Style", "[Any Mode/Any Poker] Win hand with Straight Flush (100x payout) or Royal Flush (250x)", 10,
    IsPlayingPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("StraightFlush") || PokerPlayer_WonWith("RoyalFlush"))
)

achievement("High Five!", "[Any Mode/Video Poker] Win the jackpot with 5 of a Kind (requires 5x bet multiplier)", 10,
    IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() && PokerPlayer_WonWith("5OfKind")
)

achievement("Putting It All Together", "[Practice/Craps] Win a line, multi-roll, and single-roll bet on the same roll (without any other bets on the table)", 5,
    IsPlayingCraps() && always_false() // TODO: implement this (disabled for now)
    // This is way too complex - generates over 1000 alt groups and slows RATools to a halt
// && unless(CrapsPlayer_LostAnyBetThisFrame()) && never(StartedCrapsRollThisFrame()) &&
//    CrapsPlayer_WonBetThisFrame("Any Line") && CrapsPlayer_WonBetThisFrame("Any Single") && CrapsPlayer_WonBetThisFrame("Any Multi")
)

// ----------------------------------------------
// Optional (Misc) Achievements
// ----------------------------------------------

achievement("Mob Money, Mob Problems", "[Competitive/Draw Poker] Defeat any gangster by making him run out of cash (during Draw Poker)", 5,
    // Note: If the gangster both runs out of cash AND draw poker credits at the same time, the game treats it as running out of cash, 
    // so it is unnecessary to also check the draw poker credits value.
    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame(FinalCasinoGameName) && OpponentsCash() == 0
)

achievement("Unmade Man", "[Competitive/Draw Poker] Defeat any gangster by making him run out of Draw Poker Credits", 5,
    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame(FinalCasinoGameName) && OpponentsCash() > 0
)

achievement("Bluff Enough?", "[Competitive/Draw Poker] Place or raise a bet that causes your opponent to fold while your hand rank is less than one pair", 10,
    // We could limit this to 2nd draw only (if a memory address can be found to detect 2nd draw), but I've never seen the AI fold on the 1st draw 
    // in response to the player's bet, so that might be pointless.
    IsCompetitiveMode() && PlayerWonHand_ThisFrame() &&
    once(PlayersHandRankingType() == Poker_HandRankingTypeDict["None"] && DrawPokerPlayer_PlacedBetThisFrame()) &&
//    once(Changed(PlayersLastActualBetAmount())) &&
    once(DrawPoker_OpponentFolded()) &&
    never(Increased(HandNumber()))
    // disable_when(PlayersHandRankingType() != Poker_HandRankingTypeDict["None"], <player placed bet/raised>)
)

achievement("Frugal Strats", "[Competitive/Slots] Win at slots without buying any cheats/bonus items nor placing any bets over $10 (3x multiplier allowed)", 3,
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
)

// ----------------------------------------------
// Collection Achievements
// ----------------------------------------------

achievement("Depression-Era Millionaire", "[Competitive/Any Mission] Accumulate at least $1 million total end-of-mission winnings (excludes password winnings)", 10,
    IsCompetitiveMode() && TotalMissionWinnings() > 1000000
//    (TotalMissionWinnings() + PlayersCurrentMissionCashTotal())
)

achievement("High Stakes High Roller", "[Competitive/Any Mission] Accumulate at least $1.5 million total end-of-mission winnings (excludes password winnings)", 25,
    IsCompetitiveMode() && TotalMissionWinnings() > 1500000
)

// ----------------------------------------------
// Challenge Achievements
// ----------------------------------------------

achievement("Forever 21", "[Competitive/Blackjack] Score at least five blackjacks in one game vs. any gangster", 10,
    IsCompetitiveMode() && IsPlayingBlackjack() && never(StartedMissionThisFrame()) &&
    // Used tally() instead of repeated() to avoid "combined || and && logic too complex for subclause" compile error
    tally(5, BlackjackPlayer_WonMainHandWithBlackjackThisFrame(), BlackjackPlayer_WonSplitHandWithBlackjackThisFrame())
)

achievement("What Big Hands You Have", "[Competitive/Blackjack] Have 8 cards in your Blackjack hand (bust allowed on last card)", 10,
    IsCompetitiveMode() && IsPlayingBlackjack() && (PlayersHandCardCount() >= 8 || PlayersSplitHandCardCount() >= 8)
)

//achievement("I Ain't Got All Day", "[Competitive/Blackjack] Save time by having your opponent run out of cash before Hand 10", 10,
//    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame("Blackjack") && HandNumber() <= 9 &&
//    OpponentsCash() == 0 // this check is likely redundant because cash-out is the only way for the opponent to lose early
//)

achievement("Knew When to Hold 'Em", "[Competitive/Draw Poker] When your opponent raises your bet, keep playing the hand and win it", 5,
    // TODO: Handle case where opponent makes bet, player calls or player bets/opponent calls, 2nd deal, then opponent makes bet (never raised)
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() && never(Increased(HandNumber())) &&
//    once(DrawPokerPlayer_PlacedBetThisFrame()) &&
    once(DrawPokerOpponent_RaisedBetThisFrame())
)

achievement("Rosetti No Spaghetti", "[Competitive/Draw Poker] Defeat any gangster in draw poker without losing a single hand", 10,
    // TODO (maybe): change to Blackjack and exclude dealer BJ?
    IsCompetitiveMode() &&  PlayerWonCasinoGameThisFrame("Draw Poker") && disable_when(DrawPokerPlayer_LostHandThisFrame(), StartedMissionThisFrame())
)

achievement("Honest Pete", "[Competitive/Mission 1] Complete Mission 1 without buying any cheats from Shady", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 1 && once(StartedMissionThisFrame()) && never(PlayerPurchasedCheat(false)) && trigger_when(WonMissionThisFrame())
// This alternative logic should have the same end result in terms of achievement functionality as once/never, but it uses an (uneeded) PauseLock
//     disable_when(PlayerPurchasedCheat(false), StartedMissionThisFrame())
)

achievement("Cheatin' Pete", "[Competitive/Mission 2] Complete Mission 2 while buying out every cheat from Shady (twice per casino game, from 0 to max qty)", 10,
    // We need to reset the count at the start of the mission (rather than just start the count, as done for "Honest Pete")
    IsCompetitiveMode() && never(StartedMissionThisFrame()) && WonMissionThisFrame() &&
    // Note: cannot use MeasuredIf to check if at Shady because the cheat qty can increase if player cancels out of a cheat (such as Swap Card) during gameplay,
    // and we don't want to count that. (MeasuredIf would only limit when the count is displayed.)
    measured(repeated(MaxCheatsPerMission, DisplayedMissionNumber() == 2 && IsAtScreen("Shady") && PlayerPurchasedCheatThisFrame()))
)

achievement("I Ain't Got All Day", "[Competitive/Mission 3] Complete Mission 3 in 6 hands or less of Draw Poker", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 3 && IsPlayingDrawPoker() && HandNumber() <= 6 && trigger_when(WonMissionThisFrame())
)

achievement("Name TBD", "[Competitive/Mission 4] Complete Mission 4 with at least 350K in cash winnings", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 4 && Increased(Winnings(4)) && Winnings(4) >= 350000 && measured(PlayersCurrentMissionCashTotal() >= 350000)
)

achievement("Al Cologne Now Sleeps With The Fishes", "[Competitive/All Missions] Defeat Al Cologne in all four casino games (in a single playthrough)", 25,
    // TODO (maybe): rewrite as the reverse check (invalidate when a casino game lost, otherwise awarded at game end) so a trigger flag can be added?
    WonCompetitiveModeThisFrame() && PlayerWonAllCasinoGamesThisFrame()
)

//achievement("The Ultimate Stakes", "[Competitive/All Missions] Defeat all five gangsters without losing any casino games (nor using a password)", 50,  
//    // Count missions with all casino games won up to 5, reset at the start of competitive mode
//    WonCompetitiveModeThisFrame() && repeated(5, PlayerWonAllCasinoGamesThisFrame()) && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
//)

achievement("Craptastic", "[Practice/Craps] Have exactly 9 bets on the table and win them all on the same roll", 10,
    IsPlayingCraps() && always_false() // TODO: implement this (disabled for now)
)

achievement("Baby Needs New Shoes!", "[Practice/Craps] Starting with $10,000, double your money", 10,
    IsPlayingCraps() && once(PlayersCashBCD() == 0x10000) && PlayersCashBCD() >= 0x20000 && never(!IsPlayingCraps())
)

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
    "Mission {0}: {1} | Winnings: ${2} | Playing: {3} | 💰: ${4}", RP_MissionNumber, RP_Gangster, RP_Winnings, RP_CasinoGame, RP_Cash)

// Display if playing Competitive Mode - Slots
rich_presence_conditional_display(IsCompetitiveMode() && IsPlayingSlots(),
    "Mission {0}: {1} | Winnings: ${2} | Playing: {3} | 💰: ${4}", RP_MissionNumber, RP_Gangster, RP_Winnings, RP_CasinoGame, RP_CashBCD)

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
function LB_Cash(mission, is_total) {
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
    leaderboard(title, desc, trigger, always_false(), always_true(), winnings)
}

LB_Cash(1, false)
LB_Cash(2, false)
LB_Cash(3, false)
LB_Cash(4, false)
LB_Cash(5, false)
LB_Cash(5, true)
