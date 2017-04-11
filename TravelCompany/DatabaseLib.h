//
//  DatabaseLib.h
//  TravelCompany
//
//  Created by Student P_04 on 07/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DatabaseLib : NSObject
{
    sqlite3 *travelDB;
}
+(instancetype)getSharedObj;
-(void)createDtabase;
-(NSString *)getDatabasePath;
-(int)executeQuery:(NSString *)query;
-(NSArray *)getAllPicnicRecords:(NSString*)query;
-(NSArray *)getAllPriceRecords:(NSString*)query;
-(NSArray *)getAllDurationRecords:(NSString*)query;

-(NSArray *)getAllPassangerNameRecords:(NSString*)query;
-(NSArray *)getAllPassangerCnoRecords:(NSString*)query;
-(NSArray *)getAllPassangerSpotRecords:(NSString*)query;




@end
