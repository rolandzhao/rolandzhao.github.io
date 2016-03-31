#import "viewController.h"
@interface ViewController()
@property (nonatomic)int index;
@property (weak,nonatomic)UILabel *indexLabel;
@property (weak,nonatomic)UILabel *descLabel;
@property (weak,nonatomic)UIButton *nextButton;
@property (weak,nonatomic)UIButton *previousButton;
@property (weak,nonatomic)UIImageView *iconImage;
@property (strong,nonatomic)NSArray *imageArray;
@end


@implementation ViewController

//get方法直接返回创建的数组
- (NSArray*)imageArray{
   NSString *path = [[NSBundle mainBundle]pathForResource:@"image" ofType:@"plist"];
    self.imageArray = [NSArray arrayWithContentsOfFile:path];
    return _imageArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建字典
    NSDictionary *dict0 = @{@"name":@"hei_00",@"des":@"你追我"};
    NSDictionary *dict1 = @{@"name":@"hei_01",@"des":@"如果你"};
    NSDictionary *dict2 = @{@"name":@"hei_02",@"des":@"追上我"};
    NSDictionary *dict3 = @{@"name":@"hei_03",@"des":@"我就"};
    NSDictionary *dict4 = @{@"name":@"hei_04",@"des":@"让你"};
    NSDictionary *dict5 = @{@"name":@"hei_05",@"des":@"hhh"};
    self.imageArray = @[dict0,dict1,dict2,dict3];
    NSString *plistPath = @"/Volumes/HD/ios/就业班/第00天codePractice-就业班/第二天/02-嘿嘿嘿/02-嘿嘿嘿/image.plist";
    [dict0 writeToFile:plistPath atomically:YES];
    NSArray *arr = [NSArray  arrayWithObjects:dict0,dict1,dict2,dict3,dict4,dict5,nil];
    [arr writeToFile:plistPath atomically:YES];
/**
* step1: 设置所有控件的属性
*
*/
    //indexLabel
    UILabel *p = [[UILabel alloc]init];
    self.indexLabel = p;
    self.indexLabel.frame = CGRectMake(180, 57, 30, 30);
//    _indexLabel.backgroundColor = [UIColor blueColor];
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%d",self.index+1,6 ];
  //改字体大小/  self.indexLabel.text
    [self.view addSubview:self.indexLabel];
    //descLabel
    UILabel *p1 = [[UILabel alloc]init];
    self.descLabel = p1;
    self.descLabel.frame = CGRectMake(108, 406, 160, 50);
    self.descLabel.backgroundColor = [UIColor redColor];
    [self.descLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.descLabel];
    //nextButton
    UIButton *p2 = [UIButton new];
    self.nextButton = p2;
    self.nextButton.frame = CGRectMake(307, 406, 37, 44);
    [self.nextButton setBackgroundImage:[UIImage imageNamed:@"right_normal"]forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage imageNamed:@"right_hightlighted"] forState:UIControlStateHighlighted];
    self.nextButton.tag = 10;
    [self.view addSubview:self.nextButton];
    //previousButton
    UIButton *p3 = [UIButton new];
    self.previousButton = p3;
    self.previousButton.frame = CGRectMake(35, 406, 37, 44);
    [self.previousButton setBackgroundImage:[UIImage imageNamed:@"left_normal"]forState:UIControlStateNormal];
    [self.previousButton setBackgroundImage:[UIImage imageNamed:@"left_hightlighted"] forState:UIControlStateHighlighted];
    self.previousButton.tag = 20;
    [self.view addSubview:self.previousButton];
    //inconImage
    UIImageView *p4 = [UIImageView new];
    self.iconImage = p4;
    self.iconImage.frame = CGRectMake(80, 88, 220, 300);
    [self.iconImage setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:self.iconImage];
    
    //初始化当前面为第0页
    self.index = 0;
    //1 设置顶部的索引标签
    //2 设置中间的图片
    //3 设置下方的描述文字
    //4 设置按钮是否可以点击
    [self setLabelAndImage];
    [self.nextButton addTarget:self action:@selector(changePicture:) forControlEvents:UIControlEventTouchUpInside];
    [self.previousButton addTarget:self action:@selector(changePicture:) forControlEvents:UIControlEventTouchUpInside];
}
//tag对应button
- (void)changePicture:(UIButton*)sender{
    switch (sender.tag) {
        case 10:
            self.index ++;
            [self setLabelAndImage];
            break;
        case 20:
            self.index --;
            [self setLabelAndImage];
        default:
            break;
    }
}

- (void)setLabelAndImage{
    //修改各标签内容
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,(unsigned long)self.imageArray.count];
    self.iconImage.image = [UIImage imageNamed:[self.imageArray[self.index] valueForKey:@"name"]];
    self.descLabel.text = [self.imageArray[self.index] valueForKey:@"des"];
    
    self.nextButton.enabled = (self.index != (self.imageArray.count-1));
    self.previousButton.enabled = (self.index != 0);
    
//    self.iconImage.image = [UIImage imageNamed:[NSString stringWithFormat: @"hei_%02d",self.index]];
//    switch (self.index) {
//        case 0:
//            self.descLabel.text = @"你追我";
//            break;
//        case 1:
//            self.descLabel.text = @"如果你";
//            break;
//        case 2:
//            self.descLabel.text = @"追上我";
//            break;
//        case 3:
//            self.descLabel.text = @"我就";
//            break;
//        case 4:
//            self.descLabel.text = @"让你";
//            break;
//        case 5:
//            self.descLabel.text = @"hhh";
//            break;
//        default:
//            break;
//    }
//    self.nextButton.enabled = (self.index!=5);
//    self.previousButton.enabled = (self.index!=0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end