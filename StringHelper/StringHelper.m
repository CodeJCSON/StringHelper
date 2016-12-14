//
//  StringHelper.m
//  ErpApp
//
//  Created by Eric on 14-1-9.
//
//

#import "StringHelper.h"
#import <CommonCrypto/CommonDigest.h>
@implementation StringHelper
//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


//md5 16位加密 （大写）
+(NSString *)md5:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    
}
+(void)setViewBackImage:(UIView*)view
                    img:(NSString *)img
{
    [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",img]]]];
}
+(DepartmentModel*)validateExistShop:(id)viewController
{
    //DepartmentModel *departmentModel=[[DepartmentModel alloc] init];
    DepartmentModel *departmentModel=[[[DepartmentModel alloc] init] GetByUserID];
    if ([StringHelper isBlankString:departmentModel.modelID])
    {
        [viewController dismissViewControllerAnimated:NO completion:nil];
    }
    return departmentModel;
}
//处理空字符串
+(NSString *)doEmptyString:(NSString*)str
{
   
    if ([self isBlankString:str] || [str isEqualToString:@"<null>"]) {
        return @"暂无";
    }
    return str;
}
+(NSString*)DateFromater:(NSDate*)current strDateFromater:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:str];
    //用[NSDate date]可以获取系统当前时间
    return  [dateFormatter stringFromDate:current];

}
@end
