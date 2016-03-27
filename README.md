#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *p = [[Person alloc]initWithAge:10];
//        [Person test];
////        NSArray *arr1 = [NSArray arrayWithObjects:@"rock",@"land" nil];
//        
//        NSLog(@"%@", [p performSelector:@selector(height)]);
         Person *p1 = [Person new];
        NSLog(@"%@",p1);
//        p1 = NULL;
        Person *p2 = [Person new];
        NSLog(@"%@",p2);
//        p1 = p2;
        p2.age = 88;
        NSLog(@"%d",p2.age);
        
    }
//    NSLog(@"%d",p1.age);
    return 0;
}
