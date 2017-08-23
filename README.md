# DeviceUUID
通过三方框架SAMKeychain，用IDFV配合keychain来做设备的唯一标识

注意点：
1.通过测试, 同一项目存储的UUID是达到效果的，只需要生成一次就OK，即使卸载项目UUID，也不需要再存储一次，会从chains文件中去拿，但是更换bundle Identifier
UUID会改变
