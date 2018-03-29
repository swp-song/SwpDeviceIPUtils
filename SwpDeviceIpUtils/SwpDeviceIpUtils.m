//
//  SwpDeviceIpUtils.m
//  swp_song
//
//  Created by swp_song on 2018/3/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpDeviceIpUtils.h"

/* ---------------------- Tool       ---------------------- */
#import <net/if.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/utsname.h>
/* ---------------------- Tool       ---------------------- */

#define swp_device_utils_inline __inline__ __attribute__((always_inline))

#define SWP_DEVICE_UTILS_CELLULAR   @"pdp_ip0"
#define SWP_DEVICE_UTILS_WIFI       @"en0"
#define SWP_DEVICE_UTILS_VPN        @"utun0"
#define SWP_DEVICE_UTILS_IPV4       @"ipv4"
#define SWP_DEVICE_UTILS_IPV6       @"ipv6"

@implementation SwpDeviceIpUtils

/**
 *  @author swp_song
 *
 *  @brief  swpDeviceIpUtilsValidatIpAddress:   ( 验证 Ip 地址是否正确 )
 *
 *  @param  ipAddress   ipAddress
 *
 *  @return bool
 */
+ (bool)swpDeviceIpUtilsValidatIpAddress:(NSString *)ipAddress {
    return SwpDeviceIpUtilsValidatIpAddress(ipAddress);
}


/**
 *  @author swp_song
 *
 *  @brief  SwpDeviceIpUtilsValidatIpAddress    ( 验证 Ip 地址是否正确 )
 *
 *  @param  ipAddress   ipAddress
 *
 *  @return bool
 */
bool SwpDeviceIpUtilsValidatIpAddress(NSString *ipAddress) {
    return _ValidatIpAddress(ipAddress, NO);
}

#pragma mark - Device Local Ip Methods
/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceLocalWIFIIpAddress  ( 获取设备本地 WIFI Ip 地址 ，但是如果切换到蜂窝数据下，则返回数据 <error> )
 *
 *  @return Ip
 */
+ (NSString *)swpGetDeviceLocalWIFIIpAddress {
    return SwpGetDeviceLocalWIFIIpAddress();
}

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceLocalWIFIIpAddress  ( 获取设备本地 WIFI Ip 地址 ，但是如果切换到蜂窝数据下，则返回数据 <error> )
 *
 *  @return Ip
 */
NSString * SwpGetDeviceLocalWIFIIpAddress() {
    return _GetDeviceLocalWIFIIpAddress();
}


/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceLocalIpAddresses    ( 获取当前设备本地 Ip 地址，集合 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpGetDeviceLocalIpAddresses {
    return SwpGetDeviceLocalIpAddresses();
}

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceLocalIpAddresses    ( 获取当前设备本地 Ip 地址，集合 )
 *
 *  @return NSDictionary
 */
NSDictionary * SwpGetDeviceLocalIpAddresses() {
    return _GetDevicepLocalAddresses();
}


/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceLocalIpAddress  ( 获取当前设备本地 Ip 地址 )
 *
 *  @param  addressesType   addressesType
 *
 *  @return NSString
 */
+ (NSString *)swpGetDeviceLocalIpAddress:(SwpDeviceIpUtilsAddressType)addressesType {
    return SwpGetDeviceLocalIpAddress(addressesType);
}


/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceLocalIpAddress  ( 获取当前设备本地 Ip 地址 )
 *
 *  @param  addressesType   addressesType
 *
 *  @return NSString
 */
NSString * SwpGetDeviceLocalIpAddress(SwpDeviceIpUtilsAddressType addressesType) {
    return _GetDevicepLocalAddress(addressesType);
}


#pragma mark - Swp Device Network Ip Methods

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceNetworkIpAddresses  ( 获取当前设备网络 Ip 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpGetDeviceNetworkIpAddresses {
    return SwpGetDeviceNetworkIpAddresses();
}

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceNetworkIpAddresses  ( 获取当前设备网络 Ip 信息 )
 *
 *  @return NSDictionary
 */
NSDictionary * SwpGetDeviceNetworkIpAddresses() {
    return _GetDevicepNetworkAddresses();
}

/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceNetworkIpAddress    ( 获取当前设备网络 Ip 地址 )
 *
 *  @return NSString
 */
+ (NSString *)swpGetDeviceNetworkIpAddress {
    return SwpGetDeviceNetworkIpAddress();
}


/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceNetworkIpAddress    ( 获取当前设备网络 Ip 地址 )
 *
 *  @return NSString
 */
NSString * SwpGetDeviceNetworkIpAddress() {
    return _GetDevicepNetworkAddress();
}



#pragma mark - Private Local Ip Methods
/**
 *  @author swp_song
 *
 *  @brief  _ValidatIpAddress    ( 验证 Ip 地址是否正确 )
 *
 *  @param  ipAddress   ipAddress
 *
 *  @param  isLog       isLog
 *
 *  @return bool
 */
static swp_device_utils_inline bool _ValidatIpAddress(NSString *ipAddress, bool isLog) {
    
    if (!ipAddress.length) return false;
    
    NSString *urlRegularString = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.""([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.""([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.""([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:urlRegularString options:0 error:&error];
    
    if (regular != nil) {
        NSTextCheckingResult *firstMatch = [regular firstMatchInString:ipAddress options:0 range:NSMakeRange(0, ipAddress.length)];
        if (firstMatch) {
            
            if (isLog) {
                NSRange  resultRange = [firstMatch rangeAtIndex:0];
                NSString *result     = [ipAddress substringWithRange:resultRange];
                NSLog(@"result = %@", result);
            }
            
            return true;
        }
    }
    return false;
}


/**
 *  @author swp_song
 *
 *  @brief  _GetDeviceLocalWIFIIpAddress    ( 获取设备本地 WIFI Ip 地址 ，但是如果切换到蜂窝数据下，则返回数据 <error> )
 *
 *  @return Ip
 */
static swp_device_utils_inline NSString * _GetDeviceLocalWIFIIpAddress() {
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr  = NULL;
    int            success     = 0;
    NSString       *address    = @"error";
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}


/**
 *  @author swp_song
 *
 *  @brief  _GetDevicepLocalAddresses   ( 获取当前设备本地 Ip 地址，集合 )
 *
 *  @return NSDictionary
 */
static swp_device_utils_inline NSDictionary * _GetDevicepLocalAddresses() {
    
    NSMutableDictionary *addresses = NSMutableDictionary.dictionary;
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = SWP_DEVICE_UTILS_IPV4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = SWP_DEVICE_UTILS_IPV6;
                    }
                }
                if(type) {
                    NSString *key   = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key]  = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    
    return addresses.count ? addresses.copy : nil;
}

/**
 *  @author swp_song
 *
 *  @brief  _GetDevicepAddress  ( 获取当前设备本地 Ip 地址 )
 *
 *  @param  addressType addressType
 *
 *  @return NSString
 */
static swp_device_utils_inline NSString * _GetDevicepLocalAddress(SwpDeviceIpUtilsAddressType addressType) {
    
    NSArray *ipv4s = @[
                       SWP_DEVICE_UTILS_VPN      @"/" SWP_DEVICE_UTILS_IPV4,
                       SWP_DEVICE_UTILS_VPN      @"/" SWP_DEVICE_UTILS_IPV6,
                       SWP_DEVICE_UTILS_WIFI     @"/" SWP_DEVICE_UTILS_IPV4,
                       SWP_DEVICE_UTILS_WIFI     @"/" SWP_DEVICE_UTILS_IPV6,
                       SWP_DEVICE_UTILS_CELLULAR @"/" SWP_DEVICE_UTILS_IPV4,
                       SWP_DEVICE_UTILS_CELLULAR @"/" SWP_DEVICE_UTILS_IPV6
                       ];
    NSArray *ipv6s =  @[
                        SWP_DEVICE_UTILS_VPN      @"/" SWP_DEVICE_UTILS_IPV6,
                        SWP_DEVICE_UTILS_VPN      @"/" SWP_DEVICE_UTILS_IPV4,
                        SWP_DEVICE_UTILS_WIFI     @"/" SWP_DEVICE_UTILS_IPV6,
                        SWP_DEVICE_UTILS_WIFI     @"/" SWP_DEVICE_UTILS_IPV4,
                        SWP_DEVICE_UTILS_CELLULAR @"/" SWP_DEVICE_UTILS_IPV6,
                        SWP_DEVICE_UTILS_CELLULAR @"/" SWP_DEVICE_UTILS_IPV4
                        ];
    
    NSArray      *searchs   = addressType ? ipv6s : ipv4s;
    NSDictionary *addresses = SwpGetDeviceLocalIpAddresses();
    __block NSString *address;
    [searchs enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        address = addresses[key];
        if(SwpDeviceIpUtilsValidatIpAddress(address)) *stop = YES;
    }];
    
    return address;
}

#pragma mark - Private Network Ip Methods
/**
 *  @author swp_song
 *
 *  @brief  _GetDevicepNetworkAddresses ( 获取当前设备的 Ip 信息 )
 *
 *  @return NSDictionary
 */
static swp_device_utils_inline NSDictionary * _GetDevicepNetworkAddresses() {
    NSURL  *IPURL = [NSURL URLWithString:@"http://ip.taobao.com/service/getIpInfo.php?ip=myip"];
    NSData *data  = [NSData dataWithContentsOfURL:IPURL];
    if (!data) return nil;
    NSDictionary *addresses = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (addresses && [addresses[@"code"] integerValue] == 0) return addresses[@"data"];
    return nil;
}

/**
 *  @author swp_song
 *
 *  @brief  _GetDevicepNetworkAddress ( 获取当前设备的 Ip 地址 )
 *
 *  @return NSDictionary
 */
static swp_device_utils_inline NSString * _GetDevicepNetworkAddress() {
    NSString *ip = _GetDevicepNetworkAddresses()[@"ip"];
    return ip.length ? ip :  @"0.0.0.0";
}






@end
