#ifndef coffee_h
#define coffee_h

#import <Foundation/Foundation.h>

// класс(интерфейс) Кофе
@interface Coffee : NSObject

// свойства
@property NSString *name;
@property double price;

// методы
- (instancetype)initWithName:(NSString *)name price:(double)price;

@end

#endif /* coffee_h */
