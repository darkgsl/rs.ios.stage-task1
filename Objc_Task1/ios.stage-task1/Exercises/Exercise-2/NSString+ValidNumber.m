#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
  //проверяем граничные условия по длине
  NSInteger strLength = [self length];
  if (!(strLength > 0 && strLength <= 100)) {
    return false;
  }
  //делаем set цифр, инвертируем и проверяем
  
  NSCharacterSet *unNumberSet = [NSCharacterSet.decimalDigitCharacterSet invertedSet];
  NSRange range = [self rangeOfCharacterFromSet:unNumberSet];
  
  return range.location == NSNotFound ? true : false;
}

@end
