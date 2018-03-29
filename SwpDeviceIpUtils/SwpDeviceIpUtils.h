//
//  SwpDeviceIpUtils.h
//  swp_song
//
//  Created by swp_song on 2018/3/29.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 - SwpDeviceIpUtilsAddressType
 - SwpDeviceIpUtilsAddressIPv4:
 - SwpDeviceIpUtilsAddressIPv6:
 */
typedef NS_ENUM(NSInteger, SwpDeviceIpUtilsAddressType) {
    SwpDeviceIpUtilsAddressIPv4 = 0,
    SwpDeviceIpUtilsAddressIPv6,
    
};

@interface SwpDeviceIpUtils : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpDeviceIpUtilsValidatIpAddress:   ( 验证 Ip 地址是否正确 )
 *
 *  @param  ipAddress   ipAddress
 *
 *  @return bool
 */
+ (bool)swpDeviceIpUtilsValidatIpAddress:(NSString *)ipAddress;

/**
 *  @author swp_song
 *
 *  @brief  SwpDeviceIpUtilsValidatIpAddress    ( 验证 Ip 地址是否正确 )
 *
 *  @param  ipAddress   ipAddress
 *
 *  @return bool
 */
bool SwpDeviceIpUtilsValidatIpAddress(NSString *ipAddress);

#pragma mark - Device Local Ip Methods
/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceLocalWIFIIpAddress  ( 获取设备本地 WIFI Ip 地址 ，但是如果切换到蜂窝数据下，则返回数据 <error> )
 *
 *  @return Ip
 */
+ (NSString *)swpGetDeviceLocalWIFIIpAddress;

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceLocalWIFIIpAddress  ( 获取设备本地 WIFI Ip 地址 ，但是如果切换到蜂窝数据下，则返回数据 <error> )
 *
 *  @return Ip
 */
NSString * SwpGetDeviceLocalWIFIIpAddress(void);


/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceLocalIpAddresses    ( 获取当前设备本地 Ip 地址，集合 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpGetDeviceLocalIpAddresses;
/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceLocalIpAddresses    ( 获取当前设备本地 Ip 地址，集合 )
 *
 *  @return NSDictionary
 */
NSDictionary * SwpGetDeviceLocalIpAddresses(void);

/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceLocalIpAddress  ( 获取当前设备本地 Ip 地址 )
 *
 *  @param  addressesType   addressesType
 *
 *  @return NSString
 */
+ (NSString *)swpGetDeviceLocalIpAddress:(SwpDeviceIpUtilsAddressType)addressesType;

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceLocalIpAddress  ( 获取当前设备本地 Ip 地址 )
 *
 *  @param  addressesType   addressesType
 *
 *  @return NSString
 */
NSString * SwpGetDeviceLocalIpAddress(SwpDeviceIpUtilsAddressType addressesType);

#pragma mark - Swp Device Network Ip Methods
/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceNetworkIpAddresses  ( 获取当前设备网络 Ip 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpGetDeviceNetworkIpAddresses;

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceNetworkIpAddresses  ( 获取当前设备网络 Ip 信息 )
 *
 *  @return NSDictionary
 */
NSDictionary * SwpGetDeviceNetworkIpAddresses(void);

/**
 *  @author swp_song
 *
 *  @brief  swpGetDeviceNetworkIpAddress    ( 获取当前设备网络 Ip 地址 )
 *
 *  @return NSString
 */
+ (NSString *)swpGetDeviceNetworkIpAddress;

/**
 *  @author swp_song
 *
 *  @brief  SwpGetDeviceNetworkIpAddress    ( 获取当前设备网络 Ip 地址 )
 *
 *  @return NSString
 */
NSString * SwpGetDeviceNetworkIpAddress(void);

@end
NS_ASSUME_NONNULL_END
