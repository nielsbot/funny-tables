//
//  ViewController.m
//  funny-tables
//
//  Created by Niels Gabel on 1/1/14.
//  Copyright (c) 2014 Niels Gabel. All rights reserved.
//

#import "ViewController.h"

@class TableViewDataSource ;

@interface ViewController ()<UITableViewDelegate, UIScrollViewDelegate>
@property ( nonatomic, strong ) IBOutlet TableViewDataSource * tableViewDataSource ;
@property ( nonatomic, strong ) IBOutlet UITableView * topTableView ;
@property ( nonatomic, strong ) IBOutlet UITableView * centerTableView ;
@property ( nonatomic, strong ) IBOutlet UITableView * bottomTableView ;
@end

@implementation ViewController

-(void)viewDidLoad
{
	[ super viewDidLoad] ;
//	self.centerTableView.backgroundColor = [ UIColor blackColor ] ;
	self.centerTableView.layer.shadowOpacity = 0.3 ;
//	self.centerTableView.layer.zPosition = -1.0 ;
//	self.centerTableView.layer.shadowOffset = (CGSize){ 0 } ;
//	{
//		CGPathRef path = CGPathCreateWithRect( self.centerTableView.layer.bounds, NULL ) ;
//		self.centerTableView.layer.shadowPath = path ;
//		CGPathRelease( path ) ;
//	}
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if ( scrollView == self.topTableView )
	{
		self.bottomTableView.contentOffset = ({
			CGPoint p = scrollView.contentOffset ;
			p.y += 44.0 * 5.0 ;
			p ;
		}) ;
	}
	else if ( scrollView == self.bottomTableView )
	{
		self.topTableView.contentOffset = ({
			CGPoint p = scrollView.contentOffset ;
			p.y -= 44.0 * 5.0 ;
			p ;
		}) ;
		
	}
}

@end
