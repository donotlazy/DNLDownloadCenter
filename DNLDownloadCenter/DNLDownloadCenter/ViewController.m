//
//  ViewController.m
//  DNLDownloadCenter
//
//  Created by  mshen on 16/5/18.43
//  Copyright © 2016年  mshen. All rights reserved.
//

#import "ViewController.h"
#import "AFNetWorking.h"

#define URL_2  @"http://img.enhance.cn/ielts/zip/1536.zip"
#define URL_3  @"http://img.enhance.cn/ielts/zip/1537.zip"
#define URL_4  @"http://img.enhance.cn/ielts/zip/1538.zip"
#define URL_5  @"http://img.enhance.cn/ielts/zip/1539.zip"
#define URL_6  @"http://img.enhance.cn/ielts/zip/1540.zip"
#define URL_7  @"http://img.enhance.cn/ielts/zip/1541.zip"
#define URL_8  @"http://img.enhance.cn/ielts/zip/1542.zip"
#define URL_9  @"http://img.enhance.cn/ielts/zip/1543.zip"
#define URL_10  @"http://img.enhance.cn/ielts/zip/1552.zip"
#define URL_11  @"http://img.enhance.cn/ielts/zip/1553.zip"
#define URL_12  @"http://img.enhance.cn/ielts/zip/1554.zip"
#define URL_1  @"http://img.enhance.cn/ielts/zip/1555.zip"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testDownload];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)testDownload {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:URL_1]];
    AFURLSessionManager*manager  =  [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
   NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSURL *destUrl = [documentsDirectoryURL URLByAppendingPathComponent:@"Download"];
        return destUrl;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
    }];
    [task resume];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
