#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
  
  if (self.count != 0) {
    NSArray *sortedArray = [self sortedArrayUsingSelector:@selector(compare:)];
    return sortedArray[0];
    
  } else {
    return nil;
  }
}

@end
