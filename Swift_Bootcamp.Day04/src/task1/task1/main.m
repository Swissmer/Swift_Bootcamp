#import <Foundation/Foundation.h>

#import "barista.h"
#import "coffee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Coffee *cappuccino = [[Coffee alloc] initWithName:@"Cappuccino" price:2.0];
        Coffee *americano = [[Coffee alloc] initWithName:@"Americano" price:1.5];
        Coffee *latte = [[Coffee alloc] initWithName:@"Latte" price:2.3];
        
        NSLog(@"Choose coffee in menu:");
        NSLog(@"1. %@ %.1f$", cappuccino.name, cappuccino.price);
        NSLog(@"2. %@ %.1f$", americano.name, americano.price);
        NSLog(@"3. %@ %.1f$", latte.name, latte.price);
        
        // чтение
        char input[255] = "\0";
        Barista *barista = [[Barista alloc] initWithName:@"swissmer" lastName:@"s21" experience:3];
        
        do {
            fgets(input, sizeof(input), stdin);
            if (strlen(input) > 0 && input[strlen(input) - 1] == '\n') {
                input[strlen(input) - 1] = '\0';
            }
            if (strcmp(input, "1") == 0) {
                [barista brew:cappuccino];
                break;
            } else if (strcmp(input, "2") == 0) {
                [barista brew:americano];
                break;
            } else if (strcmp(input, "3") == 0) {
                [barista brew:latte];
                break;
            } else {
                NSLog(@"Try again!");
            }
        } while (true);
    }
    return 0;
}
