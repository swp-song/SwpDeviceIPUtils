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
    

    
    
    NSLog(@"swpDeviceIpUtilsInfo    = %@", [SwpDeviceIpUtils swpDeviceIpUtilsInfo]);
    NSLog(@"swpDeviceIpUtilsVersion = %@", [SwpDeviceIpUtils swpDeviceIpUtilsVersion]);
   
    
    NSLog(@"SwpGetDeviceLocalWIFIIpAddress  = %@", SwpGetDeviceLocalWIFIIpAddress());
    NSLog(@"SwpGetDeviceLocalIpAddresses    = %@", SwpGetDeviceLocalIpAddresses());
    NSLog(@"SwpGetDeviceLocalIpAddress      = %@", SwpGetDeviceLocalIpAddress(SwpDeviceIpUtilsAddressIPv6));
    
    /*
     SwpGetDeviceNetworkIpAddress， SwpGetDeviceNetworkIpAddress 网络获取ip时，需要设置 App 可以使用 http 请求
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    NSLog(@"SwpGetDeviceNetworkIpAddresses  = %@", SwpGetDeviceNetworkIpAddresses());
    NSLog(@"SwpGetDeviceNetworkIpAddress    = %@", SwpGetDeviceNetworkIpAddress());
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
