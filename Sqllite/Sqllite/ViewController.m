//
//  ViewController.m
//  Sqllite
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize name,address,phone,status;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSString *docsDir;
    docsDir=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    databasePath=[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"contacs.sqlite"]];













}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) prepareStatement
{
    NSString *sqlString;
    const char *sql_stmt;
    
    
    //Insert
    sqlString=[NSString stringWithFormat:@"Insert into contacts (name,address,phone) values(?,?,?)"];
    sql_stmt=[sqlString UTF8String];
    
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &insertStatement, NULL);
    
    
    //Update
    
    sqlString=[NSString stringWithFormat:@"Update contacts set address=? phone=? where name=?"];
    sql_stmt=[sqlString UTF8String];
    
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &updateStatement, NULL);

    //Delete
    sqlString=[NSString stringWithFormat:@"Delete from contacts where name=?"];
    sql_stmt=[sqlString UTF8String];
    
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &deleteStatement, NULL);

    //Select
    sqlString=[NSString stringWithFormat:@"Select address,phone from contacs where name=?"];
    sql_stmt=[sqlString UTF8String];
    
    sqlite3_prepare_v2(contactDB, sql_stmt, -1, &selectStatement, NULL);

}

-(void) createContact
{
    sqlite3_bind_text(insertStatement, 1, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertStatement, 2, [address.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertStatement, 3, [phone.text UTF8String], -1, SQLITE_TRANSIENT);
    
    
    if(sqlite3_step(insertStatement)==SQLITE_DONE)
    {
        status.text=@"Contact added";
        name.text=@"";
        address.text=@"";
        phone.text=@"";
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to add contact";
        
    }
    sqlite3_reset(insertStatement);
    sqlite3_clear_bindings(insertStatement);
}




-(void) updateContact{
    
    sqlite3_bind_text(updateStatement, 1, [address.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updateStatement, 2, [phone.text UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(updateStatement, 2, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    
    if(sqlite3_step(updateStatement)==SQLITE_DONE)
    {
        status.text=@"Contact updated";
        name.text=@"";
        address.text=@"";
        phone.text=@"";
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to update contact";
        
    }
    sqlite3_reset(updateStatement);
    sqlite3_clear_bindings(updateStatement);
}

-(void) deleteContact{
    
    sqlite3_bind_text(deleteStatement, 1, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    
    
    if(sqlite3_step(updateStatement)==SQLITE_DONE)
    {
        status.text=@"Contact deleted";
        name.text=@"";
        address.text=@"";
        phone.text=@"";
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
        status.text=@"Failed to delete contact";
        
    }
    sqlite3_reset(deleteStatement);
    sqlite3_clear_bindings(deleteStatement);
}
-(void) findContact{
    
    sqlite3_bind_text(selectStatement, 1, [name.text UTF8String], -1, SQLITE_TRANSIENT);
    
    
    if(sqlite3_step(selectStatement)==SQLITE_ROW)
    {
        NSString *addressField=[[NSString alloc]initWithUTF8String:<#(const char *)#>sqlite3_column_text(selectStatement, 0)];
        address.text=addressField;
        
        NSString *phoneField=[[NSString alloc]initWithUTF8String:<#(const char *)#>sqlite3_column_text(selectStatement, 1)];
        phone.text=phoneField;
        status.text=@"Match found";
       
    }
    else{
        NSLog(@"%s",sqlite3_errmsg(contactDB));
       status.text=@"Match not found";
        address.text=@"";
        phone.text=@"";
    }
    sqlite3_reset(selectStatement);
    sqlite3_clear_bindings(selectStatement);
}



@end
