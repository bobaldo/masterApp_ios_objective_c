//
//  ViewController.m
//  graph
//
//  Created by Davide Patrizi on 21/12/14.
//  Copyright (c) 2014 Davide Patrizi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *txtView;
@property (weak, nonatomic) IBOutlet UITextField *txtNumeroRighe;
@property (weak, nonatomic) IBOutlet UITextField *txtNumeroValori;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog (@"Inizio");
    
    NSString *pathToFile= @"/Users/davidepatrizi/Documents/project/masterApp_ios_objective_c/graph/graph/CsvExample.csv";
    NSError *outError=nil;
    NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:&outError];
    if (!fileString) {
        NSLog(@"Error reading file.");
    }else{
        NSScanner *scanner = [NSScanner scannerWithString:fileString];
        [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"\n#; "]];
        
        int viewW = _txtView.frame.size.width;
        int viewH = _txtView.frame.size.height;
        int delta=20;
        int x= 0;
        int y=0;
        int width=10;
        int height=0;
        int indexRow=0;
        // NSMutableString* valueCols = [NSMutableString init];
        NSString *row = nil;
        NSString *cols = nil;
        NSMutableArray *itemToAdd = [NSMutableArray array];
        
        while([scanner scanUpToString:@";" intoString:&row] && [scanner scanUpToString:@"\n" intoString:&cols])
        {
            NSLog(@" %@ %@", row, cols);

            int a = (viewH / [cols intValue]);
            height = (viewH / [cols intValue]) * [cols intValue];
            indexRow = indexRow+1;
            y = viewH - height;
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            view.backgroundColor = [UIColor redColor];
            //[_txtView addSubview:view];
            [itemToAdd addObject:view];
            
            x = x + delta;
        }
        
        
        for (int i=0; i<[itemToAdd count]; i++){
            [_txtView addSubview:itemToAdd[i]];
        }
        
        _txtNumeroRighe.text = [NSString stringWithFormat: @"%d",  indexRow];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
