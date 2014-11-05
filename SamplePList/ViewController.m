//
//  ViewController.m
//  SamplePList
//
//  Created by Masato Ikami on 2014/11/04.
//  Copyright (c) 2014年 Masato Ikami. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    
    // 読み込むプロバティリストのファイルパス(場所)を指定
    NSString *path = [bundle pathForResource:@"FriendsParArea" ofType:@"plist"];
    
    // プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    // 取得できた配列のデータをメンバ変数に代入
    _myArray = [dic objectForKey:@"PrefectureList"];
    // _myArray = @[@"北海道",@"青森県",@"岩手県"];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    }
    
    NSDictionary *FriendsWithArea = _myArray[indexPath.row];
    
    cell.textLabel.text = [FriendsWithArea objectForKey:@"Name"];
    return cell;
}

// セルがタップされたときに発動するメソッド
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 画面遷移するViewControllerのカプセル化(インスタンス化) ここで赤字のDetailViewControllerはstoryboard上の名前
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    // 選択された地域の情報をDetailViewControllerに渡す
    dvc.friendsList = _myArray[indexPath.row];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
