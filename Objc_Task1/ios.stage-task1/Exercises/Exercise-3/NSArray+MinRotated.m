#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    
    if (self.count == 0) {
        return  nil;
    }
    
    NSUInteger low = 0;
    NSUInteger high = self.count - 1;
    NSUInteger medium = (low + high) / 2;
    bool isFinish = false;
    
    NSUInteger resultIndex = 0;
    NSInteger valueMediumIndex;
    NSInteger valueLowIndex;
    NSInteger valueHighIndex;
    
    while (isFinish != true) {
        valueMediumIndex = [[self objectAtIndex:medium] integerValue];
        valueLowIndex = [[self objectAtIndex:low] integerValue];
        valueHighIndex = [[self objectAtIndex:high] integerValue];

        if (low == medium || high == medium) {
            resultIndex =  valueLowIndex < valueHighIndex ? low : high;
            return self[resultIndex];
        }
        
        if (valueMediumIndex < valueHighIndex) {
            high = medium;
        } else if (valueMediumIndex > valueHighIndex) {
            low = medium;
        } else {
            resultIndex = medium;
            isFinish = true;
        }
        medium = (low + high) / 2;
    }
    return self[resultIndex];
}

@end
