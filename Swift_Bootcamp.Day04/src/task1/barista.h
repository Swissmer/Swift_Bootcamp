#ifndef barista_h
#define barista_h

#import <Foundation/Foundation.h>
#import "coffee.h"

// класс(интерфейс) Бариста
@interface Barista : NSObject

// свойства
@property NSString *firstName;
@property NSString *lastName;
@property NSInteger experience;

// методы
- (void)brew:(Coffee *)coffee;
- (instancetype)initWithName:(NSString *)firstName lastName:(NSString *)lastName experience:(NSInteger)experience;

@end

#endif /* barista_h */
