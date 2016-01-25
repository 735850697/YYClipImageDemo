//
//  ViewController.m
//  YYClipImageDemo
//
//  Created by Arvin on 15/12/22.
//  Copyright © 2015年 Arvin. All rights reserved.
//

#import "ViewController.h"
#import "YYClipImageTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"Default_image"];
    [YYClipImageTool addToCurrentView:self.view clipImage:image backgroundImage:@"bgImage"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
