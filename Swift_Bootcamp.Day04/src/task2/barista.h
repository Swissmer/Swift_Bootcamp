#ifndef barista_h
#define barista_h

#import "coffee.h"

@protocol IBarista

@required
- (void)brewWithCoffee:(Coffee *)coffee;

@end

// класс(интерфейс) Бариста
@interface Barista : NSObject <IBarista>

// свойства
@property NSString *firstName;
@property NSString *lastName;
@property NSInteger experience;

// методы
- (void)brew:(Coffee *)coffee;
- (instancetype)initWithName:(NSString *)firstName lastName:(NSString *)lastName experience:(NSInteger)experience;

@end

#endif /* barista_h */
