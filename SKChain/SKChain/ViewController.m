//
//  ViewController.m
//  SKChain
//
//  Created by 杨丰林 on 2017/8/23.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "ViewController.h"
#import "SAMKeychain.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (IBAction)writeAction:(UIButton *)sender {
    //保存一个UUID字符串到钥匙串：
    
    NSString * deviceUUIDStr = [SAMKeychain passwordForService:@" "account:@"uuid"];
    if (deviceUUIDStr == nil || [deviceUUIDStr isEqualToString:@""])
    {
        NSUUID *deviceUUID = [UIDevice currentDevice].identifierForVendor;
        deviceUUIDStr = deviceUUID.UUIDString;
        [SAMKeychain setPassword: deviceUUIDStr forService:@" "account:@"uuid"];
        
        
        self.contentLabel.text = [NSString stringWithFormat:@"写入UUID：%@",deviceUUIDStr];
    }else{
        self.contentLabel.text = [NSString stringWithFormat:@"已经写入UUID：%@",deviceUUIDStr];
    }
}

- (IBAction)readFromKeychain:(UIButton *)sender {
    NSString *UUIDStr = [self getDeviceId];
    self.contentLabel.text = [NSString stringWithFormat:@"拿到的UUID：%@",UUIDStr];
}

-(NSString *)getDeviceId
{
    NSString * deviceUUIDStr = [SAMKeychain passwordForService:@" "account:@"uuid"];
    if (deviceUUIDStr == nil || [deviceUUIDStr isEqualToString:@""])
    {
        NSUUID * deviceUUID  = [UIDevice currentDevice].identifierForVendor;
        deviceUUIDStr = deviceUUID.UUIDString;
        [SAMKeychain setPassword: deviceUUIDStr forService:@" "account:@"uuid"];
    }
    return deviceUUIDStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
