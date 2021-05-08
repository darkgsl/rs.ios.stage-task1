#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
  //если nil то выход
  if (!number) {
    return  @[];
  }
  
  NSString *input;
  //а можно было чз hasPrefix
  if (number.integerValue < 0) {
    input = [number.stringValue substringFromIndex:1];
  } else {
    input = number.stringValue;
  }
  
  NSMutableArray *result = [NSMutableArray new];
  
  for (NSUInteger i = 0; i < [input length]; i += 1) {
    NSRange range = NSMakeRange(i, 1);
    NSString *str = [input substringWithRange:range];
    //еще вариант
    //[result addObject: [NSString stringWithFormat:@"%c", [input characterAtIndex:i]]];
    [result insertObject:str atIndex:0];
    
  }
  return result;
  //2-й вариант конвертим в аррай и реверсе
}

@end
