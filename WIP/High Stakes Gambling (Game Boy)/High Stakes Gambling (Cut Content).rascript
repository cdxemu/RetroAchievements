// ************************************************************************************************
//                                   Memory Accessors/Value Dictionaries
// ************************************************************************************************
function ActiveHandPointValue() => byte(0x00C2AD)
function IsOpponentsTurn() => byte(0x00C2C8)
function LastPlacedBetAmount() => word(0x00CB45)
DrawPoker_HandResultDict = {"Fold": 0x09}
function PlayersLastActualBetAmount() => word(0x00CC2F)
function OpponentsCheatCard2Quantity() => byte(0x00CCD6)
function OpponentsLastActualBetAmount() => word(0x00CCE7)

// ************************************************************************************************
//                             Helper Functions (Casino Game-Specific)
// ************************************************************************************************

function BlackjackPlayer_WonEitherHandThisFrame() => BlackjackPlayer_WonMainHandThisFrame() || BlackjackPlayer_WonSplitHandThisFrame()

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

function VideoPokerPlayer_UsedSwapCardCheatThisFrame() => Decreased(PlayersCheatCard2Quantity())
function VideoPokerOpponent_UsedSwapCardCheatThisFrame() => Decreased(OpponentsCheatCard2Quantity())

function DrawPoker_OpponentFolded() => OpponentsHandResult() == DrawPoker_HandResultDict["Fold"]

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

// ************************************************************************************************
//                                          Achievements
// ************************************************************************************************

achievement("Slots Academy: Cherry Picking", "[Practice] Slots - Win any line with 1 Cherry (2x payout) or 2 Cherry (5x)", 1,
    IsPracticeMode() && IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() && 
    __ornext(SlotsPlayer_WonAnyLineWith("1Cherry") || SlotsPlayer_WonAnyLineWith("2Cherry")) 
)

achievement("Video Poker Academy: Paired Up", "[Practice] Video Poker - Win hand with one pair of \"Jacks or better\" (1x payout) or two pair (2x)", 1,
    IsPracticeMode() && IsPlayingVideoPoker() && PlayerWonHand_ThisFrame() &&
    __ornext(PokerPlayer_WonWith("OnePair") || PokerPlayer_WonWith("TwoPair"))
)

achievement("Bustin' Don't Make Me Feel Good", "Blackjack - Use See Next Card when your hand value is 17 or less, revealing a card that would make you bust, then win the hand", 5,
    // TODO: need to check if player has a "soft" hand (11 pt ace) because that would prevent bust if the player just hits
    IsCompetitiveMode() && IsPlayingBlackjack() &&
    BlackjackPlayer_OnceSawNextCardWouldBust(17) &&  // once() clauses are internal to this function due to the complexity of the logic
    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
    , id=356435)

achievement("I Will Not Stand For This", "Blackjack - Use See Deal Down when your hand value is 12 or more, revealing a higher-point card total, then win the hand",  5,
    IsCompetitiveMode() && IsPlayingBlackjack() && once(ActiveHandPointValue() >= 12 && BlackjackPlayer_SawDealerHandHigherThisFrame()) &&
    BlackjackPlayer_WonEitherHandThisFrame() && never(BlackjackPlayer_StartedEitherHandThisFrame())
    , id=356436)

achievement("Hey, I Was Using That!", "Video Poker - Use Swap Card to swap back a card taken from you", 2,
    // TODO: check swap cards of both player and opponent - this is hard to implement!
    // and what if opponent uses Swap Hand or two Swap Cards? maybe need to "record" player's cards at start of hand/draw with AddSource/SubSource?
    IsCompetitiveMode() && IsPlayingVideoPoker() && once(VideoPokerOpponent_UsedSwapCardCheatThisFrame()) && VideoPokerPlayer_UsedSwapCardCheatThisFrame()
    , id=356440)

achievement("Fruit Snacks", "Slots - Win any line with 2 Orange (12x payout) or 3 Orange (15x)", 2,
    IsPlayingSlots() && SlotsPlayer_PayoutThisFrame() &&
    __ornext(SlotsPlayer_WonAnyLineWith("2Orange") || SlotsPlayer_WonAnyLineWith("3Orange")) 
)

achievement("Bluff Enough?", "Draw Poker - Place or raise a bet that causes your opponent to fold while your hand rank is less than one pair", 10,
    IsCompetitiveMode() && IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() &&
    once(PlayersHandRankingType() == Poker_HandRankingTypeDict["None"] && DrawPokerPlayer_PlacedBet()) &&
    once(DrawPoker_OpponentFolded()) &&
    never(Increased(HandNumber())) && never(Increased(DrawNumber()))
    , id=356453)

achievement("High Stakes High Roller", "Earn at least $1.5 million total end-of-mission winnings (excludes password-loaded winnings)", 25,
    IsCompetitiveMode() && TotalMissionWinnings() > 1500000
)

achievement("I Ain't Got All Day", "Blackjack - Save time by having your opponent run out of cash before Hand 10", 10,
    IsCompetitiveMode() && PlayerWonCasinoGameThisFrame("Blackjack") && HandNumber() <= 9 &&
    OpponentsCash() == 0 // this check is likely redundant because cash-out is the only way for the opponent to lose early
)

achievement("Knew When to Hold 'Em", "Draw Poker - When your opponent raises your bet, keep playing the hand and win it", 5,
    IsCompetitiveMode() && IsPlayingDrawPoker() && PlayerWonHand_ThisFrame() &&
    once(DrawPokerPlayer_PlacedBet()) && once(DrawPokerOpponent_RaisedBetThisFrame()) &&
    never(Increased(HandNumber())) && never(Increased(DrawNumber())) 
    , id=356461)

achievement("The Ultimate Stakes", "Defeat all five gangsters without losing any casino games (nor using a password)", 50,  
    // Count missions with all casino games won up to 5, reset at the start of competitive mode
    WonCompetitiveModeThisFrame() && repeated(5, PlayerWonAllCasinoGamesThisFrame()) && disable_when(UsedCompetitiveModePassword(), StartedCompetitiveModeNewGameThisFrame())
)
