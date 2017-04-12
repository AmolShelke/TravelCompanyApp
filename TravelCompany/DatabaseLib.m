//
//  DatabaseLib.m
//  TravelCompany
//
//  Created by Student P_04 on 07/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "DatabaseLib.h"

@implementation DatabaseLib
+(instancetype)getSharedObj
{
    static DatabaseLib *obj;
    if(obj==nil)
    {
        obj=[[DatabaseLib alloc]init];
    }
    return obj;
    
}
-(void)createDtabase
{
    NSString *query=@"create table if not exists travel(pic_spot text,pic_price text,pic_duration text)";
    int isSucess=[self executeQuery:query];
    if(isSucess)
    {
        
        NSLog(@"Database Created Successfully");
    }
    else
    {
        NSLog(@"Database creation failed");
    }
    
    NSString *query1=@"create table if not exists booking(passanger_name text,passanger_no text,passanger_spot text,seat_no Text)";
    isSucess=[self executeQuery:query1];
    if(isSucess)
    {
        
        NSLog(@"Table Booking Created Successfully");
    }
    else
        NSLog(@"Table Booking creation failed");
    
}
-(NSString *)getDatabasePath
{
    NSArray *dbArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) ;
    NSString *dbPath=[[dbArray firstObject]stringByAppendingString:@"travelDataBase2.db"];
    return dbPath;
}
-(int)executeQuery:(NSString *)query
{
    int sucess=0;
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(travelDB));
        }
        else
        {
            if(sqlite3_step(stmt)!=SQLITE_DONE)
            {
                NSLog(@"Error:%s",sqlite3_errmsg(travelDB));
            }
            else
            {
                sucess=1;
            }
        }
    }
    
    
    
    return sucess;
}
-(NSArray *)getAllPicnicRecords:(NSString *)query
{
    NSMutableArray *priceArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 0);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [priceArray addObject:obj];
            }
        }
    }
    return priceArray;
 
}
-(NSArray *)getAllPriceRecords:(NSString *)query
{
    NSMutableArray *priceArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 1);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [priceArray addObject:obj];
            }
        }
    }
    return priceArray;
}
-(NSArray *)getAllDurationRecords:(NSString *)query
{
    NSMutableArray *priceArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 2);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [priceArray addObject:obj];
            }
        }
    }
    return priceArray;

}

-(NSArray*)getAllPassangerNameRecords:(NSString *)query
{
    NSMutableArray *nameArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 0);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [nameArray addObject:obj];
            }
        }
    }
    return nameArray;

}
-(NSArray *)getAllPassangerCnoRecords:(NSString *)query
{
    NSMutableArray *cnoArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 1);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [cnoArray addObject:obj];
            }
        }
    }
    return cnoArray;

}
-(NSArray *)getAllPassangerSpotRecords:(NSString *)query
{
    NSMutableArray *spotArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 2);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [spotArray addObject:obj];
            }
        }
    }
    return spotArray;
}
-(NSArray *)getAllPassangerSeatRecords:(NSString *)query
{
    NSMutableArray *spotArray=[[NSMutableArray alloc]init];
    char const *cQuery=[query UTF8String];
    char const *cDBPath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDBPath, &travelDB)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(travelDB, cQuery, -1, &stmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                char const *temp=(char const *)sqlite3_column_text(stmt, 3);
                NSString *obj=[NSString stringWithFormat:@"%s",temp];
                [spotArray addObject:obj];
            }
        }
    }
    return spotArray;
    
}
@end
