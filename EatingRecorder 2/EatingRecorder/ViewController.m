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
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    NSString *currentTime = [timeFormatter stringFromDate:timeNow];
    NSString *currentDate = [dateFormatter stringFromDate:dateNow];
    NSString *timestamp = currentTime;
    NSString *date = currentDate;
    
    NSString *eatingLabel = [(UIButton *) sender currentTitle];
    
    NSString *label = [NSString stringWithFormat:@"%@,%@,%@",date, timestamp,eatingLabel];

    [_tableEntries addObject:label];
    [_myTable reloadData];
   /* for (NSString *yourVar in _tableEntries) {
        
        NSLog (@"%@", yourVar);
        
    }*/
    if (!ebuttonToggled) {
        [sender setTitle:@"Eating_Stop" forState:UIControlStateNormal];
        ebuttonToggled = YES;
    }
    else {
        [sender setTitle:@"Eating_Start" forState:UIControlStateNormal];
        ebuttonToggled = NO	;
    }
    
    /*NSString *test;
    int num = 0;
    while(_tableEntries.count != num)
    {
        test = [NSString stringWithFormat:@"%@\n",_tableEntries[num]];
        num++;
        NSLog(@"%@",test);
    }*/
}
- (IBAction)emailButton:(id)sender {
   // int num = 0;
    NSString *messageBody = @" Data: ";
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    //concats a string in csv format
    for(NSString* dataPoints in _tableEntries){
        messageBody = [messageBody stringByAppendingString:dataPoints];
        NSLog(@"Message Body 1 %@", messageBody);
        messageBody = [messageBody stringByAppendingString:@"\n"];
        //NSLog(@"Loop: %@", dataPoints);
        NSLog(@"Message Body 2 %@", messageBody);
    }
    //    while(_tableEntries.count != num)
//    {
//        messageBody = [NSString stringWithFormat:@"%@\n",_tableEntries[num]];
//        num++;
//    }
    NSLog(@"%@", messageBody);
    [mc setSubject:@"Eating Recorder Data"];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:@[@"wsuresearcher@gmail.com"]];
    [self presentViewController:mc animated:YES completion:NULL];
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)drinkingPressed:(id)sender {
    NSDate *timeNow = [NSDate date];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"HH:mm:ss a"];
    
    // Gets the current date and formats it
    NSDate *dateNow = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    NSString *currentTime = [timeFormatter stringFromDate:timeNow];
    NSString *currentDate = [dateFormatter stringFromDate:dateNow];
    NSString *timestamp = currentTime;
    NSString *date = currentDate;
    
    NSString *eatingLabel = [(UIButton *) sender currentTitle];
    
    NSString *label = [NSString stringWithFormat:@"%@, %@, %@",date, timestamp,eatingLabel];
    [_tableEntries addObject:label];
    [_myTable reloadData];
    
    if (!dbuttonToggled) {
        [sender setTitle:@"Drinking_Stop" forState:UIControlStateNormal];
        dbuttonToggled = YES;
    }
    else {
        [sender setTitle:@"Drinking_Start" forState:UIControlStateNormal];
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
