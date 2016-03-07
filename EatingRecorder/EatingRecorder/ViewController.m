//
//  ViewController.m
//  EatingRecorder
//
//  Created by GUEST on 2/29/16.
//  Copyright © 2016 Edward Kuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray* tableEntries;
@end

@implementation ViewController
static bool ebuttonToggled =  NO;
static bool dbuttonToggled =  NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_tableEntries == nil)
    {
        _tableEntries = [[NSMutableArray alloc] init];
        [_tableEntries addObject:@"TEST"];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableEntries count];
}

-(UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.textLabel.text = [_tableEntries objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)eatingPressed:(id)sender {
    
    NSDate *timeNow = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm:ss a"];
    
    // Gets the current date and formats it
    NSDate *dateNow = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy"];
    
    NSString *currentTime = [timeFormatter stringFromDate:timeNow];
    NSString *currentDate = [dateFormatter stringFromDate:dateNow];
    NSString *timestamp = currentTime;
    NSString *date = currentDate;
    
    NSString *eatingLabel = [(UIButton *) sender currentTitle];
    
    NSString *label = [NSString stringWithFormat:@"%@ %@ %@",date, timestamp,eatingLabel];

    [_tableEntries addObject:label];
    [_myTable reloadData];
    for (NSString *yourVar in _tableEntries) {
        
        NSLog (@"%@", yourVar);
        
    }
    if (!ebuttonToggled) {
        [sender setTitle:@"Eating Stop" forState:UIControlStateNormal];
        ebuttonToggled = YES;
    }
    else {
        [sender setTitle:@"Eating Start" forState:UIControlStateNormal];
        ebuttonToggled = NO;
    }
    
}

- (IBAction)drinkingPressed:(id)sender {
    NSDate *timeNow = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm:ss a"];
    
    // Gets the current date and formats it
    NSDate *dateNow = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy"];
    
    NSString *currentTime = [timeFormatter stringFromDate:timeNow];
    NSString *currentDate = [dateFormatter stringFromDate:dateNow];
    NSString *timestamp = currentTime;
    NSString *date = currentDate;
    
    NSString *eatingLabel = [(UIButton *) sender currentTitle];
    
    NSString *label = [NSString stringWithFormat:@"%@ %@ %@",date, timestamp,eatingLabel];
    [_tableEntries addObject:label];
    [_myTable reloadData];
    
    if (!dbuttonToggled) {
        [sender setTitle:@"Drinking Stop" forState:UIControlStateNormal];
        dbuttonToggled = YES;
    }
    else {
        [sender setTitle:@"Drinking Start" forState:UIControlStateNormal];
        dbuttonToggled = NO;
    }
    for (NSString *yourVar in _tableEntries) {
        
        NSLog (@"%@", yourVar);
        
    }	
}

-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_tableEntries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



@end
