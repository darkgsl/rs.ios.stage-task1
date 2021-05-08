//
//  OddNumbers.m
//  ios.stage-task1
//
//  Created by Alex Tsybulko on 4.05.21.
//

#import <Foundation/Foundation.h>
#import "OddNumbers.h"

@implementation OddNumbers

- (NSInteger)oddNumbers:(NSArray <NSNumber *> *)array {
  
  NSInteger numberOdd = 0;
  
  for (NSNumber *value in array) {
    
    NSInteger valueNSInteger = value.integerValue;
    
    if (valueNSInteger % 2 != 0) {
      numberOdd += 1;
    }
  }
  
  return numberOdd;
}

@end
