#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
  NSMutableArray *playerRanks = [NSMutableArray new];
  
  //проверяем граничные условия
  if (rankedArray.count == 0 || playerArray.count == 0) {
    //конечно проверку лучше сделать раздельно
    
    for (NSInteger i = 0; i < playerArray.count; i += 1) {
      [playerRanks addObject:@(1)];
    }
    return  playerRanks ;
  }
  
  //считаем ranks
  NSMutableDictionary *ranks = [NSMutableDictionary new];
  
  NSUInteger prevValue = rankedArray[0].integerValue;
  NSUInteger rank = 1;
  
  for (NSNumber *value in rankedArray) {
    //NSInteger valueNSInteger = value.integerValue;
    if (value.integerValue != prevValue) {
      rank += 1;
    }
    prevValue = value.integerValue;
    [ranks setObject:[NSNumber numberWithInteger:rank] forKey:value];
    
  }
  
  NSNumber *rankFromDict = [NSNumber new];
  for (NSNumber *value in playerArray) {
    NSUInteger scorePlayer = value.integerValue;
    if (scorePlayer >=  rankedArray[0].integerValue) {
      //точно знаем что первое место
      rankFromDict = [ranks objectForKey:rankedArray[0]];
      [playerRanks addObject:rankFromDict];
      
    } else if (scorePlayer <  rankedArray[rankedArray.count - 1].integerValue) {
      //точно знаем что хуже всех
      rankFromDict = [ranks objectForKey:rankedArray[rankedArray.count - 1]];
      [playerRanks addObject:[NSNumber numberWithInteger:(rankFromDict.integerValue + 1)]];
      
    } else if (scorePlayer <  rankedArray[rankedArray.count - 1].integerValue){
      //точно знаем что место равно последнему
      rankFromDict = [ranks objectForKey:rankedArray[rankedArray.count - 1]];
      [playerRanks addObject:rankFromDict];
    } else {
      //делаем перебор
      NSNumber *prev = [NSNumber new];
      //NSNumber *result = [NSNumber new];
      for (NSNumber *score in rankedArray){
        if (scorePlayer > score.integerValue){
          if (prev) {
            //не nil, т.е не первая позиция
            rankFromDict = [ranks objectForKey:prev];
            [playerRanks addObject: [NSNumber numberWithInteger:(rankFromDict.integerValue + 1)]];
            break;
          } else {
            // т.е. первая позиция
            [playerRanks addObject: @(1)];
          }
          
        } else if (scorePlayer == score.integerValue){
          rankFromDict = [ranks objectForKey:score];
          [playerRanks addObject: rankFromDict];
          break;
        }
        prev = score;
      }
    }
  }
  
  return playerRanks;
}

@end
