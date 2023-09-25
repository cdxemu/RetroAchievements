// High Stakes Gambling
// #ID = 4210

// ************************************************************************************************
//                                   Memory Accessors/Value Dictionaries
// ************************************************************************************************

function BonusItemYPosition() => byte(0x00C280)
BonusItemYPositionDict = {"NotVisible": 0x00, "Line2": 0x60, "Line1": 0x70, "Line3": 0x80} 
function BonusItemXPosition() => byte(0x00C281)
BonusItemXPositionDict = {"NotVisible": 0x00, "PlayerCol1": 0x10, "PlayerCol2": 0x28, "PlayerCol3": 0x40}
function TopmostCardRank() => high4(0x00C2AC)
function ControllerInputAFlag() => bit0(0x00C2AE)
function CurrentCasinoGame() => byte(0x00C2B1)
CurrentCasinoGameDict = {"Blackjack": 0x01, "Craps": 0x02, "DrawPoker": 0x04, "Slots": 0x08, "VideoPoker": 0x10}
function GameState() => byte(0x00C2B2)
GameStateDict = {"MissionScore": 0x01, "GangsterPortrait": 0x02, "CashPrize": 0x04, "ModeOrPlayPasswordSelect": 0x05, "Shady": 0x06,
    "TitleScreen": 0x09, "ScoreCard": 0x0B, "CopyrightScreen": 0x20}
function CombinedDiceRoll() => byte(0x00C2B4)
function MenuProperty() => byte(0x00C2BC)
MenuPropertyDict = {"Insurance": 0x08}
function CompetitiveProgressIndicator() => low4(0x00C2C5)
CompetitiveProgressIndicatorDict = {"Started1P": 0x6}
function TwoPlayerGameFlag() => bit0(0x00C2C5)
function CurrentMission() => byte(0x00C2C6)
function CasinoGameMode() => byte(0x00C2C7)
CasinoGameModeDict = {"Practice": 0x00, "Competitive": 0x04}
function HandNumber() => byte(0x00C2C9)
function MenuType() => byte(0x00C2E0)
MenuTypeDict = {"ModeOrPlayPasswordSelect": 0x00, "CopyrightOrTitleScreen": 0x80}
function MenuCursorYPosition() => byte(0x00C2EF)
MenuCursorYPositionDict = {"InsuranceYes": 0x90, "InsuranceNo": 0x98}
function DrawNumber() => byte(0x00C2F9)
function PlayersMission1CashWinnings() => dword(0x00CB79)
function PlayersMission2CashWinnings() => dword(0x00CB81)
function PlayersMission3CashWinnings() => dword(0x00CB6D)
function PlayersMission4CashWinnings() => dword(0x00CB7D)
function PlayersMission5CashWinnings() => dword(0x00CB71)
function PlayersPasswordCashWinnings() => dword(0x00CB75)
function DealersHandCardCount() => byte(0x00CB8F)
function DealersHandCardRank1() => high4(0x00CB90)
function DealersHandCardRank2() => high4(0x00CB91)
function DealersHandPointValue() => byte(0x00CBB2)
function PlayersHandCardCount() => byte(0x00CBEB)
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
function PlayersHandResult() => byte(0x00CC0D)
function PlayersHandResult_IsSpecialFlag() => bit0(0x00CC0D)
function PlayersHandResult_IsSplitFlag() => bit1(0x00CC0D)
function PlayersHandResult_IsDoubleFlag() => bit2(0x00CC0D)
function PlayersHandResult_IsWonFlag() => bit5(0x00CC0D)
function PlayersHandResult_IsTiedFlag() => bit6(0x00CC0D)
function PlayersCash() => dword(0x00CC05)
function PlayersHandPointValue() => byte(0x00CC0E)
function PlayersHandRanking() => byte(0x00CC16)
Poker_HandRankingDict = {"PairOfJacks": 0x1b}
function PlayersHandRankingType() => high4(0x00CC16)
Poker_HandRankingTypeDict = {"None": 0x0, "OnePair": 0x1, "TwoPair": 0x2, "3OfKind": 0x3, "Straight": 0x4, "Flush": 0x5,
    "FullHouse": 0x6, "4OfKind": 0x7, "StraightFlush": 0x8, "RoyalFlush": 0x9, "5OfKind": 0xa}
function PlayersCheatCard1Quantity() => byte(0x00CC1D)
function PlayersCheatCard2Quantity() => byte(0x00CC1E)
function PlayersCheatCard3Quantity() => byte(0x00CC1F)
function PlayersCheatCard4Quantity() => byte(0x00CC20)
function PlayersCheatCard5Quantity() => byte(0x00CC21)
function PlayersCheatCard6Quantity() => byte(0x00CC22)
function PlayersActualPayout() => dword(0x00CC2B)
function PlayersCurrentMissionCashTotal() => dword(0x00CC33)
function PlayersScoreCardTotal() => byte(0x00CC41)
function PlayerWonBlackjackFlag() => bit0(0x00CC42)
function PlayerWonDrawPokerFlag() => bit2(0x00CC42)
function PlayerWonSlotsFlag() => bit3(0x00CC42)
function PlayerWonVideoPokerFlag() => bit4(0x00CC42)
function PlayersSplitHandCardCount() => byte(0x00CC47)
function PlayersSplitHandResult() => byte(0x00CC69)
function PlayersSplitHandResult_IsSpecialFlag() => bit0(0x00CC69)
function PlayersSplitHandResult_IsActiveFlag() => bit3(0x00CC69)
function PlayersSplitHandResult_IsWonFlag() => bit5(0x00CC69)
function PlayersSplitHandResult_IsTiedFlag() => bit6(0x00CC69)
function PlayersSplitHandPointValue() => byte(0x00CC6A)
function PlayersCheatCoin1QuantityAtShady() => byte(0x00CC79)
function PlayersCheatCoin2QuantityAtShady() => byte(0x00CC7A)
function OpponentsHandCardCount() => byte(0x00CCA3)
function OpponentsCash() => dword(0x00CCBD)
function OpponentsHandResult() => byte(0x00CCC5)
function OpponentsHandResult_IsSpecialFlag() => bit0(0x00CCC5)
function OpponentsHandResult_IsWonOrTiedFlag() => bit7(0x00CCC5)
function OpponentsHandPointValue() => byte(0x00CCC6)
function OpponentsSplitHandCardCount() => byte(0x00CCFF)
function OpponentsSplitHandResult() => byte(0x00CD21)
function OpponentsSplitHandResult_IsSpecialFlag() => bit0(0x00CD21)
function OpponentsSplitHandResult_IsWonOrTiedFlag() => bit7(0x00CD21)
function OpponentsSplitHandPointValue() => byte(0x00CD22)
function SlotsPlayersBetMultiplier() => byte(0x00D444)
function SpinNumber() => byte(0x00D446)
function PlayersPayoutLine1BetMultiplier() => word(0x00D459)
function PlayersPayoutLine2BetMultiplier() => word(0x00D45B)
function PlayersPayoutLine3BetMultiplier() => word(0x00D45D)
SlotsPayoutMultiplierDict = {"1Cherry": 2, "2Cherry": 5, "3Cherry": 10, "2Orange": 12, "3Orange": 15, "3Plum": 20, "3Melon": 25, "3Bell": 50, "3Bar": 100, "777": 200}
function PlayersCheatCoin1Quantity() => byte(0x00D490)
function PlayersCheatCoin2Quantity() => byte(0x00D491)
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
function PlayersActualBetAmountBCD() => word_be(0x00D64A)
function IsCrapsPlayersTurn() => byte(0x00D659)
function IsCasinoGameActive() => byte(0x00FFB7)
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
function EstablishedPointNumber() => byte(0x00FFC9)
function IsCrapsBetWon() => bit3(0x00FFCE)
function SlotsPlayerWonJackpotFlag() => bit1(0x00FFCF)
function PlayersCashBCD() => dword_be(0x00FFD1)

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

// Checking for 2P in Practice Mode seems unneccessary because you only play against the dealer or yourself, so it doesn't confer any advantage and 
// certainly isn't worth the trouble of setting it up with Game Link and 2 game instances and getting that to work (it tends to reset/freeze/crash).
function IsPracticeMode() => CasinoGameMode() == CasinoGameModeDict["Practice"] // && TwoPlayerGameFlag() == 0
function IsCompetitiveMode() => CompetitiveProgressIndicator() == CompetitiveProgressIndicatorDict["Started1P"]

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

// Competitive Mode only - Practice casino games do not clear this value at the end
function EndedCasinoGameThisFrame() => Decreased(IsCasinoGameActive())

function StartedMissionThisFrame() {
    // The Gangster Portrait screen seems to be the most consistent and easily identifiable way to determine a mission has started
    return IsAtScreen("GangsterPortrait") && Changed(GameState())
}

function StartedCompetitiveModeThisFrame() => IsCompetitiveMode() && prev(CompetitiveProgressIndicator()) != CompetitiveProgressIndicatorDict["Started1P"]
function StartedCompetitiveModeNewGameThisFrame() => StartedCompetitiveModeThisFrame() && DisplayedMissionNumber() == 1

function WonMissionThisFrame() => PlayerWonCasinoGameThisFrame(FinalCasinoGameName)

function WonCompetitiveModeThisFrame() {
    FinalMissionNum = 5
    return IsCompetitiveMode() && DisplayedMissionNumber() == FinalMissionNum && WonMissionThisFrame()
}

function UsedCompetitiveModePassword() {
    // Password protection: can check if have any password-loaded cash winnings, since any real password will have some
    // alternatively, we might be able to check if previously at password entry screen before game started, but I think it is difficult because
    // that screen shares the same "Game State" value as the password display screen at the end of a mission
    // Caveat: not protect against potential fake/hacked passwords with no cash winnings (if such a thing exists)
    return PlayersPasswordCashWinnings() != 0
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

function TotalMissionWinnings() => Winnings(1) + Winnings(2) + Winnings(3) + Winnings(4) +  Winnings(5)

function AnyMissionWinningsAtLeast(cash_amount) {
    return (Increased(Winnings(1)) && Winnings(1) >= cash_amount) ||
           (Increased(Winnings(2)) && Winnings(2) >= cash_amount) ||
           (Increased(Winnings(3)) && Winnings(3) >= cash_amount) ||
           (Increased(Winnings(4)) && Winnings(4) >= cash_amount) ||
           (Increased(Winnings(5)) && Winnings(5) >= cash_amount)
}

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
}

function PlayerPurchasedCheatThisFrame() {
    return Increased(PlayersCheatCard1Quantity()) || Increased(PlayersCheatCard2Quantity()) || Increased(PlayersCheatCard3Quantity()) ||
           Increased(PlayersCheatCard4Quantity()) || Increased(PlayersCheatCard5Quantity()) || Increased(PlayersCheatCard6Quantity()) ||
           // Use Cheat Coin Quantity at Shady because the other (in-game) cheat coin quantity is not set until Shady was exited
           // It is unreliable in that it may not be reset consistently when exiting Shady, but it should be sufficient for tracking purchases (when its value increases)
           Increased(PlayersCheatCoin1QuantityAtShady()) || Increased(PlayersCheatCoin2QuantityAtShady())
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

function BlackjackPlayer_WonMainHand() => PlayersHandResult_IsWonFlag() == 1
function BlackjackPlayer_WonSplitHand() => PlayersSplitHandResult_IsActiveFlag() == 1 && PlayersSplitHandResult_IsWonFlag() == 1
function BlackjackPlayer_WonMainHandWithBlackjack() => BlackjackPlayer_WonMainHand() && PlayersHandResult_IsSpecialFlag() == 1
function BlackjackPlayer_WonSplitHandWithBlackjack() => BlackjackPlayer_WonSplitHand() && PlayersSplitHandResult_IsSpecialFlag() == 1
function BlackjackPlayer_WonMainHandWithBlackjackThisFrame() => Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHandWithBlackjack()
function BlackjackPlayer_WonSplitHandWithBlackjackThisFrame() => Changed(PlayersSplitHandResult()) && BlackjackPlayer_WonSplitHandWithBlackjack()
function BlackjackPlayer_WonEitherWithBlackjackThisFrame() => BlackjackPlayer_WonMainHandWithBlackjackThisFrame() ||  BlackjackPlayer_WonSplitHandWithBlackjackThisFrame()
function BlackjackPlayer_WonMainHandThisFrame() => Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHand()
function BlackjackPlayer_WonSplitHandThisFrame() => Changed(PlayersSplitHandResult()) && BlackjackPlayer_WonSplitHand()

function BlackjackPlayer_WonBothSplitHandsThisFrame() {
    return PlayersHandResult_IsSplitFlag() == 1  && Changed(PlayersSplitHandResult()) && 
           BlackjackPlayer_WonMainHand()  && BlackjackPlayer_WonSplitHand()
}

function BlackjackPlayer_DoubledDownAndWonThisFrame() {
    // Note: the game does not let you double down after a split, so we don't need to check the split hand
    return PlayersHandResult_IsDoubleFlag() == 1 && Changed(PlayersHandResult()) && BlackjackPlayer_WonMainHand()
}

function BlackjackPlayer_BoughtInsurance() {
    // Despite my best efforts, I was unable to find any memory addresses that track whether insurance was purchased/refused,
    // so instead I check for the button press event when "Yes" or "No" is selected in the "Insurance?" menu.
    return MenuCursorYPosition() == MenuCursorYPositionDict["InsuranceYes"] && MenuProperty() == MenuPropertyDict["Insurance"] &&
           ControllerInputAFlag() == 1
}

function BlackjackPlayer_DeclinedInsurance() {
    return MenuCursorYPosition() == MenuCursorYPositionDict["InsuranceNo"] && MenuProperty() == MenuPropertyDict["Insurance"] &&
           ControllerInputAFlag() == 1
}

function BlackjackPlayer_StartedMainHandThisFrame() => PlayersHandCardCount() == 2 && prev(PlayersHandCardCount()) == 1
function BlackjackPlayer_StartedSplitHandThisFrame() => PlayersSplitHandCardCount() == 2 && prev(PlayersSplitHandCardCount()) == 1
function BlackjackPlayer_StartedEitherHandThisFrame() => __ornext(BlackjackPlayer_StartedMainHandThisFrame() || BlackjackPlayer_StartedSplitHandThisFrame())

function BlackjackOpponent_MainHandBusted() => OpponentsHandResult_IsWonOrTiedFlag() == 0 && OpponentsHandResult_IsSpecialFlag() == 1
function BlackjackOpponent_SplitHandBusted() => OpponentsSplitHandResult_IsWonOrTiedFlag() == 0 && OpponentsSplitHandResult_IsSpecialFlag() == 1

function BlackjackOpponent_SwappedThisFrame(min_points) {
    // Order of events:
    // * Player's Swap Card Cheat Quantity decremented (then incremented if player cancels out of it)
    // * Swap animation plays
    // * Opponent's Hand Point Value updated
    return (OpponentsHandPointValue() > min_points && prev(OpponentsHandPointValue()) <= min_points && OpponentsHandCardCount() == prev(OpponentsHandCardCount())) ||
    (OpponentsSplitHandPointValue() > min_points && prev(OpponentsSplitHandPointValue()) <= min_points && OpponentsSplitHandCardCount() == prev(OpponentsSplitHandCardCount()))
}

function BlackjackOpponent_BustedThisFrame(min_points) {
    return (Changed(OpponentsHandResult()) && BlackjackOpponent_MainHandBusted() && OpponentsHandPointValue() >= min_points) ||
           (Changed(OpponentsSplitHandResult()) && BlackjackOpponent_SplitHandBusted() && OpponentsSplitHandPointValue() >= min_points)
}

function BlackjackPlayer_UsedSeeNextCardCheatThisFrame() => Decreased(PlayersCheatCard5Quantity())
function BlackjackPlayer_UsedSeeDealDownCheatThisFrame() => Decreased(PlayersCheatCard6Quantity())

function BlackjackPlayer_WonEitherHandThisFrameWithPointRange(min_point_val, max_point_val) {
    WonMainHandThisFrame  = BlackjackPlayer_WonMainHandThisFrame()  && PlayersHandPointValue() >= min_point_val      && PlayersHandPointValue() <= max_point_val
    WonSplitHandThisFrame = BlackjackPlayer_WonSplitHandThisFrame() && PlayersSplitHandPointValue() >= min_point_val && PlayersSplitHandPointValue() <= max_point_val
    return WonMainHandThisFrame || WonSplitHandThisFrame
}

function Blackjack_SawDealerWillBust() {
    // This function assumes it is being called during the player's turn (when the dealer will always have two cards).
    // Dealer will hit on 16 (or less) or "soft 17". However, if the dealer has a "soft 17", they cannot bust on the next card, so we can ignore that case.
    HasNoAce = DealersHandCardRank1() != CardRankDict["Ace"] && DealersHandCardRank2() != CardRankDict["Ace"]    
    WillHit = DealersHandPointValue() < 17 && HasNoAce
    
    IsNextFaceCard = __ornext(TopmostCardRank() == CardRankDict["Jack"] || TopmostCardRank() == CardRankDict["Queen"] || TopmostCardRank() == CardRankDict["King"])
    WillBust_FaceCard = BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && IsNextFaceCard          && (DealersHandPointValue() + 10) > 21
    WillBust_PipCard  = BlackjackPlayer_UsedSeeNextCardCheatThisFrame() && TopmostCardRank() <= 10 && (DealersHandPointValue() + TopmostCardRank()) > 21

    return (once(WillHit && WillBust_FaceCard && never(Increased(PlayersHandCardCount()))) ||
            once(WillHit && WillBust_PipCard  && never(Increased(PlayersHandCardCount()))))
}

function BlackjackDealer_HasBlackjackThisFrame() => DealersHandCardCount() == 2 && DealersHandPointValue() == 21 && Changed(DealersHandCardCount())

function BlackjackPlayer_MainHandPush21ThisFrame() {
    return Changed(PlayersHandResult_IsTiedFlag()) && PlayersHandResult_IsTiedFlag() == 1 && DealersHandPointValue() == 21       
}

function BlackjackPlayer_SplitHandPush21ThisFrame() {
    return Changed(PlayersSplitHandResult_IsTiedFlag()) && PlayersSplitHandResult_IsTiedFlag() == 1 && DealersHandPointValue() == 21 &&
         PlayersSplitHandResult_IsActiveFlag() == 1 
}

function BlackjackPlayer_SplitThisFrame() => PlayersHandResult_IsSplitFlag() == 1 && Changed(PlayersHandResult_IsSplitFlag())

// Warning: SpinNumber does not increase on Spin 10 ending, so this function should only be used where that is acceptable
function SlotsPlayer_CompetitiveSpinEndedThisFrame() => Increased(SpinNumber())
function SlotsPlayer_PlacedBetThisFrame() => Increased(SlotsPlayersBetMultiplier())
function SlotsPlayer_PayoutThisFrame() => Increased(PlayersCashBCD())

// At moment when jackpot is paid out, Player's Cash (BCD) increases on same frame that the Jackpot Flag is cleared from 1 to 0 (at end of jackpot animation)
// Strangely, when there is a bonus item available and a potential jackpot, the Jackpot Flag is set to 1 before the bonus item is even placed.
// If the bonus item is placed on non-winning line instead, the jackpot flag is cleared from 1 to 0 immediately when the bonus item is placed.
// Also note that the bonus item (if purchased) is still visible on the frame of the cash payout, so we can't check if it is gone at that point.
function SlotsPlayer_WonJackpotThisFrame() => Decreased(SlotsPlayerWonJackpotFlag()) && SlotsPlayer_PayoutThisFrame() 

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

function PokerPlayer_NoCardsWereHeld() {
    return DrawNumber() == 1 && PlayersCard1FaceDownFlag() == 1 && PlayersCard2FaceDownFlag() == 1 && PlayersCard3FaceDownFlag() == 1 &&
        PlayersCard4FaceDownFlag() == 1 && PlayersCard5FaceDownFlag() == 1
}

function CrapsRoll_IsNatural() => CombinedDiceRoll() == 7 || CombinedDiceRoll() == 11
function CrapsRoll_IsCraps() => CombinedDiceRoll() == 2 || CombinedDiceRoll() == 3 || CombinedDiceRoll() == 12
function CrapsRoll_IsPoint() => CombinedDiceRoll() == EstablishedPointNumber()

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

function CrapsPlayer_HadBetOn(bet_type) => prev(GetCrapsBetAmount(bet_type)) > 0

function CrapsPlayer_WonBetThisFrame(bet_type) {
    // When a bet is won, the associated bet amount is zeroed out on the same frame the player's cash is increased (to refund the bet amount)
    if (bet_type == "Pass" || bet_type == "DontPass" || bet_type == "PassOdds" || bet_type == "DontPassOdds")
        // Pass and Don't Pass do not show bet results and therefore we cannot rely them setting CrapsBetType or CrapsBetWon - so use the older
        // version of this function instead (which didn't work with "Any Craps" and other single-roll bets).
        return CrapsPlayer_WonBetThisFrameByAmount(GetCrapsBetAmount(bet_type))
    else
        return CrapsPlayer_TurnPaused() && CrapsPlayer_HadBetOn(bet_type) && CrapsBetType() == CrapsBetTypeDict[bet_type] && IsCrapsBetWon() == 1
}

function CrapsPlayer_WonLineBets(bet_count) => tally_of(LineBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
function CrapsPlayer_WonSingleRollBets(bet_count) => tally_of(SingleBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
function CrapsPlayer_WonMultiRollBets(bet_count) => tally_of(MultiBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))
function CrapsPlayer_WonAnyBets(bet_count) => tally_of(AllBetTypes, bet_count, bet_type => once(CrapsPlayer_WonBetThisFrame(bet_type)))

function CrapsPlayer_PlacedBet(bet_amount) {
    // When a bet is won, the associated bet amount is zeroed out on the same frame the player's cash is increased (to refund the bet amount)
    // Note: Ideally we could move CrapsPlayer_TurnEnded() outside the tally so it isn't duplicated for each bet type, but that doesn't seem
    // possible with RAScript (replacing tally_of() with tally(any_of()) didn't work either, because while it would generate an OrNext chain, it
    // only checks if ANY bet is >0 X times, rather than if X bets are >0). I think this might be a case where ResetNextIf would help.
    return CrapsPlayer_TurnEnded() && bet_amount > 0
}

function CrapsPlayer_PlacedBets(bet_count) => tally_of(AllBetAmounts, bet_count, bet_amount => once(CrapsPlayer_PlacedBet(bet_amount)))

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
    "[Practice] Blackjack - Buy or refuse insurance and have it pay off (dealer face-up ace: costs half your bet, original bet refunded if dealer has B.J.)", 2,
    IsPracticeMode() && IsPlayingBlackjack() &&
    ((BlackjackPlayer_BoughtInsurance() && DealersHandPointValue() == 21) || (BlackjackPlayer_DeclinedInsurance() && DealersHandPointValue() != 21))
    , id=356411)

achievement("Slots Academy: One-Armed Banditry", "[Practice] Slots - Bet on all three lines and win at least two of them", 1,
    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_WonAtLeast2LinesThisFrame() && SlotsPlayersBetMultiplier() == 3
    , id=356412)

achievement("Video Poker Academy: Can You Hold, Please?",
    "[Practice] Video Poker - Hold at least one card and get a higher-scoring hand on the 2nd draw (one pair doesn't score unless Jacks or better)", 1,
    IsPracticeMode() && IsPlayingVideoPoker() &&
    once(Poker_SecondDrawStarted()) && VideoPokerPlayer_HandScoringIncreasedThisFrame() && unless(once(PokerPlayer_NoCardsWereHeld()))
    && (always_true() || never(Increased(HandNumber())))
    , id=356413)

// ----------------------------------------------
// Progression Achievements
// ----------------------------------------------

// Adds an achievement for winning the specified mission/casino game with the given title and points
function WinStageAchievement(mission, casino_game_num, ach_title, ach_points, ach_id)
{
    CasinoGameName = GetCasinoGameName(casino_game_num)
    ach_desc = format("Mission {0}-{1}: Win at {2} vs. {3}", mission, casino_game_num, CasinoGameName, GetGangsterName(mission))

    achievement(ach_title, ach_desc, ach_points,
        DisplayedMissionNumber() == mission && PlayerWonCasinoGameThisFrame(CasinoGameName), id = ach_id
    )
}

// Add achievements for winning each Competitive Mode mission/casino game
// Mission 1 - Machine Gun Max
WinStageAchievement(1, 1, "Call Me Bulletproof Bob", 3, 356414)
WinStageAchievement(1, 2, "Beginner's Luck?", 3, 356415)
WinStageAchievement(1, 3, "Loserus Maximus", 3, 356416)
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
//    WonCompetitiveModeThisFrame() && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
    // Revised/simplified to not use PauseLock
    WonCompetitiveModeThisFrame() && !UsedCompetitiveModePassword()
    , id=356434)

// ----------------------------------------------
// Optional (Item Usage) Achievements
// ----------------------------------------------

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
    && BlackjackPlayer_WonEitherHandThisFrameWithPointRange(12,17)
    , id=357313)

achievement("An Offer He Can't Refuse", "Blackjack - Use Swap Card to raise your opponent's hand value above 21 points", 2,
    IsCompetitiveMode() && IsPlayingBlackjack() && BlackjackOpponent_SwappedThisFrame(21)
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
    , id=356438)

achievement("Tri So Serious", "Video Poker - Have at least 3 Joker cards at the end of the hand (Competitive Mode only)", 3,
    IsCompetitiveMode() && IsPlayingVideoPoker() && 
    PokerPlayer_Has3Jokers() && PlayerWonHand_ThisFrame()
    , id=356439)

// ----------------------------------------------
// Optional (Scoring Event) Achievements
// ----------------------------------------------

achievement("Sound of Rain", "Slots - Win all 3 lines on one spin", 5,
    IsPlayingSlots() && SlotsPlayer_WonAll3LinesThisFrame() &&
    // This check might be redundant if the payout bet multiplier is only set if the winning line is active
    SlotsPlayersBetMultiplier() == 3
    , id=356441)

achievement("Cherry Picking", "Slots - Win any line with 2 Cherry (5x payout), 3 Cherry (10x), or 2 Orange (12x)", 2,
    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && 
    __ornext(SlotsPlayer_WonAnyLineWith("2Cherry") || SlotsPlayer_WonAnyLineWith("3Cherry") || SlotsPlayer_WonAnyLineWith("2Orange")) 
    , id=356442)

achievement("Fruit Salad", "Slots - Win any line with 3 Orange (15x payout), 3 Plum (20x), or 3 Melon (25x)", 4,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Orange") || SlotsPlayer_WonAnyLineWith("3Plum") || SlotsPlayer_WonAnyLineWith("3Melon"))
    , id=356443)

achievement("Triple Threat", "Slots - Win any line with 3 Bell (50x payout), 3 Bar (100x), or non-jackpot 777 (200x)", 10,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("3Bell") || SlotsPlayer_WonAnyLineWith("3Bar") || SlotsPlayer_WonAnyLineWith("777"))
    , id=356444)

achievement("JACKPOT!", "Slots - Win the jackpot with a 3rd-line 777", 25,
    IsPlayingSlots() && SlotsPlayer_WonJackpotThisFrame()
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

achievement("Frugal Strats", "Slots - Beat your opponent without buying any cheats/bonus items nor placing any bets over $10 (3x mult. is allowed)", 3,
    IsCompetitiveMode() && IsPlayingSlots() && PlayerWonCasinoGameThisFrame("Slots") &&
    disable_when(PlayerPurchasedCheat(true) ||
        // If player purchases a bonus item, it will initally appear in the player's slot machine's central column
        BonusItemXPosition() == BonusItemXPositionDict["PlayerCol2"] ||
        (bcd(PlayersActualBetAmountBCD()) > 10 && SlotsPlayer_PlacedBetThisFrame()),
        StartedCasinoGameThisFrame("Slots"))
    , id=356454)

// ----------------------------------------------
// Collection Achievements
// ----------------------------------------------

achievement("High Stakes High Roller", "Earn at least $350,000 end-of-mission winnings in one mission", 10,
    IsCompetitiveMode() && AnyMissionWinningsAtLeast(350000)
    , id=356455)

achievement("Depression-Era Millionaire", "Earn at least $1 million total end-of-mission winnings (excludes password-loaded winnings)", 10,
    IsCompetitiveMode() && TotalMissionWinnings() > 1000000
    , id=356456)

// ----------------------------------------------
// Challenge Achievements
// ----------------------------------------------

achievement("Sus Hands Are Afoot", "Blackjack - Make your opponent bust with a \"very non-suspicious\" hand value of 35 points or more", 5,
    IsCompetitiveMode() && IsPlayingBlackjack() && BlackjackOpponent_BustedThisFrame(35)
    , id=356457)

achievement("Forever 21", "Blackjack - Score at least five Blackjacks in one game", 5,
    IsPlayingBlackjack() && never(StartedMissionThisFrame()) &&
    // Used tally() instead of repeated() to avoid "combined || and && logic too complex for subclause" compile error
    // Also moved IsCompetitiveMode() inside tally() so that the count doesn't increase while in practice mode (though it would be reset before triggering)
    measured(tally(5, IsCompetitiveMode() && BlackjackPlayer_WonMainHandWithBlackjackThisFrame(), IsCompetitiveMode() && BlackjackPlayer_WonSplitHandWithBlackjackThisFrame()))
    , id=356458)

achievement("What Big Hands You Have", "Blackjack - Have eight cards in your hand (bust allowed on last card)", 10,
    IsPlayingBlackjack() && (PlayersHandCardCount() >= 8 || PlayersSplitHandCardCount() >= 8)
    , id=356459)

achievement("Rosetti No Spaghetti", "Blackjack - Win all possible hands (allowed to lose on dealer B.J. or push on dealer 21)", 10,
    // Note: it is possible to achieve this and still lose the casino game if your opponent ends with more cash
    IsCompetitiveMode() && IsPlayingBlackjack() && EndedCasinoGameThisFrame() &&
        tally(10, BlackjackPlayer_WonMainHandThisFrame(), BlackjackPlayer_WonSplitHandThisFrame(), BlackjackDealer_HasBlackjackThisFrame(),
        BlackjackPlayer_MainHandPush21ThisFrame(), BlackjackPlayer_SplitHandPush21ThisFrame(), deduct(BlackjackPlayer_SplitThisFrame())) &&
        never(StartedMissionThisFrame())
    , id=356460)

achievement("Honest Pete", "Complete Mission 1 without buying any cheats from Shady", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 1 && once(StartedMissionThisFrame()) && never(PlayerPurchasedCheat(false)) && trigger_when(WonMissionThisFrame())
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

achievement("Lucky Louis Sleeps With the Fishes", "Complete Mission 4 without losing any casino games", 10,
    IsCompetitiveMode() && DisplayedMissionNumber() == 4 && PlayerWonAllCasinoGamesThisFrame()
    , id=356465)

achievement("Al Col-Owned", "Complete Mission 5 with at least 12 Draw Poker Credits remaining", 25,
    WonCompetitiveModeThisFrame() && PlayersScoreCardTotal() >= 12
    , id=356466)

// ----------------------------------------------
// Craps Achievements
// ----------------------------------------------

achievement("Craps Academy: It's Only Natural", "Craps - Win a Pass line bet by rolling a \"natural\" (7 or 11) on the come-out roll", 1,
    IsPlayingCraps() && CrapsRoll_IsNatural() && CrapsPlayer_WonBetThisFrame("Pass")
    , id=356467)

achievement("Craps Academy: Got the Craps", "Craps - Win a Don't Pass line bet by rolling \"craps\" (2 or 3 to win, 12 to push) on the come-out roll", 1,
    IsPlayingCraps() && CrapsRoll_IsCraps() && CrapsPlayer_WonBetThisFrame("DontPass")
    , id=356468)

achievement("Craps Academy: Come to Papa", "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Come line bet by rolling 7 or 11", 1,
    IsPlayingCraps() && CrapsRoll_IsNatural() && CrapsPlayer_WonBetThisFrame("Come")
    , id=356469)

achievement("Craps Academy: Mama Told Me Not To", "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Don't Come line bet by rolling 2 or 3 (12 to push)", 1,
    IsPlayingCraps() && CrapsRoll_IsCraps() && CrapsPlayer_WonBetThisFrame("DontCome")
    , id=356470)

achievement("Craps Academy: OK, I Get the Point",
    "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Pass line bet by rerolling the point number", 1,
    IsPlayingCraps() && CrapsRoll_IsPoint() && (CrapsPlayer_WonBetThisFrame("Pass") || CrapsPlayer_WonBetThisFrame("PassOdds"))
    , id=356471)

achievement("Craps Academy: What's in the Box?",
    "Craps - Establish a \"point number\" (4-6 or 8-10) on the come-out roll, then win a Don't Pass line bet by \"sevening out\" (roll a 7)", 1,
    IsPlayingCraps() && CombinedDiceRoll() == 7 && (CrapsPlayer_WonBetThisFrame("DontPass") || CrapsPlayer_WonBetThisFrame("DontPassOdds"))
    , id=356472)

achievement("Craps Academy: Crapshoot", "Craps - Win at least 5 different single-roll bets (Craps #, Seven, Yoleven, Any Craps, C & E, Horn, Field)", 2,
    IsPlayingCraps() && measured(CrapsPlayer_WonSingleRollBets(5)) && // internally uses tally w/ hit counts to track bets won
    // Only reset count if player exits craps
    never(!IsPlayingCraps())
    , id=356473)

achievement("Craps Academy: Rollin', Rollin', Rollin'", "Craps - Win at least 5 different multi-roll bets (Place #, Buy #, Lay #, Hard #, Big #)", 2,
    IsPlayingCraps() && measured(CrapsPlayer_WonMultiRollBets(5)) && // internally uses tally w/ hit counts to track bets won
    // Only reset count if player exits craps
    never(!IsPlayingCraps())
    , id=356474)

achievement("Putting It All Together", "Craps - Win a line, multi-roll, and single-roll bet on the same roll (without any other bets on the table)", 5,
    IsPlayingCraps() && unless(CrapsPlayer_PlacedBets(4)) && CrapsPlayer_WonLineBets(1) && CrapsPlayer_WonSingleRollBets(1) && CrapsPlayer_WonMultiRollBets(1) &&
    (always_true() || never(CrapsPlayer_TurnStarted()))
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

// Display if started 2-Player game (not allowed for achievements/leaderboards)
rich_presence_conditional_display(TwoPlayerGameFlag() == 1, "🔴 2P Game 🔴")

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
    trigger = IsCompetitiveMode() && DisplayedMissionNumber() == mission && PlayerWonDrawPokerFlag() == 1 && Increased(Winnings(mission))

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