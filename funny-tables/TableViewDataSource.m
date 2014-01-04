//
//  TableViewDataSource.m
//  funny-tables
//
//  Created by Niels Gabel on 1/1/14.
//  Copyright (c) 2014 Niels Gabel. All rights reserved.
//

#import "TableViewDataSource.h"

@interface Cell : UITableViewCell
@property ( nonatomic, strong ) id value ;
@end

@implementation Cell

+(NSString*)reuseIdentifier
{
	return NSStringFromClass( self ) ;
}

+(instancetype)cell
{
	return [[[ self class ] alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ self reuseIdentifier ] ] ;
}

-(void)setValue:(id)value
{
	_value = value ;
	self.textLabel.text = value ;
}

@end

#pragma mark -

@interface TableViewDataSource ()
@property ( nonatomic, readonly ) NSArray * data ;
@end

@implementation TableViewDataSource
@synthesize data = _data ;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	assert( section == 0 ) ;
	return self.data.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	assert( indexPath.section == 0 ) ;
	
	Cell * cell = [ tableView dequeueReusableCellWithIdentifier:[ Cell reuseIdentifier ]] ;
	if (!cell)
	{
		cell = [ Cell cell ] ;
	}
	cell.value = self.data[ indexPath.row ] ;
	return cell ;
}

-(NSArray *)data
{
	if ( !_data )
	{
		NSURL * url = [[ NSBundle mainBundle ] URLForResource:@"data" withExtension:@"json" ] ;
		NSData * data = [ NSData dataWithContentsOfURL:url ] ;
		NSError * error = nil ;
		_data = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&error ] ;
		assert( [ _data isKindOfClass:[ NSArray class ] ] ) ;
	}
	return _data ;
}

@end
