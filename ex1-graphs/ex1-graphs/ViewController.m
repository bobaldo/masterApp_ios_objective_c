//
//  ViewController.m
//  ex1-graphs
//
//  Created by System Administrator on 12/13/14.
//  Copyright (c) 2014 graphs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtNumRighe;
@property (strong, nonatomic) IBOutlet UITextField *txtNumValori;
@property (strong, nonatomic) IBOutlet UIView *txtView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog (@"Inizio");
    
    NSString *pathToFile= @"/Users/davidepatrizi/Documents/project/masterApp_ios_objective_c/ex1-graphs/CsvExample.csv";
    NSError *outError=nil;
    
    NSString *fileString = [NSString stringWithContentsOfFile:pathToFile encoding:NSUTF8StringEncoding error:&outError];
    if (!fileString) {
        NSLog(@"Error reading file.");
    }
    NSScanner *scanner = [NSScanner scannerWithString:fileString];
   [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"\n#; "]];
    
    int viewH =_txtView.frame.size.height;
    int delta=20;
    int x= 0;
    int y=0;
    int width=10;
    int height=0;
    int indexRow=0;
    NSMutableString* valueCols = [NSMutableString init];
    NSString *row=nil;
    NSString *cols=nil;
    while([scanner scanUpToString:@";" intoString:&row] && [scanner scanUpToString:@"\n" intoString:&cols])
    {
        height =[ cols intValue] * width;
        indexRow=indexRow+1;
        NSLog(@" %@ %@", row, cols);
        y = viewH-height;
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        view1.backgroundColor = [UIColor redColor];
        [_txtView addSubview:view1];
        x=x+delta;
        
    }
    
    _txtNumRighe.text = [NSString stringWithFormat: @"%d",  indexRow];
    
//    CGRect rect =	CGRectMake(0, 0, 1, 10);
//    
//    _txtView.layer.
//    
//    CGContextRef context = _txtView.UIGraphicsGetCurrentContext();
//    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
//    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
//    CGContextFillRect(context, rect);
    
     

    
    NSLog(@"Fine");
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
