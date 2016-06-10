//
//  ViewController.m
//  Difference
//
//  Created by Nicolas Lourenco on 20/01/16.
//  Copyright © 2016 Nicolas Lourenco. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Difference.h"
#import "Object.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Object* object1 = [[Object alloc] init];
    object1.number = @1;
    object1.string = @"string";
    
    Object* object2 = [[Object alloc] init];
    object2.number = @2;
    object2.string = @"string2";
    
    [object1 difference:object2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
