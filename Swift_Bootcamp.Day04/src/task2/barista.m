#import "barista.h"

@implementation Barista

// реализация метода brew
- (void)brew:(Coffee *)coffee {
    NSLog(@"Processing brewing coffee...");
    NSLog(@"Your %@ is ready!", coffee.name);
}

// реализация инициализатора
- (instancetype)initWithName:(NSString *)firstName lastName:(NSString *)lastName experience:(NSInteger)experience {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.experience = experience;
    }
    return self;
}

@end
