//
//  ViewController.m
//  SwpDeviceIpUtilsDemo
//
//  Created by swp_song on 2018/3/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import <SwpDeviceIpUtils/SwpDeviceIpUtils.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", SwpGetDeviceLocalWIFIIpAddress());
    NSLog(@"%@", SwpGetDeviceLocalIpAddresses());
    NSLog(@"%@", SwpGetDeviceLocalIpAddress(SwpDeviceIpUtilsAddressIPv6));
    NSLog(@"%@", SwpGetDeviceNetworkIpAddresses());
    NSLog(@"%@", SwpGetDeviceNetworkIpAddress());
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
