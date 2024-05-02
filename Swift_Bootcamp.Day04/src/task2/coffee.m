#import "coffee.h"

@implementation Coffee

// реализация initWithName
- (instancetype)initWithName:(NSString *)name price:(double)price {
    self = [super init];
    if (self) {
        self.name = name;
        self.price = price;
    }
    return self;
}

@end
