//
//  StringHelper.h
//  ErpApp
//
//  Created by Eric on 14-1-9.
//
//

#import <Foundation/Foundation.h>
#import "DepartmentModel.h"
@interface StringHelper : NSObject
//判断字符串是否为空
+(BOOL) isBlankString:(NSString *)string;

//md5 16位加密 （大写）
+(NSString *)md5:(NSString *)string;
//隐藏uitableview多余的cell
+(void)setExtraCellLineHidden: (UITableView *)tableView;
//判断是否存在默认店铺
+(DepartmentModel *)validateExistShop:(id)viewController;

//处理空字符串
+(NSString *)doEmptyString:(NSString*)str;
//日期格式化
+(NSString*)DateFromater:(NSDate*)current strDateFromater:(NSString *)str;

+(void)setViewBackImage:(UIView*)view
                    img:(NSString *)img;
@end
