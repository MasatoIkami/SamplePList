//
//  ViewController.h
//  SamplePList
//
//  Created by Masato Ikami on 2014/11/04.
//  Copyright (c) 2014年 Masato Ikami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    NSArray *_myArray;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

