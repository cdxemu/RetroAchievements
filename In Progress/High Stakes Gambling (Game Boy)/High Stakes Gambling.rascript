// High Stakes Gambling
// #ID = 4210

// ************************************************************************************************
//                                   Memory Addresses/Values
// ************************************************************************************************

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
//        60 = slot machine row 1
//        70 = slot machine row 2
//        77 = not visible (at Shady)
//        80 = slot machine row 3
//        90 = below slot machine (purchased)
function BonusItemYPosition() => byte(0x00C280)
BonusItemYPositionDict = {"NotVisible": 0x00, "Row1": 0x60, "Row2": 0x70, "Row3": 0x80} 

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

// $C2B2: [8-bit] Game Flow Control
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
function GameFlowControl() => byte(0x00C2B2)
GameFlowControlDict = {"MissionScore": 0x01, "GangsterPortrait": 0x02, "ModeOrPlayPasswordSelect": 0x05, "TitleScreen": 0x09,
    "ScoreCard": 0x0B, "CopyrightScreen": 0x20
}

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
//        Bit4 = unused
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
//function PlayersActualPayout() => dword(0x00CC2B)

// $CC2F: [32-bit] Player's Last Actual Bet Amount
//        (Blackjack/Draw Poker)
function PlayersLastActualBetAmount() => dword(0x00CC2F)

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

// $D444: [8-bit] Player's Bet Multiplier
//        (Slots - range: 1-3, or 0 when no bet)
function SlotsPlayersBetMultiplier() => byte(0x00D444)

// $D446: [8-bit] Spin Number
//        (Slots - 0-based value)
function SpinNumber() => byte(0x00D446)

// $D459: [16-bit] Player's Payout Line 1 Bet Multiplier
// $D45B: [16-bit] Player's Payout Line 2 Bet Multiplier
// $D45D: [16-bit] Player's Payout Line 3 Bet Multiplier
//        (Slots - not set until end of spin)
//
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
function PlayersPayoutLine1BetMultiplier() => word(0x00D459)
function PlayersPayoutLine2BetMultiplier() => word(0x00D45B)
function PlayersPayoutLine3BetMultiplier() => word(0x00D45D)
SlotsPayoutMultiplierDict = {"1Cherry": 2, "2Cherry": 5, "3Cherry": 10, "2Orange": 12, "3Orange": 15, "3Plum": 20, "3Melon": 25, "3Bell": 50, "3Bar": 100, "777": 200}

// $D490: [8-bit] Player's Cheat Coin 1 Quantity
//        (Slots - Sevens AKA Gold Coin; initial value 4; set after exiting Shady; decremented when spin starts if cheat used)
function PlayersCheatCoin1Quantity() => byte(0x00D490)

// $D491: [8-bit] Player's Cheat Coin 2 Quantity
//        (Slots - Bars AKA Silver Coin; initial value 0; set after exiting Shady; decremented when spin starts if cheat used)
function PlayersCheatCoin2Quantity() => byte(0x00D491)

// $D646: [8-bit] Practice - Spin Counter
//        (Practice Mode Slots - value starts at 1 and increments each spin, otherwise initial value is 0x20 and last value persists)
function PracticeSpinCounter() => byte(0x00D646)

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
function PlayersCashBcd() => dword_be(0x00FFD1)

// $FFDB: [16-bit BE] Current Bet/Payout Amount (BCD)
//        (Slots)
function CurrentBetPayoutAmountBcd() => word_be(0x00FFDB)

// ************************************************************************************************
//                                   Helper Functions (General)
// ************************************************************************************************

FinalCasinoGameName = "Draw Poker"

function DisplayedMissionNumber() => CurrentMission() + 1

function IsPlayingBlackjack() => CurrentCasinoGame() == CurrentCasinoGameDict["Blackjack"]
function IsPlayingSlots() => CurrentCasinoGame() == CurrentCasinoGameDict["Slots"]
function IsPlayingVideoPoker() => CurrentCasinoGame() == CurrentCasinoGameDict["VideoPoker"]
function IsPlayingDrawPoker() => CurrentCasinoGame() == CurrentCasinoGameDict["DrawPoker"]
function IsPlayingCraps() => CurrentCasinoGame() == CurrentCasinoGameDict["Craps"]
function IsPlayingPoker() => __ornext(IsPlayingDrawPoker() || IsPlayingVideoPoker())

function IsPlayingInPracticeMode() => CasinoGameMode() == CasinoGameModeDict["Practice"]
function IsCompetitiveModeActive() => CompetitiveProgressIndicator() == CompetitiveProgressIndicatorDict["Started"]

// Note: This does NOT trigger when the final hand (Hand 10 in Competitive Mode) ends. Hoewver, it is sufficient for use
// as a trigger to reset an achievement on each "new hand", assuming there is no need to reset it after the final hand.
function HandNumberIncreasedThisFrame() => HandNumber() > prev(HandNumber())

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
        return PlayerWonBlackjackFlag() > prev(PlayerWonBlackjackFlag())
    else if (casino_game_name == "Slots")
       return PlayerWonSlotsFlag() > prev(PlayerWonSlotsFlag())
    else if (casino_game_name == "Video Poker")
        return PlayerWonVideoPokerFlag() > prev(PlayerWonVideoPokerFlag())
    else if (casino_game_name == "Draw Poker")
        return PlayerWonDrawPokerFlag() > prev(PlayerWonDrawPokerFlag())
}

function PlayerWonAllCasinoGamesThisFrame() {
    return PlayerWonBlackjackFlag() == 1 &&
           PlayerWonSlotsFlag() == 1 &&
           PlayerWonVideoPokerFlag() == 1 &&
           PlayerWonDrawPokerFlag() > prev(PlayerWonDrawPokerFlag())
}

function PlayerWonHand_ThisFrame() => PlayersCash() > prev(PlayersCash())
//    PlayersActualPayout() > prev(PlayersActualPayout())

function IsAtScreen(screen) => GameFlowControl() == GameFlowControlDict[screen]
function IsAtMenu(menu) => MenuType() == MenuTypeDict[menu]

function ScreenChangedThisFrame() => GameFlowControl() != prev(GameFlowControl())

function CasinoGameChangedThisFrame() => CurrentCasinoGame() != prev(CurrentCasinoGame())

function StartedCasinoGameThisFrame(casino_game_name) {
    if (casino_game_name == "Blackjack")
        return CasinoGameChangedThisFrame() && IsPlayingBlackjack()
    else if (casino_game_name == "Slots")
      return CasinoGameChangedThisFrame() && IsPlayingSlots()
    else if (casino_game_name == "Video Poker")
       return CasinoGameChangedThisFrame() && IsPlayingVideoPoker()
    else if (casino_game_name == "Draw Poker")
        return CasinoGameChangedThisFrame() && IsPlayingDrawPoker()
    else if (casino_game_name == "Craps")
        return CasinoGameChangedThisFrame() && IsPlayingCraps()        
}

function StartedMissionThisFrame() {
    // The Gangster Portrait screen seems to be the most consistent and easily identifiable way to determine a mission has started
    return IsAtScreen("GangsterPortrait") &&
           ScreenChangedThisFrame()
}

function StartedCompetitiveModeThisFrame() {
   return IsCompetitiveModeActive() &&
          prev(CompetitiveProgressIndicator()) != CompetitiveProgressIndicatorDict["Started"]
}

function StartedCompetitiveModeNewGameThisFrame() {
   return StartedCompetitiveModeThisFrame() &&
          DisplayedMissionNumber() == 1
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

//function WasNotAtScreenLastFrame(screen) => prev(GameFlowControl()) != GameFlowControlDict[screen]
//
//function CasinoGameEnded(casino_game_name) {
//    FinalCasinoGameName = "Draw Poker"
//    if (casino_game_name == FinalCasinoGameName)
//        // Beating the final casino game of the mission will show the mission score screen
//        return IsAtScreen("MissionScore") &&
//               // Only check at start to avoid false triggering because mission number will change partway through
//               WasNotAtScreenLastFrame("MissionScore")
//     else
//        // Beating a preliminary casino game will show the score card screen
//        return IsAtScreen("ScoreCard")
//}

function UsedCompetitiveModePassword() {

    // Password protection: can check if have any password-loaded cash winnings, since any real password will have some
    // alternatively, we might be able to check if previously at password entry screen before game started, but I think it is difficult because
    // that screen shares the same "Game Flow Control" value as the password display screen at the end of a mission
    // TODO (maybe): do we need to also protect against potential fake passwords with no cash winnings?
    return PlayersPasswordCashWinnings() > 0

    // Older version - not a reliable way to check (see code note for more info)
//    return WasCompetitiveModePasswordUsed() == WasCompetitiveModePasswordUsedDict["NotUsed"]    
}

function TotalMissionWinnings() {
    return PlayersMission1CashWinnings() + PlayersMission2CashWinnings() + PlayersMission3CashWinnings() + PlayersMission4CashWinnings() +  PlayersMission5CashWinnings()
}

//function TotalCheatCardQuantity() {
//    return PlayersCheatCard1Quantity() + PlayersCheatCard2Quantity() + PlayersCheatCard3Quantity() + PlayersCheatCard4Quantity() + PlayersCheatCard5Quantity() +
//           PlayersCheatCard6Quantity()
//           // + PlayersCheatCoin1QuantityAtShady() + PlayersCheatCoin2QuantityAtShady()
//}

function SlotsPlayer_PurchasedCheat() {
    // See comment in PlayerPurchasedCheat() as to why we check equal to 1
    return PlayersCheatCoin1Quantity() == 1 || PlayersCheatCoin2Quantity() == 1
//    // For whatever reason, Cheat Coin 1 quantity is initialized to 4 instead of 0 so we can't just check if greater than 0
//    return __ornext(PlayersCheatCoin1Quantity() == 1 || PlayersCheatCoin1Quantity() == 2 || PlayersCheatCoin2Quantity() > 0)
}

function PlayerPurchasedCheat(slots_only) {
    // We check if these are equal to 1 rather than >= because:
    // * Cheats must be purchased one at a time, so it should always hit quantity 1 first.
    // * These address values aren't zeroed out at various times (even though the player hasn't purchased any cheats). Specifically, they all have value 0xff
    // when the game is initialized, and Cheat Coin 1 Quantity is reset to 0x04 on new game (until Slots starts) for some reason.
    CheatCardPurchased = PlayersCheatCard1Quantity() == 1 || PlayersCheatCard2Quantity() == 1 || PlayersCheatCard3Quantity() == 1 ||
                         PlayersCheatCard4Quantity() == 1 || PlayersCheatCard5Quantity() == 1 || PlayersCheatCard6Quantity() == 1
    CheatCoinPurchased = PlayersCheatCoin1Quantity() == 1 || PlayersCheatCoin2Quantity() == 1
    
    if (slots_only == true)
        return CheatCoinPurchased
    else
        return CheatCardPurchased || CheatCoinPurchased
//    return TotalCheatCardQuantity() > 0 || SlotsPlayer_PurchasedCheat()
}

function PlayerPurchasedCheatThisFrame() {
    return PlayersCheatCard1Quantity() > prev(PlayersCheatCard1Quantity()) || PlayersCheatCard2Quantity() > prev(PlayersCheatCard2Quantity()) ||
           PlayersCheatCard3Quantity() > prev(PlayersCheatCard3Quantity()) || PlayersCheatCard4Quantity() > prev(PlayersCheatCard4Quantity()) ||
           PlayersCheatCard5Quantity() > prev(PlayersCheatCard5Quantity()) || PlayersCheatCard6Quantity() > prev(PlayersCheatCard6Quantity()) ||
           PlayersCheatCoin1Quantity() > prev(PlayersCheatCoin1Quantity()) || PlayersCheatCoin2Quantity() > prev(PlayersCheatCoin2Quantity())
           // Seems better not to use Cheat Coin Quantity at Shady because the coin 2 quantity is set to 1 upon exiting Shady
//           PlayersCheatCoin1QuantityAtShady() > prev(PlayersCheatCoin1QuantityAtShady()) || PlayersCheatCoin2QuantityAtShady() > prev(PlayersCheatCoin2QuantityAtShady())
}


// ************************************************************************************************
//                             Helper Functions (Casino Game-Specific)
// ************************************************************************************************

function BlackjackPlayer_MainHandResultChangedThisFrame() => PlayersHandResult() != prev(PlayersHandResult())
function BlackjackPlayer_SplitHandResultChangedThisFrame() => PlayersSplitHandResult() != prev(PlayersSplitHandResult())

function BlackjackPlayer_WonMainHand() => PlayersHandResult_IsActiveFlag() == 1 && PlayersHandResult_IsWonFlag() == 1
function BlackjackPlayer_WonSplitHand() => PlayersSplitHandResult_IsActiveFlag() == 1 && PlayersSplitHandResult_IsWonFlag() == 1

function BlackjackPlayer_WonEitherHandThisFrame() {
    return (BlackjackPlayer_MainHandResultChangedThisFrame() && BlackjackPlayer_WonMainHand()) ||
           (BlackjackPlayer_SplitHandResultChangedThisFrame() && BlackjackPlayer_WonSplitHand())
}

function BlackjackPlayer_WonMainHandWithBlackjack() {
    return PlayersHandResult_IsActiveFlag() == 1 && PlayersHandResult_IsWonFlag() == 1 && PlayersHandResult_IsSpecialFlag() == 1
}

function BlackjackPlayer_WonSplitHandWithBlackjack() {
    return PlayersSplitHandResult_IsActiveFlag() == 1 && PlayersSplitHandResult_IsWonFlag() == 1 && PlayersSplitHandResult_IsSpecialFlag() == 1
}

function BlackjackPlayer_WonMainHandWithBlackjackThisFrame() => BlackjackPlayer_MainHandResultChangedThisFrame() && BlackjackPlayer_WonMainHandWithBlackjack()
function BlackjackPlayer_WonSplitHandWithBlackjackThisFrame() => BlackjackPlayer_SplitHandResultChangedThisFrame() && BlackjackPlayer_WonSplitHandWithBlackjack()
function BlackjackPlayer_WonEitherWithBlackjackThisFrame() => BlackjackPlayer_WonMainHandWithBlackjackThisFrame() ||  BlackjackPlayer_WonSplitHandWithBlackjackThisFrame()

function BlackjackPlayer_WonBothSplitHandsThisFrame() {
    return PlayersHandResult_IsSplitFlag() == 1  && BlackjackPlayer_SplitHandResultChangedThisFrame() && 
           BlackjackPlayer_WonMainHand()  && BlackjackPlayer_WonSplitHand()
}

function BlackjackPlayer_DoubledDownAndWonThisFrame() {
    // Note: the game does not let you double down after a split, so we don't need to check the split hand
    return PlayersHandResult_IsDoubleFlag() == 1 && BlackjackPlayer_MainHandResultChangedThisFrame() && BlackjackPlayer_WonMainHand()
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

//function BlackjackPlayer_StartedNewHandThisFrame() => HandNumber() > prev(HandNumber())

function BlackjackPlayer_StartedMainHandThisFrame() => PlayersHandCardCount() == 2 && prev(PlayersHandCardCount()) == 1
function BlackjackPlayer_StartedSplitHandThisFrame() => PlayersSplitHandCardCount() == 2 && prev(PlayersSplitHandCardCount()) == 1
function BlackjackPlayer_StartedEitherHandThisFrame() => __ornext(BlackjackPlayer_StartedMainHandThisFrame() || BlackjackPlayer_StartedSplitHandThisFrame())

function BlackjackOpponent_BustedMainHand() {
    return PlayersHandResult_IsActive() == 1 && PlayersHandResult_IsWon() == 1 && PlayersHandResult_IsSpecial() == 1
}

function BlackjackOpponent_WonSplitHandWithBlackjack() {
    return PlayersSplitHandResult_IsActive() == 1 && PlayersSplitHandResult_IsWon() == 1 && PlayersSplitHandResult_IsSpecial() == 1
}

// As far as I can tell, the AI opponent *never* splits, so it is sufficient to check their singular hand. Not to mention the difficulty of
// finding the memory addresses for the "opponent's split hand" if it exists but is never used by the game. With that said, if the AI is ever
// seen to split, then those addresses must be added and checked, similar to how it is currently done for the player.
function BlackjackOpponent_HandResultChangedThisFrame() => OpponentsHandResult() != prev(OpponentsHandResult())
function BlackjackOpponent_Busted() => OpponentsHandResult_IsWonOrTiedFlag() == 0 && OpponentsHandResult_IsSpecialFlag() == 1
function BlackjackOpponent_BustedThisFrame() => BlackjackOpponent_HandResultChangedThisFrame() && BlackjackOpponent_Busted()

function BlackjackPlayer_UsedSwapCardCheatThisFrame()    => PlayersCheatCard2Quantity() < prev(PlayersCheatCard2Quantity())
function BlackjackPlayer_GainedSwapCardCheatThisFrame()  => PlayersCheatCard2Quantity() > prev(PlayersCheatCard2Quantity())
function BlackjackPlayer_UsedSeeNextCardCheatThisFrame() => PlayersCheatCard5Quantity() < prev(PlayersCheatCard5Quantity())
function BlackjackPlayer_UsedSeeDealDownCheatThisFrame() => PlayersCheatCard6Quantity() < prev(PlayersCheatCard6Quantity())

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

function SlotsPlayer_PracticeSpinEndedThisFrame() {
    return PracticeSpinCounter() > prev(PracticeSpinCounter()) &&
           // Don't count it as "spin ending" when the spin counter is being initialized from 0 to 1 before the first spin
           prev(PracticeSpinCounter()) > 0
}

function SlotsPlayer_CompetitiveSpinEndedThisFrame() {
    return (SpinNumber() > prev(SpinNumber()))
        // TODO: need to find a way to also trigger on Spin 10 ending - maybe check for vals changing on same frame as flag below
        //PlayerWonCasinoGameThisFrame(casino_game_name)
}

function SlotsPlayer_SpinEndedThisFrame() {
    // TODO: check whether this function is unneeded
    return SlotsPlayer_PracticeSpinEndedThisFrame() || SlotsPlayer_CompetitiveSpinEndedThisFrame()
}

function SlotsPlayer_WonLine(line_num) {
    if (line_num == 1)
        return PlayersPayoutLine1BetMultiplier() > 0
    else if (line_num == 2)
        return PlayersPayoutLine2BetMultiplier() > 0
    else if (line_num == 3)
        return PlayersPayoutLine2BetMultiplier() > 0
}

function SlotsPlayer_WonAtLeast2Lines() {
    return (PlayersPayoutLine1BetMultiplier() > 0 && PlayersPayoutLine2BetMultiplier() > 0) ||
           (PlayersPayoutLine1BetMultiplier() > 0 && PlayersPayoutLine3BetMultiplier() > 0) ||
           (PlayersPayoutLine2BetMultiplier() > 0 && PlayersPayoutLine3BetMultiplier() > 0)
}

function SlotsPlayer_WonWith(payout_type) {
    mult = SlotsPayoutMultiplierDict[payout_type]

    return __ornext(PlayersPayoutLine1BetMultiplier() == mult || PlayersPayoutLine2BetMultiplier() == mult || PlayersPayoutLine3BetMultiplier() == mult)
}

function SlotsPlayer_WonJackpot() => SlotsPlayerWonJackpotFlag() == 1

function SlotsPlayer_PlacedBonusItemThisFrame(line_num) {
    if (line_num == 1)
        bonus_row = "Row1"
    else if (line_num == 2)
        bonus_row = "Row2"
    else if (line_num == 3)
        bonus_row = "Row3"

    BonusItem_WasPlaced_PlayerSlotMachine_Col = __ornext(
        prev(BonusItemXPosition()) == BonusItemXPositionDict["PlayerCol1"] ||
        prev(BonusItemXPosition()) == BonusItemXPositionDict["PlayerCol2"] ||
        prev(BonusItemXPosition()) == BonusItemXPositionDict["PlayerCol3"])

    BonusItem_WasPlaced_SlotMachine_Row = prev(BonusItemYPosition()) == BonusItemYPositionDict[bonus_row]

//    BonusItem_WasPlaced_SlotMachine_Row = __ornext(
//        prev(BonusItemYPosition()) == BonusItemYPositionDict["Row1"] ||
//        prev(BonusItemYPosition()) == BonusItemYPositionDict["Row2"] ||
//        prev(BonusItemYPosition()) == BonusItemYPositionDict["Row3"])
        
    BonusItem_Is_Gone = BonusItemXPosition() == BonusItemXPositionDict["NotVisible"] &&
                        BonusItemYPosition() == BonusItemYPositionDict["NotVisible"]

    return BonusItem_WasPlaced_PlayerSlotMachine_Col && BonusItem_WasPlaced_SlotMachine_Row && BonusItem_Is_Gone
}

function SlotsPlayer_WonThisFrameWithBonusItem(line_num) {
    // TODO: may need to adjust frame timing depending on the order these events occur
    return SlotsPlayer_PlacedBonusItemThisFrame(line_num) && SlotsPlayer_WonLine(line_num)
}

function VideoPokerPlayer_HandScoringIncreasedThisFrame() {
    // New hand must have higher "type" than old hand AND be "Pair of Jacks" or better
    return PlayersHandRankingType() > prev(PlayersHandRankingType()) &&
        PlayersHandRanking() >= Poker_HandRankingDict["PairOfJacks"]

//       // In most cases, just need to check for higher hand type
//        (PlayersHandRankingType() > prev(PlayersHandRankingType())) ||
//      // Unless both before & after have a pair, in which case "Jacks or better" scores higher than a lower pair
//        (PlayersHandRankingType() == prev(PlayersHandRankingType()) && PlayersHandRankingType() == Poker_HandRankingTypeDict["OnePair"] &&
//         PlayersHandRankingCardRank() >= CardRankDict["Jack"] && prev(PlayersHandRankingCardRank()) < CardRankDict["Jack"]
//        )
}

function VideoPokerPlayer_UsedSwapCardCheatThisFrame()   => PlayersCheatCard2Quantity() < prev(PlayersCheatCard2Quantity())
function VideoPokerOpponent_UsedSwapCardCheatThisFrame() => OpponentsCheatCard2Quantity() < prev(OpponentsCheatCard2Quantity())

function DrawPoker_OpponentFolded() {
    return OpponentsHandResult() == DrawPoker_HandResultDict["Fold"]
}

function DrawPokerPlayer_LostHandThisFrame() {
    // Note: this function will not trigger upon losing final hand because hand number will not increase (but that is acceptable
    // for the only achievement where it is currently used, because it is not possible to both lose the final hand and win the game)
    return HandNumberIncreasedThisFrame() &&
    // Alternatively, we might be able to check player's payout == 0
           PlayersHandRanking() < OpponentsHandRanking() &&
           !DrawPoker_OpponentFolded()
}

function DrawPokerOpponent_RaisedBet() {
    // TODO: RAM digging/implement this
    return always_false()
}

function PokerPlayer_WonWith(hand_type) {
    return PlayersHandRankingType() == Poker_HandRankingTypeDict[hand_type]
}

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
//    return __ornext(PlayersHandCard1() != prev(PlayersHandCard1()) ||
//           PlayersHandCard2() != prev(PlayersHandCard2()) ||
//           PlayersHandCard3() != prev(PlayersHandCard3()) ||
//           PlayersHandCard4() != prev(PlayersHandCard4()) ||
//          PlayersHandCard5() != prev(PlayersHandCard5()) )
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
// Introductory (Practice Mode) Achievements
// ----------------------------------------------

achievement("Blackjack Basics - Name of the Game", "[Practice/Blackjack] Score a Blackjack (two-card 21 - increases payout by half)", 1,
    IsPlayingInPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_WonEitherWithBlackjackThisFrame()
)

achievement("Blackjack Basics - Double Trouble", "[Practice/Blackjack] Double down and win the hand (bet doubled, dealt exactly one more card)", 1,
    IsPlayingInPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_DoubledDownAndWonThisFrame()
)

achievement("Blackjack Basics - Psychic Training", "[Practice/Blackjack] Buy or refuse insurance and have it pay off (dealer has face-up ace - costs half your bet, refunds original bet if dealer has B.J.)", 2,
    IsPlayingInPracticeMode() && IsPlayingBlackjack() &&
    ((BlackjackPlayer_BoughtInsurance() && DealersHandPointValue() == 21) || (BlackjackPlayer_DeclinedInsurance() && DealersHandPointValue() != 21))
)

achievement("Blackjack Basics - Make Like a Banana and...", "[Practice/Blackjack] Split and win both hands (two same-value cards - play them as separate hands, each with original bet)", 2,
    IsPlayingInPracticeMode() && IsPlayingBlackjack() && BlackjackPlayer_WonBothSplitHandsThisFrame()
)

achievement("Slots Basics - Cherry Picking", "[Practice/Slots] Win any line with 1 Cherry (2x payout) or 2 Cherry (5x)", 1,
    IsPlayingInPracticeMode() && IsPlayingSlots() && SlotsPlayer_PracticeSpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonWith("1Cherry") || SlotsPlayer_WonWith("2Cherry")) 
)

achievement("Slots Basics - One-Armed Banditry", "[Practice/Slots] Bet on all three lines and win at least two of them on the same spin", 1,
    IsPlayingInPracticeMode() && IsPlayingSlots() &&
    // Use Delta value because the bet multiplier is zeroed out on the frame that the "spin ends"
    prev(SlotsPlayersBetMultiplier()) == 3 && SlotsPlayer_PracticeSpinEndedThisFrame() && SlotsPlayer_WonAtLeast2Lines()
)

achievement("Video Poker Basics - Can You Hold, Please?", "[Practice/Video Poker] Press the (H)old button underneath at least one card and have a higher-scoring hand on the second draw", 1,
    // Note: This does not track whether the hold button remained pressed, only that it was pressed at some point. Doing the former would be difficult 
    // because the 2nd draw resets the "Card X Held" value to the same value (0x03) as if the hold were deselected by the player, and there doesn't seem
    // to be a good way to detect when the Draw button was pressed, either.
    IsPlayingInPracticeMode() && IsPlayingVideoPoker() && once(PokerPlayer_IsAnyCardHeld()) && never(HandNumberIncreasedThisFrame()) &&
    VideoPokerPlayer_HandScoringIncreasedThisFrame()
//    once(PokerPlayer_AtLeastTwoCardsWereHeld())
//    disable_when(PlayersHandCardCount() == 0, HandNumberIncreasedThisFrame())
//    never(HandNumberIncreasedThisFrame()) && unless(PlayersHandCardCount() == 0)
//    once(PokerPlayer_DealtNewCards())
//    PokerPlayer_AtLeastOneCardValueChanged())  // this is redundant because we checked that hand scoring increased - no?
)

achievement("Video Poker Basics - Paired Up", "[Practice/Video Poker] Win hand with one pair of \"Jacks or better\" (1x payout) or two pair (2x)", 1,
    IsPlayingInPracticeMode() && IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("OnePair") || PokerPlayer_WonWith("TwoPair"))
)


// ----------------------------------------------
// Progression Achievements
// ----------------------------------------------

// Adds an achievement for winning the specified mission/casino game with the given title and points
function AddAchievement_WinStage(mission, casino_game_num, ach_title, ach_points)
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
AddAchievement_WinStage(1, 1, "Machine Gun Max, Meet Bulletproof Bob", 3)
AddAchievement_WinStage(1, 2, "Just Call It Beginner's Luck", 3)
AddAchievement_WinStage(1, 3, "Loserus Maximus", 3)
AddAchievement_WinStage(1, 4, "Max Maxed Out", 3)
// Mission 2 - Suitcase Sam
AddAchievement_WinStage(2, 1, "Suitcase Shakedown", 4)
AddAchievement_WinStage(2, 2, "I Do Not Lose Them, Sam-I-Am", 4)
AddAchievement_WinStage(2, 3, "Sam Clubbed", 4)
AddAchievement_WinStage(2, 4, "Unpacked Suitcase Sam", 4)
// Mission 3 - Hitman Harry
AddAchievement_WinStage(3, 1, "Harry's Not So Scary", 5)
AddAchievement_WinStage(3, 2, "You're No Wizard, Harry", 5)
AddAchievement_WinStage(3, 3, "Blood Money Transfusion", 5)
AddAchievement_WinStage(3, 4, "Whacked the Hitman", 5)
// Mission 4 - Lucky Louis
AddAchievement_WinStage(4, 1, "Loius the Not-So-Great", 10)
AddAchievement_WinStage(4, 2, "More Like Unlucky Louis, Amirite?", 5)
AddAchievement_WinStage(4, 3, "You're Out of Luck, I'm Out of Time", 10)
AddAchievement_WinStage(4, 4, "Louie, Louie, You Gotta Go", 10)
// Mission 5 - Al Cologne
AddAchievement_WinStage(5, 1, "Cologne Bolonga", 10)
AddAchievement_WinStage(5, 2, "Say Hello to My Little Spend", 5)
AddAchievement_WinStage(5, 3, "Nice Try, Wiseguy", 10)
AddAchievement_WinStage(5, 4, "Ding, Don Done", 10)

achievement("Brought Down the Mob", "[Competitive/All Missions] Defeat all five gangsters without using a password", 25,
    WonCompetitiveModeThisFrame() && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
)


// ----------------------------------------------
// Optional (Item Usage) Achievements
// ----------------------------------------------

achievement("Bustin' Don't Make Me Feel Good", "[Competitive/Blackjack] Use See Next Card (with a hand value of 17 or less) to reveal a card that would make you bust, then win the hand", 5,
    // TODO: need to check if player has a "soft" hand (11 pt ace) because that would prevent bust if the player just hits
    IsCompetitiveModeActive() && IsPlayingBlackjack() &&
    BlackjackPlayer_OnceSawNextCardWouldBust(17) &&  // once() clauses are internal to this function due to the complexity of the logic
    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
)

achievement("I Won't Stand For This", "[Competitive/Blackjack] Use See Deal Down (with a hand value of 12 or more) to reveal a higher-point dealer hand value, then win the hand",  5,
    IsCompetitiveModeActive() && IsPlayingBlackjack() && once(ActiveHandPointValue() >= 12 && BlackjackPlayer_SawDealerHandHigherThisFrame()) &&
    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
)

achievement("An Offer He Can't Refuse", "[Competitive/Blackjack] Use Swap Card to raise your opponent's hand value above 21 points", 3,
    // Order of events:
    // * Player's Swap Card Cheat Quantity decremented (then incremented if player cancels out of it)
    // * Swap animation plays
    // * Opponent's Hand Point Value updated
    IsCompetitiveModeActive() && IsPlayingBlackjack() &&
//    once(BlackjackPlayer_UsedSwapCardCheatThisFrame()) && 
//    never(BlackjackPlayer_GainedSwapCardCheatThisFrame()) &&
//    never(BlackjackPlayer_StartedEitherHandThisFrame()) &&
    OpponentsHandPointValue() > 21 && prev(OpponentsHandPointValue()) <= 21 && OpponentsHandCardCount() == prev(OpponentsHandCardCount())
)

achievement("Sus Hands Are Afoot", "[Competitive/Blackjack] Make your opponent bust with a \"very non-suspicious\" hand value of 35 points or more", 5,
    IsCompetitiveModeActive() && IsPlayingBlackjack() && BlackjackOpponent_BustedThisFrame() && OpponentsHandPointValue() >= 35
)

achievement("Limited Time Offer", "[Competitive/Slots] Purchase a bonus item (Spin 3 or 7), place it (with D-pad then A), and win the line", 3,
    IsCompetitiveModeActive() && IsPlayingSlots() &&
    // This logic is more complicated than one might expect due to the lack of a known address that specifically indiciates "player purchased a bonus item".
    // Instead, we detect that the bonus item was visible on a certain slot machine/column on the previous frame, and now it is gone this frame (as well as
    // the spin ending this frame and the player winning the line).    
    (SlotsPlayer_WonThisFrameWithBonusItem(1) || SlotsPlayer_WonThisFrameWithBonusItem(2) || SlotsPlayer_WonThisFrameWithBonusItem(3))
//              SlotsPlayer_SpinEndedThisFrame() && 
//              SlotsPlayer_PlacedBonusItemThisFrame() && 
//              SlotsPlayer_WonLine()
)

achievement("Tri So Serious", "[Competitive/Video Poker] Have at least 3 Jokers in your hand", 3,
    IsCompetitiveModeActive() && IsPlayingVideoPoker() && PokerPlayer_Has3Jokers()
//              never(HandNumberIncreasedThisFrame()) && // have to reset tally() hits after each hand
//              never(CasinoGameChangedThisFrame()) && 
//              never(StartedCasinoGameThisFrame("Video Poker")) &&
//              PokerPlayer_HasInHand(3, "Joker") // counts number of Jokers in current hand using tally()
)

achievement("Hey, I Was Using That!", "[Competitive/Video Poker] Use Swap Card to swap back a card taken from you", 2,
    // TODO: check swap cards of both player and opponent - this is hard to implement!
    // and what if opponent uses Swap Hand or two Swap Cards? maybe need to "record" player's cards at start of hand/draw?
    IsCompetitiveModeActive() && IsPlayingVideoPoker() && once(VideoPokerOpponent_UsedSwapCardCheatThisFrame()) && VideoPokerPlayer_UsedSwapCardCheatThisFrame()
)


// ----------------------------------------------
// Optional (Scoring Event) Achievements
// ----------------------------------------------

achievement("Fruit Snacks", "[Any Mode/Slots] Win any line with 3 Cherry (10x payout) or 2 Orange (12x)", 2,
    IsPlayingSlots() && SlotsPlayer_SpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonWith("3Cherry") || SlotsPlayer_WonWith("2Orange")) 
)

achievement("Fruit Salad", "[Any Mode/Slots] Win any line with 3 Orange (15x payout), 3 Plum (20x), or 3 Melon (25x)", 4,
    IsPlayingSlots() && SlotsPlayer_SpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonWith("3Orange") || SlotsPlayer_WonWith("3Plum") || SlotsPlayer_WonWith("3Melon"))
)

achievement("Triple Threat", "[Any Mode/Slots] Win any line with 3 Bell (50x payout), 3 Bar (100x), or 777 (200x)", 10,
    IsPlayingSlots() && SlotsPlayer_SpinEndedThisFrame() &&
    __ornext(SlotsPlayer_WonWith("3Bell") || SlotsPlayer_WonWith("3Bar") || SlotsPlayer_WonWith("777"))
)

achievement("JACKPOT!", "[Any Mode/Slots] Win the jackpot with a 3rd-line 777", 25,
    IsPlayingSlots() && SlotsPlayer_SpinEndedThisFrame() && SlotsPlayer_WonJackpot()
)

achievement("It's a Crowd", "[Competitive/Draw Poker] Win hand with 3 of a Kind (4x payout in Video Poker)", 3,
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() && PokerPlayer_WonWith("3OfKind")
)

achievement("Sit Up Straight & Don't Forget to Flush", "[Competitive/Draw Poker] Win hand with Straight (5x payout in Video Poker) or Flush (8x)", 4,
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("Straight") || PokerPlayer_WonWith("Flush"))
)

achievement("Now We're Talkin'", "[Competitive/Draw Poker] Win hand with Full House (20x payout in Video Poker) or 4 of a Kind (50x)", 5,
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("FullHouse") || PokerPlayer_WonWith("4OfKind"))
)

achievement("Flushing With Style", "[Any Mode/Video Poker] Win hand with Straight Flush (100x payout) or Royal Flush (250x)", 10,
    IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("StraightFlush") || PokerPlayer_WonWith("RoyalFlush"))
)

achievement("High Five!", "[Any Mode/Video Poker] Win the jackpot with 5 of a Kind", 10,
    IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() && PokerPlayer_WonWith("5OfKind")
)


// ----------------------------------------------
// Optional (Misc) Achievements
// ----------------------------------------------

achievement("Mob Money, Mob Problems", "[Competitive/Draw Poker] Defeat any gangster by making him run out of cash (during Draw Poker)", 5,
    // Note: If the gangster both runs out of cash AND draw poker credits at the same time, the game treats it as running out of cash, 
    // so it is unnecessary to also check the draw poker credits value.
    IsCompetitiveModeActive() && PlayerWonCasinoGameThisFrame(FinalCasinoGameName) && OpponentsCash() == 0
)

achievement("Unmade Man", "[Competitive/Draw Poker] Defeat any gangster by making him run out of Draw Poker Credits", 5,
    IsCompetitiveModeActive() && PlayerWonCasinoGameThisFrame(FinalCasinoGameName) && OpponentsCash() > 0
)

achievement("Bluff Enough?", "[Competitive/Draw Poker] Place or raise a bet that causes your opponent to fold while your hand rank is less than one pair", 10,
    // TODO: need to check player bet/raised: PlayersLastActualBetAmount() changed? (what if the bet equals the ante? does this value include ante?)
    // We could limit this to 2nd draw only (if a memory address can be found to detect 2nd draw), but I've never seen the AI fold on the 1st draw 
    // in response to the player's bet, so that might be pointless.
    IsCompetitiveModeActive() && PlayerWonHand_ThisFrame() && PlayersHandRankingType() == Poker_HandRankingTypeDict["None"] &&
    once(PlayersLastActualBetAmount() != prev(PlayersLastActualBetAmount())) &&
    once(DrawPoker_OpponentFolded()) &&
    never(HandNumberIncreasedThisFrame())
    // disable_when(PlayersHandRankingType() != Poker_HandRankingTypeDict["None"], <player placed bet/raised>)
)

achievement("Frugal Strats", "[Competitive/Slots] Win at slots without buying any cheats/bonus items nor placing any bets over $10 (3x multiplier allowed)", 3,
    IsCompetitiveModeActive() && IsPlayingSlots() && PlayerWonCasinoGameThisFrame("Slots") &&
    disable_when(PlayerPurchasedCheat(true) ||
//     disable_when(PlayersCheatCoin1QuantityAtShady() > 0 || PlayersCheatCoin2QuantityAtShady() > 0 ||
        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol2"] || bcd(CurrentBetPayoutAmountBcd()) > 10,
        StartedCasinoGameThisFrame("Slots"))
//    never(StartedMissionThisFrame()) &&
//    unless(once(
//        PlayersCheatCoin1QuantityAtShady() > 0 ||
//        PlayersCheatCoin2QuantityAtShady() > 0 ||
//        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol2"] || // this won't work if this value can get set during Blackjack (see never() condition)
//        bcd(CurrentBetPayoutAmountBcd()) > 10
//     ))
)

// ----------------------------------------------
// Collection Achievements
// ----------------------------------------------

achievement("Depression-Era Millionaire", "[Competitive/Any Mission] Accumulate at least $1 million total end-of-mission winnings (excludes password-loaded winnings)", 25,
    IsCompetitiveModeActive() && TotalMissionWinnings() > 1000000
//    (TotalMissionWinnings() + PlayersCurrentMissionCashTotal())
)

// Cheats available per mission by casino game
//     Blackjack:   6 types * 2 qty * 2 Shady visits = 24
//     Slots:       2 types * 2 qty * 2 Shady visits =  8
//     Video Poker: 3 types * 2 qty * 2 Shady visits = 12
//     Draw Poker:  2 types * 1 qty * 2 Shady visits =  4
//     --------------------------------------------------
//     Per-Mission Total                             = 48
// Note: While you can revisit Shady during rounds 1 & 6, it's not possible to repurchase a cheat after it was used that round.
MaxCheatsPerMission = 48

achievement("Cheatin' Pete", "[Competitive/Any Mission] Complete a mission while buying out every cheat (from 0 to max qty) from all Shady visits (twice per casino game)", 10,
    // We need to reset the count at the start of the mission rather than just start the count (as in "Honest Pete")
    never(StartedMissionThisFrame()) && repeated(MaxCheatsPerMission, PlayerPurchasedCheatThisFrame()) && WonMissionThisFrame()
)


// ----------------------------------------------
// Challenge Achievements
// ----------------------------------------------

achievement("Forever 21", "[Competitive/Blackjack] Score at least five blackjacks in one game vs. any gangster", 10,
    IsCompetitiveModeActive() && IsPlayingBlackjack() && never(StartedMissionThisFrame()) &&
    // Used tally() instead of repeated() to avoid "combined || and && logic too complex for subclause" compile error
    tally(5, BlackjackPlayer_WonMainHandWithBlackjackThisFrame(), BlackjackPlayer_WonSplitHandWithBlackjackThisFrame())
)

achievement("I Ain't Got All Day", "[Competitive/Blackjack] Save time by having your opponent run out of cash before Hand 10", 10,
    IsCompetitiveModeActive() && PlayerWonCasinoGameThisFrame("Blackjack") && HandNumber() <= 9 &&
    OpponentsCash() == 0 // this check is likely redundant because cash-out is the only way for the opponent to lose early
)

achievement("Knew When to Hold 'Em", "[Competitive/Draw Poker] When your opponent raises your bet, keep playing the hand and win it", 5,
    IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() && never(HandNumberIncreasedThisFrame()) &&
    once(DrawPokerOpponent_RaisedBet()) // TODO: unimplemented      
)

achievement("Rosetti No Spaghetti", "[Competitive/Draw Poker] Defeat any gangster in draw poker without losing a single hand", 10,
    IsCompetitiveModeActive() &&  PlayerWonCasinoGameThisFrame("Draw Poker") && disable_when(DrawPokerPlayer_LostHandThisFrame(), StartedMissionThisFrame())
)

achievement("Honest Pete", "[Competitive/Any Mission] Complete a mission without buying any cheats from Shady", 10,
    once(StartedMissionThisFrame()) && never(PlayerPurchasedCheat(false)) && WonMissionThisFrame()
//   never(TotalCheatQuantity() > 0)
// This alternative logic should have the same end result in terms of achievement functionality, but it uses an (uneeded) PauseLock
//    WonMissionThisFrame() && disable_when(TotalCheatQuantity() > 0, StartedMission())
)

achievement("Al Cologne Now Sleeps With The Fishes", "[Competitive/All Missions] Defeat Al Cologne in all four casino games (in a single playthrough)", 25,
    WonCompetitiveModeThisFrame() && PlayerWonAllCasinoGamesThisFrame()
)

//achievement("The Ultimate Stakes", "[Competitive/All Missions] Defeat all five gangsters without losing any casino games (nor using a password)", 50,
//    // TODO (maybe): rewrite as the reverse check (invalidate when a casino game lost, otherwise awarded at game end) so a trigger flag can be added?    
//    // Count missions with all casino games won up to 5, reset at the start of competitive mode
//    WonCompetitiveModeThisFrame() && repeated(5, PlayerWonAllCasinoGamesThisFrame()) && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
//)


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
RP_CashBcd = rich_presence_value("Number", bcd(PlayersCashBcd()))

// Display if at Title Screen/Menus
rich_presence_conditional_display(RP_IsAtMenu, "[Title Screen/Menu]")

// Display if at Mission Start/End (in Competitive Mode)
rich_presence_conditional_display(IsCompetitiveModeActive() && RP_IsBetweenMissions,
    "Mission {0}: {1} | Winnings: ${2}", RP_MissionNumber, RP_Gangster, RP_Winnings)

// Display if playing Competitive Mode - Blackjack/Poker
rich_presence_conditional_display(IsCompetitiveModeActive() && (IsPlayingBlackjack() || IsPlayingDrawPoker() || IsPlayingVideoPoker()),
    "Mission {0}: {1} | Winnings: ${2} | Playing: {3} | 💰: ${4}", RP_MissionNumber, RP_Gangster, RP_Winnings, RP_CasinoGame, RP_Cash)

// Display if playing Competitive Mode - Slots
rich_presence_conditional_display(IsCompetitiveModeActive() && IsPlayingSlots(),
    "Mission {0}: {1} | Winnings: ${2} | Playing: {3} | 💰: ${4}", RP_MissionNumber, RP_Gangster, RP_Winnings, RP_CasinoGame, RP_CashBcd)

// Display if playing Practice Mode - Blackjack/Poker
rich_presence_conditional_display(IsPlayingBlackjack() || IsPlayingVideoPoker(),
    "Practicing: {0} | 💰: {1}", RP_CasinoGame, RP_Cash)

// Display if playing Practice Mode - Slots/Craps
rich_presence_conditional_display(IsPlayingSlots() || IsPlayingCraps(),
    "Practicing: {0} | 💰: {1}", RP_CasinoGame, RP_CashBcd)

// Display for any other screens (non-gameplay assumed b/c any gameplay should be handled by the conditionals above to print relevant info)
rich_presence_display("[Gameplay Not Started]")
