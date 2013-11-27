//
//  LLXViewController.m
//  CustomCellDemo
//
//  Created by 刘理想 on 13-11-27.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "LLXViewController.h"
#define FONT_SIZE 12.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@interface LLXViewController ()
@property(copy, nonatomic) NSArray *array;
@end

static NSString *CellIdentifier = @"Cell";

@implementation LLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.array = @[
              @[
               @"在路上的理想",
               @"9小时前",
               @"avatar",
               @"新华网北京11月27日电,据新华社“新华视点”微博报道，习近平给市、县委书记们念了一副对联：“得一官不荣，失一官不辱，勿道一官无用，地方全靠一官；穿百姓之衣，吃百姓之饭，莫以百姓可欺，自己也是百姓。”他说，对联以浅显的语言揭示了官民关系。封建时代官吏尚有这样的认识，今天我们共产党人应该比这个境界高得多。"
               ],
              @[
               @"在路上的理想",
               @"10小时前",
               @"avatar",
               @"平在座谈会上表示， 市委书记、县委书记担负着领班子、带队伍、抓发展、保稳定的重任，要坚定理想信念，坚守精神家园。干工作搞事业都要靠这一点，这才是“永动机”"]
              ];
    //不显示空行
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark -Tabel View Data Source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSLog(@"table View Cell Make");
    
    UIImageView *cellImage = (UIImageView*)[cell viewWithTag:1];
    cellImage.image = [UIImage imageNamed:@"avatar"];
    NSLog(@"%@", cellImage);
    
    UILabel *usernameLabel = (UILabel*)[cell viewWithTag:2];
    usernameLabel.text = self.array[indexPath.row][0];
    NSLog(@"%@", usernameLabel);
    
    UILabel *timeLabel = (UILabel*)[cell viewWithTag:3];
    timeLabel.text = self.array[indexPath.row][1];
    
    UILabel *textLabel = (UILabel*)[cell viewWithTag:4];
    textLabel.text = self.array[indexPath.row][3];
    
//    NSDictionary * attributes = [NSDictionary
//                                 dictionaryWithObject:[UIFont systemFontOfSize:FONT_SIZE]
//                                 forKey:NSFontAttributeName];
//
//    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
//    
//    CGRect rect = [textLabel.text boundingRectWithSize:constraint
//                                               options:NSStringDrawingUsesLineFragmentOrigin
//                                            attributes:attributes
//                                               context:nil];
//    CGSize size = rect.size;
//    CGPoint textLabelPoint = textLabel.frame.origin;
//    textLabel.frame = CGRectMake(textLabelPoint.x,
//                                 textLabelPoint.y,
//                                 size.width,
//                                 size.height);
//    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = self.array[indexPath.row][3];
    
    NSDictionary * attributes = [NSDictionary
                                 dictionaryWithObject:[UIFont systemFontOfSize:FONT_SIZE]
                                 forKey:NSFontAttributeName];
    CGSize constraint = CGSizeMake(280.0f, 20000.0f);
    
    CGRect rect = [text boundingRectWithSize:constraint
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    CGSize size = rect.size;
    CGFloat height = MAX(size.height, 30.0f);
    return height + 53.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
