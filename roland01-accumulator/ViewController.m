//
//  ViewController.m
//  roland01-accumulator
//
//  Created by roland on 16/3/25.
//  Copyright © 2016年 roland. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//属性的连接线
@property (weak, nonatomic) IBOutlet UITextField *numField1;
@property (weak,nonatomic) IBOutlet UITextField *numField2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)doCalculate:(id)sender{
//    NSLog(@"i wanna do adding");
//    
//}
- (IBAction)doCalculate2:(id)sender {
    NSLog(@"i wanna do adding 2");
    NSString *str1 = self.numField1.text;
    NSString *str2 = self.numField2.text;
    self.resultLabel.text = [str1 stringByAppendingString:str2];
    [self.numField1 resignFirstResponder];
    [self.view endEditing:YES];
    self.view.subviews = 
    
    
    
    
    
    
}

@end
