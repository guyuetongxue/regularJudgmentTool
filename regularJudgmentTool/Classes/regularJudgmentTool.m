//
//  regularJudgmentTool.m
//  Pods-regularJudgmentTool_Example
//
//  Created by 胡庭 on 2019/5/31.
//

#import "regularJudgmentTool.h"

@implementation regularJudgmentTool



+ (BOOL)idCard:(NSString *)idcard
{
    
    idcard = [idcard stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([idcard length] != 18)
    {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd , @"[0-9]{3}[0-9Xx]"];
    
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:idcard])
    {
        return NO;
    }
    int summary = ([idcard substringWithRange:NSMakeRange(0,1)].intValue + [idcard substringWithRange:NSMakeRange(10,1)].intValue) *7+ ([idcard substringWithRange:NSMakeRange(1,1)].intValue + [idcard substringWithRange:NSMakeRange(11,1)].intValue) *9+ ([idcard substringWithRange:NSMakeRange(2,1)].intValue + [idcard substringWithRange:NSMakeRange(12,1)].intValue) *10+ ([idcard substringWithRange:NSMakeRange(3,1)].intValue + [idcard substringWithRange:NSMakeRange(13,1)].intValue) *5+ ([idcard substringWithRange:NSMakeRange(4,1)].intValue + [idcard substringWithRange:NSMakeRange(14,1)].intValue) *8+ ([idcard substringWithRange:NSMakeRange(5,1)].intValue + [idcard substringWithRange:NSMakeRange(15,1)].intValue) *4+ ([idcard substringWithRange:NSMakeRange(6,1)].intValue + [idcard substringWithRange:NSMakeRange(16,1)].intValue) *2+ [idcard substringWithRange:NSMakeRange(7,1)].intValue *1 + [idcard substringWithRange:NSMakeRange(8,1)].intValue *6+ [idcard substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];
    // 判断校验位
    return [checkBit isEqualToString:[[idcard substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

#pragma mark - 电话号码的验证

+ (BOOL)phoneNumber:(NSString *)mobileNum
{
    NSString *MOBILE = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}




@end
