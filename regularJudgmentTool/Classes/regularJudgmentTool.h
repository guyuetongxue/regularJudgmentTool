//
//  regularJudgmentTool.h
//  Pods-regularJudgmentTool_Example
//
//  Created by 胡庭 on 2019/5/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface regularJudgmentTool : NSObject

#pragma mark - 身份证验证

+ (BOOL)idCard:(NSString *)idcard;

#pragma mark - 电话号码的验证

+ (BOOL)phoneNumber:(NSString *)mobileNum;

@end

NS_ASSUME_NONNULL_END
