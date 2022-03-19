
class ChickenRice {  
  const ChickenRice({required this.title, required this.image, required this.routename});  
  final String title;  
  final String image;  
  final routename;
}  
  
 List<ChickenRice> chicken = <ChickenRice>[  
  const ChickenRice(title: '     BBQ Chicken Rice \n               RM 12', image: 'assets/images/ChickenRice/1.jpg', routename: ('/BBQChickenRice')),
  const ChickenRice(title: '     Haineese Chicken Rice \n                   RM 10', image: 'assets/images/ChickenRice/2.jpg', routename: (null)),
  const ChickenRice(title: '     BBQ Chicken \n          RM 15', image: 'assets/images/ChickenRice/3.jfif', routename: (null)),
  const ChickenRice(title: '     Steamed Chicken Rice \n                 RM 12', image: 'assets/images/ChickenRice/4.jpg', routename: (null)),
  const ChickenRice(title: '     Coffee \n      RM 5', image: 'assets/images/ChickenRice/5.jpg', routename: (null)),
  const ChickenRice(title: '     Ice Lemon Tea \n              RM 3', image: 'assets/images/ChickenRice/6.jpg', routename: (null)),
  const ChickenRice(title: '     Water \n      RM 1', image: 'assets/images/ChickenRice/7.jpg', routename: (null)),
  const ChickenRice(title: '     Soft Drink \n         RM 2', image: 'assets/images/ChickenRice/8.jpg', routename: (null)),
];  